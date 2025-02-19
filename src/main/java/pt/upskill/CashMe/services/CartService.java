package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.CartItem;

import java.util.List;

public interface CartService {
    public List<CartItem> getCartItems();
    public double getTotalPrice();
    public void addItemToCart(String barcode);
    public void removeItemFromCart(String barcode);
    public Cart getCart();
}
