package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.services.CartServiceImpl;
import pt.upskill.CashMe.services.ItemServiceImpl;
import pt.upskill.CashMe.services.QRCodeServiceImpl;

//Assim o carrinho está a dar
@Controller
public class CartController {

    @Autowired
    private CartServiceImpl cartService;

    @Autowired
    private ItemServiceImpl itemService;

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private QRCodeServiceImpl qrCodeService;

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

    // Para remover?? Não está a funcionar
    @DeleteMapping("/remove")
    public ResponseEntity<String> removeItem(@RequestParam("barcode") String barcode) {
        cartService.removeItemFromCart(barcode);
        return ResponseEntity.ok("Item removido com sucesso");
    }

    @GetMapping("/checkout")
    public String checkout(Model model) {
        Cart cart = cartService.getCart();
        model.addAttribute("cartItems", cart.getCartItems());
        model.addAttribute("totalPrice", cart.getTotalPrice());
        return "checkout";
    }

    // Endpoint para gerar QR Code para checkout
    @GetMapping("/checkout/qrcode")
    public ResponseEntity<byte[]> generateQrCode() {
        String checkoutUrl = "http://localhost:8080/checkout";
        byte[] qrCodeImage = qrCodeService.generateQRCode(checkoutUrl, 250, 250);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(org.springframework.http.MediaType.IMAGE_PNG);

        return new ResponseEntity<>(qrCodeImage, headers, HttpStatus.OK);
    }
}