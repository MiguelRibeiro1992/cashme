package pt.upskill.CashMe.controllers;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.services.CartServiceImpl;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CartController {

    @Autowired
    private CartServiceImpl cartService;

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private HttpSession session;

    @GetMapping("/addToCart")
    public String addToCart(@RequestParam("barcode") String barcode, Model model) {
        boolean added = cartService.addItemToCart(barcode);
        if (!added) {
            model.addAttribute("error", "Produto não encontrado");
            return "redirect:/cart";
        }
        return "redirect:/cart";
    }

    @GetMapping("/getProductByBarcode")
    public ResponseEntity<Item> getProductByBarcode(@RequestParam String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        if (item != null) {
            return ResponseEntity.ok(item);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @GetMapping("/cart")
    public String showCart(Model model) {
        List<Item> cartItems = cartService.getCartItems();

        double totalPrice = 0;

        for (Item item : cartItems) {
            totalPrice += item.getPrice() * item.getQuantity();
        }

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalPrice", totalPrice);

        return "cart";
    }

}
