package pt.upskill.CashMe.controllers;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.CartItem;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.services.CartServiceImpl;
import pt.upskill.CashMe.services.ItemServiceImpl;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartServiceImpl cartService;

    @Autowired
    private ItemServiceImpl itemService;

    @Autowired
    private ItemRepository itemRepository;

    @ModelAttribute("cartItems")
    public List<CartItem> initializeCartItems(HttpSession session) {
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
        if (cartItems == null) {
            cartItems = new ArrayList<>();
            session.setAttribute("cartItems", cartItems);
        }
        return cartItems;
    }

    @GetMapping("/addToCart")
    public String addToCart(@RequestParam("barcode") String barcode, Model model) {
        System.out.println("Barcode received (with trim): '" + barcode.trim() + "'");

        Item item = itemRepository.findByBarcode(barcode);

        if (item == null) {
            System.out.println("Item not found in the database.");
            model.addAttribute("error", "Produto não encontrado");
        }

        System.out.println("Item found: " + item.getName());

        cartService.addItemToCart(barcode);

        return "cart";
    }

    @GetMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("barcode") String barcode) {
        cartService.removeItemFromCart(barcode);
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String showCart(Model model) {
        Cart cart = cartService.getCart();

        model.addAttribute("cartItems", cart.getCartItems());
        model.addAttribute("totalPrice", cart.getTotalPrice());

        return "cart";
    }

    @GetMapping("/getProductByBarcode")
    @ResponseBody
    public ResponseEntity<?> getProductByBarcode(@RequestParam String barcode) {
        System.out.println("Barcode recebido: " + barcode); // Log para ver o barcode recebido
        Item item = itemRepository.findByBarcode(barcode);

        if (item == null) {
            System.out.println("Produto não encontrado no banco de dados.");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Produto não encontrado");
        }

        System.out.println("Produto encontrado: " + item.getName());
        return ResponseEntity.ok(item);
    }
}
