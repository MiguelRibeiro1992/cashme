package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.PaymentReference;

import java.util.List;

public interface CartService {

    public Cart getCart();

    public double getTotalPrice();

    public void addItemToCart(String barcode);

    public void decreaseItemQuantity(String barcode);

    public void removeItemFromCart(String barcode);

    public void clearCart();

    public void addItemToCartById(Long itemId, int quantity);

    public PaymentReference createPaymentReference(Cart cart);

    Cart pay(String entity, String reference, Double amount);
}
