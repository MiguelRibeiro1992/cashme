package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.CartRepository;
import pt.upskill.CashMe.repositories.ItemRepository;

import java.util.List;
import java.util.Map;

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
            if (item.getQuantity() < 1) {
                throw new IllegalArgumentException("Requested quantity exceeds available stock.");
            }

            Cart activeCart = cartRepository.findActiveCart();
            if (activeCart == null) {
                activeCart = new Cart();
                cartRepository.save(activeCart);
            }

            activeCart.addItem(item, 1);
            cartRepository.save(activeCart);

            item.setQuantity(item.getQuantity() - 1);
            itemRepository.save(item);
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

    @Override
    public void decreaseItemQuantity(String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        if (item != null) {
            Cart activeCart = cartRepository.findActiveCart();

            if (activeCart != null) {
                Map<Item, Integer> items = activeCart.getItems();
                if (items.containsKey(item)) {
                    int quantityInCart = items.get(item);

                    if (quantityInCart > 1) {
                        items.put(item, quantityInCart - 1);
                    } else {
                        items.remove(item);
                    }

                    // Devolve UM item ao stock
                    item.setQuantity(item.getQuantity() + 1);
                    itemRepository.save(item);

                    // Atualiza o carrinho
                    cartRepository.save(activeCart);
                }
            }
        }
    }

    @Override
    public void removeItemFromCart(String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        if (item != null) {
            Cart activeCart = cartRepository.findActiveCart();

            if (activeCart != null) {
                Map<Item, Integer> items = activeCart.getItems();
                if (items.containsKey(item)) {
                    int quantityInCart = items.get(item);
                    items.remove(item);

                    //Devolve os items ao stock
                    item.setQuantity(item.getQuantity() + quantityInCart);
                    itemRepository.save(item);

                    //Atualiza o carrinho
                    cartRepository.save(activeCart);
                }
            }
        }
    }

    @Override
    public void clearCart() {
        Cart activeCart = cartRepository.findActiveCart();
        if (activeCart != null) {
            activeCart.getItems().clear();
            cartRepository.save(activeCart);
        }
    }
}