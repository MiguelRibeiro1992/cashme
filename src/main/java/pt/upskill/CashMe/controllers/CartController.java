package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.services.CartServiceImpl;

@Controller
public class CartController {

    @Autowired
    private CartServiceImpl cartService;

    @GetMapping("/cart")
    public String showCart (Model model){
        model.addAttribute("cartItems", cartService.getCartItems());
        model.addAttribute("totalPrice", cartService.getTotalPrice());
        return "cart";
    }

    @GetMapping("/addToCart")
    public String addToCart(@RequestParam("barcode") String barcode, @RequestParam("name") String name, @RequestParam("price") double price) {
        cartService.addToCart(new Item(barcode, name, price, 1));
        return "redirect:/cart";
    }

    @GetMapping("/removeFromCart")
    public String removeFromCart(@RequestParam("barcode") String barcode) {
        cartService.removeFromCart(barcode);
        return "redirect:/cart";
    }

    @GetMapping("/clearCart")
    public String clearCart() {
        cartService.clearCart();
        return "redirect:/cart";
    }

}
