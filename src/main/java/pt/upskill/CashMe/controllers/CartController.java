package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.CashMe.entities.*;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.services.*;

import java.time.LocalDate;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartServiceImpl cartService;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private PurchaseServiceImpl purchaseService;

    @GetMapping
    public ModelAndView showCart() {
        ModelAndView mav = new ModelAndView("cart");
        Cart cart = cartService.getCart();

        if (cart != null) {
            mav.addObject("cartItems", cart.getItems());
            mav.addObject("totalPrice", cartService.getTotalPrice());
        } else {
            mav.addObject("cartItems", Map.of());
            mav.addObject("totalPrice", 0.0);
        }

        return mav;
    }

    @GetMapping("/addToCart")
    @ResponseBody
    public String addToCart(@RequestParam("barcode") String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        if (item == null) {
            throw new IllegalArgumentException("Product not found");
        }
        cartService.addItemToCart(barcode);
        return "ok";
    }

    @GetMapping("/addItemToCart")
    @ResponseBody
    public String addItemToCart(@RequestParam("itemId") Long itemId, @RequestParam("quantity") int quantity) {
        if (itemId == null || quantity < 1) {
            return "error: Parâmetros inválidos.";
        }
        cartService.addItemToCartById(itemId, quantity);
        return "ok";
    }

    @GetMapping("/increaseQuantity")
    public String increaseQuantity(@RequestParam("barcode") String barcode, RedirectAttributes redirectAttributes) {
        Item item = itemRepository.findByBarcode(barcode);

        if (item == null || item.getQuantity() <= 0) {
            redirectAttributes.addFlashAttribute("error", "Stock insuficiente.");
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

    @GetMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("barcode") String barcode) {
        cartService.removeItemFromCart(barcode);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String checkout(Model model) {
        Cart cart = cartService.getCart();

        if (cart != null) {
            model.addAttribute("cartItems", cart.getItems());
            model.addAttribute("totalPrice", cartService.getTotalPrice());

            PaymentReference paymentReference = cartService.createPaymentReference(cart);
            model.addAttribute("paymentReference", paymentReference);
        } else {
            model.addAttribute("cartItems", Map.of());
            model.addAttribute("totalPrice", 0.0);
        }

        return "checkout";
    }

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
            purchase.setTotal(cartService.getTotalPrice());
            purchase.setStatus("Pago");

            purchaseService.save(purchase);
        }
        cartService.clearCart();
        return "redirect:/mainPage";
    }
}