package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Item;

import java.util.List;

public interface CartService {

    public List<Item> getCartItems();

    public double getTotalPrice();

    public boolean addItemToCart(String barcode);

}
