package pt.upskill.CashMe.services;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.CartRepository;
import pt.upskill.CashMe.repositories.ItemRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private HttpSession session;

    @Override
    public List<Item> getCartItems() {
        List<Item> cartItems = (List<Item>) session.getAttribute("cartItems");
        return (cartItems != null) ? cartItems : new ArrayList<>();
    }

    @Override
    public boolean addItemToCart(String barcode) {
        Item item = itemRepository.findByBarcode(barcode);

        if (item == null) {
            return false;
        }

        // Obtém o carrinho da sessão
        List<Item> cartItems = (List<Item>) session.getAttribute("cartItems");

        if (cartItems == null) {
            cartItems = new ArrayList<>();
        }

        boolean exists = false;
        for (Item cartItem : cartItems) {
            if (cartItem.getBarcode().equals(barcode)) {
                cartItem.incrementQuantity();
                exists = true;
                break;
            }
        }

        if (!exists) {
            item.setQuantity(1);
            cartItems.add(item);
        }

        session.setAttribute("cartItems", cartItems);
        return true;
    }

    @Override
    public double getTotalPrice() {
        List<Item> cartItems = getCartItems();
        double totalPrice = 0;
        for (Item item : cartItems) {
            totalPrice += item.getPrice() * item.getQuantity();
        }
        return totalPrice;
    }

}
