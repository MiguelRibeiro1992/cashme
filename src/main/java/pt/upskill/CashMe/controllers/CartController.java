package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.services.CartServiceImpl;

import java.util.List;
import java.util.Optional;

@Controller
public class CartController {

    @Autowired
    private CartServiceImpl cartService;

    @Autowired
    private ItemRepository itemRepository;

    @GetMapping("/addToCart")
    public String addToCart(@RequestParam("barcode") String barcode, Model model) {
        boolean added = cartService.addItemToCart(barcode);
        if (!added) {
            model.addAttribute("error", "Produto não encontrado");
        }
        return "redirect:/cart";
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
