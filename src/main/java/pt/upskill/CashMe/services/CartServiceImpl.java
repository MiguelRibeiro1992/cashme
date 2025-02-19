package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.CartItem;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.CartRepository;
import pt.upskill.CashMe.repositories.ItemRepository;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    private final Cart cart = new Cart();

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ItemRepository itemRepository;

    @Override
    public boolean addItemToCart(String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        if (item != null) {
            cart.addItem(item);
            return true;
        }
        return false;
    }

    @Override
    public boolean removeItemFromCart(String barcode) {
        cart.removeItem(barcode);
        return true;
    }

    @Override
    public List<CartItem> getCartItems() {
        return cart.getCartItems();
    }

    @Override
    public double getTotalPrice() {
        return cart.getTotalPrice();
    }

    @Override
    public Cart getCart() {
        return cart;
    }
}
