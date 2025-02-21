package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.CartRepository;
import pt.upskill.CashMe.repositories.ItemRepository;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ItemRepository itemRepository;

    @Override
    public List<Item> findAllCartItems() {
        Cart activeCart = cartRepository.findActiveCart();
        return activeCart != null ? List.copyOf(activeCart.getItems().keySet()) : List.of();
    }

    @Override
    public void addItemToCart(String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        if (item != null) {
            Cart activeCart = cartRepository.findActiveCart();
            if (activeCart == null) {
                activeCart = new Cart();
                cartRepository.save(activeCart);
            }
            activeCart.addItem(item);
            cartRepository.save(activeCart);
        }
    }

    @Override
    public void removeItemFromCart(String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        if (item != null) {
            Cart activeCart = cartRepository.findActiveCart();
            if (activeCart != null) {
                activeCart.removeItem(barcode);
                cartRepository.save(activeCart);
            }
        }
    }

    @Override
    public List<Item> getCartItems() {
        Cart activeCart = cartRepository.findActiveCart();
        return activeCart != null ? List.copyOf(activeCart.getItems().keySet()) : List.of();
    }

    @Override
    public double getTotalPrice() {
        Cart activeCart = cartRepository.findActiveCart();
        return activeCart != null ? activeCart.getTotalPrice() : 0.0;
    }

    @Override
    public Cart getCart() {
        return cartRepository.findActiveCart();
    }
}