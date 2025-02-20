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

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ItemRepository itemRepository;

    private Cart activeCart = new Cart();

    @Override
    public void addItemToCart(String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        if (item != null) {
            activeCart.addItem(item);
        }
    }

    @Override
    public void removeItemFromCart(String barcode) {
        if (activeCart != null) {
            activeCart.removeItem(barcode);
        }
    }

    @Override
    public List<CartItem> getCartItems() {
        return activeCart.getCartItems();
    }

    @Override
    public double getTotalPrice() {
        return activeCart.getTotalPrice();
    }

    @Override
    public Cart getCart() {
        return activeCart;
    }

}
