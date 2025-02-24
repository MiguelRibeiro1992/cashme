package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.services.CartServiceImpl;
import pt.upskill.CashMe.services.ItemServiceImpl;

import java.util.Map;


//Assim o carrinho está a dar
@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartServiceImpl cartService;

    @Autowired
    private ItemServiceImpl itemService;

    @Autowired
    private ItemRepository itemRepository;

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

        return "checkout";
    }

}