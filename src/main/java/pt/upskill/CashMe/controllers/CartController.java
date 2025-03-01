package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.CashMe.entities.*;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.services.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartServiceImpl cartService;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private PaymentMethodServiceImpl paymentMethodService;

    @Autowired
    private ItemRepository itemRepository;
    @Autowired
    private StoreServiceImpl storeServiceImpl;
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private ItemServiceImpl itemServiceImpl;

    @GetMapping
    public String showCart(Model model) {
        Cart cart = cartService.getCart();

        if (cart != null) {
            model.addAttribute("cartItems", cart.getItems());
            model.addAttribute("totalPrice", cart.getTotalPrice());
        } else {
            model.addAttribute("cartItems", Map.of());
            model.addAttribute("totalPrice", 0.0);
        }

        return "cart";
    }

    @GetMapping("/addToCart")
    @ResponseBody
    public String addToCart(@RequestParam("barcode") String barcode, Model model) {
        System.out.println("Barcode received (with trim): '" + barcode.trim() + "'");

        Item item = itemRepository.findByBarcode(barcode);

        if (item == null) {
            System.out.println("Item not found in the database.");
            model.addAttribute("error", "Product not found");
            throw new IllegalArgumentException("Product not found");
        }

        System.out.println("Item found: " + item.getName());
        cartService.addItemToCart(barcode);

        return "ok";
    }

    @GetMapping("/addItemToCart")
    @ResponseBody
    public String addItemToCart(@RequestParam("itemId") Long itemId, @RequestParam("quantity") int quantity) {
        if (itemId == null || quantity < 1) {
            return "error: Parâmetros inválidos.";
        }
        try {
            cartService.addItemToCartById(itemId, quantity);
            return "ok";
        } catch (IllegalArgumentException e) {
            return "error: " + e.getMessage();
        }
    }


    //Aumenta OU diminui um a um os items do carrinho com base no código de barras
    @GetMapping("/increaseQuantity")
    public String increaseQuantity(@RequestParam("barcode") String barcode, RedirectAttributes redirectAttributes) {
        Item item = itemRepository.findByBarcode(barcode);

        if (item == null || item.getQuantity() <= 0) {
            redirectAttributes.addFlashAttribute("error", "Stock insuficiente para adicionar mais deste produto.");
        } else {
            cartService.addItemToCart(barcode);
        }
        return "redirect:/cart";
    }

    @GetMapping("/decreaseQuantity")
    public String decreaseQuantity(@RequestParam("barcode") String barcode) {
        cartService.decreaseItemQuantity(barcode);
        return "redirect:/cart";
    }


    //Remove todos os items do carrinho com base no código de barras
    @GetMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("barcode") String barcode) {
        try {
            cartService.removeItemFromCart(barcode);
            System.out.println("Item removido com sucesso.");
        } catch (Exception e) {
            System.err.println("Erro ao remover item: " + e.getMessage());
        }
        return "redirect:/cart";
    }

    //Vai para a página de pagamento
    @GetMapping("/checkout")
    public String checkout(Model model) {
        Cart cart = cartService.getCart();

        if (cart != null) {
            model.addAttribute("cartItems", cart.getItems());
            model.addAttribute("totalPrice", cart.getTotalPrice());
        } else {
            model.addAttribute("cartItems", Map.of());
            model.addAttribute("totalPrice", 0.0);
        }

        User user = userService.getCurrentUser();
        List<PaymentMethod> creditCards = paymentMethodService.getUserPaymentMethods(user);
        Long lastAddedCardId= creditCards.isEmpty() ? null : creditCards.get(creditCards.size() - 1).getId();
        model.addAttribute("lastAddedCardId", lastAddedCardId);

        return "checkout";
    }

    @PostMapping("/complete")
    public String completeCheckout(Model model) {
        User user = userService.getCurrentUser();
        List<PaymentMethod> creditCards = paymentMethodService.getUserPaymentMethods(user);
        Long lastAddedCardId = creditCards.isEmpty() ? null : creditCards.get(creditCards.size() - 1).getId();

        if (lastAddedCardId == null) {
            model.addAttribute("error", "Nenhum cartão de crédito disponível.");
            return "checkout";
        }

        PaymentMethod selectedCard = paymentMethodService.findById(lastAddedCardId);
        if (selectedCard == null) {
            model.addAttribute("error", "Cartão de crédito inválido.");
            return "checkout";
        }

        return "redirect:/confirmation";
    }

    //Para limpar o carrinho quando a compra é finalizada
    @GetMapping("/clear")
    public String clearCart() {
        User user = userService.getCurrentUser();
        Cart cart = cartService.getCart();

        if (cart != null && !cart.getItems().isEmpty()) {
            Item firstItem = cart.getItems().keySet().iterator().next();
            String store = firstItem.getStore().getName();

            Purchase purchase = new Purchase();
            purchase.setUser(user);
            purchase.setDate(LocalDate.now());
            purchase.setStore(store);
            purchase.setTotal(cart.getTotalPrice());
            purchase.setStatus("Pago");

            purchaseService.save(purchase);
        }
        cartService.clearCart();
        return "redirect:/mainPage";
    }

}