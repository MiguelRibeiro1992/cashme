package pt.upskill.CashMe.services;

import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Item;

import java.util.ArrayList;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    private List<Item> cartItems = new ArrayList<>();

    @Override
    public List<Item> getCartItems() {
        return cartItems;
    }

    @Override
    public void addToCart(Item item) {
        for (Item cartItem : cartItems){
            if (cartItem.getBarcode().equals(item.getBarcode())){
                cartItem.incrementQuantity();
                return;
            }
        }
        cartItems.add(item);
    }

    @Override
    public void removeFromCart(String barcode) {
        cartItems.removeIf(item -> item.getBarcode().equals(barcode));
    }

    @Override
    public double getTotalPrice() {
        return cartItems.stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
    }

    @Override
    public void clearCart() {
        cartItems.clear();
    }
}
