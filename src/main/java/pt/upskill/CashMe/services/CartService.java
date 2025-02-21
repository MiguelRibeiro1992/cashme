package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.Item;

import java.util.List;

public interface CartService {
    public List<Item> getCartItems();
    public List<Item> findAllCartItems();

    public double getTotalPrice();

    public void addItemToCart(String barcode);
    public void removeItemFromCart(String barcode);
    public Cart getCart();
}
