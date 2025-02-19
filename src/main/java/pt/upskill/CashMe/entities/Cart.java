package pt.upskill.CashMe.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Cart {

    @Id
    @GeneratedValue
    private Long id;

    @OneToMany
    private List<CartItem> cartItems = new ArrayList<>();

    public void addItem(Item item) {
        for (CartItem cartItem : cartItems) {
            if (cartItem.getItem().getBarcode().equals(item.getBarcode())) {
                cartItem.setQuantity(cartItem.getQuantity() + 1);
                return;
            }
        }
        cartItems.add(new CartItem(item, 1));
    }

    public void removeItem(String barcode) {
        cartItems.removeIf(cartItem -> cartItem.getItem().getBarcode().equals(barcode));
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public double getTotalPrice() {
        return cartItems.stream().mapToDouble(CartItem::getTotalPrice).sum();
    }

}
