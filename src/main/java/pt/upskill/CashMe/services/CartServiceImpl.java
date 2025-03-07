package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.PaymentReference;
import pt.upskill.CashMe.repositories.CartRepository;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.repositories.PaymentReferenceRepository;

import java.util.Map;
import java.util.Random;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private PaymentReferenceRepository paymentReferenceRepository;

    @Override
    public Cart getCart() {
        return cartRepository.findActiveCart();
    }

    @Override
    public void addItemToCart(String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        if (item != null) {
            if (item.getQuantity() < 1) {
                item.setQuantity(0);
                itemRepository.save(item);
                return;
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

            invalidatePaymentReference(activeCart);
        }
    }

    @Override
    public void addItemToCartById(Long itemId, int quantity) {
        Item item = itemRepository.findById(itemId).orElse(null);
        if (item.getQuantity() < 1) {
            item.setQuantity(0);
            itemRepository.save(item);
            return;
        }

        Cart activeCart = cartRepository.findActiveCart();
        if (activeCart == null) {
            activeCart = new Cart();
            cartRepository.save(activeCart);
        }

        if (item.getQuantity() < quantity) {
            activeCart.addItem(item, item.getQuantity());
            cartRepository.save(activeCart);
            item.setQuantity(item.getQuantity() - item.getQuantity());
            itemRepository.save(item);
        } else {
            activeCart.addItem(item, quantity);
            cartRepository.save(activeCart);
            item.setQuantity(item.getQuantity() - quantity);
            itemRepository.save(item);

            invalidatePaymentReference(activeCart);
        }
    }

    @Override
    public double getTotalPrice() {
        Cart activeCart = cartRepository.findActiveCart();
        if (activeCart == null || activeCart.getItems().isEmpty()) {
            return 0.0;
        }

        double total = 0.0;

        for (Map.Entry<Item, Integer> entry : activeCart.getItems().entrySet()) {
            total += entry.getKey().getPrice() * entry.getValue();
        }

        return total;
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

                    item.setQuantity(item.getQuantity() + 1);
                    itemRepository.save(item);
                    cartRepository.save(activeCart);

                    invalidatePaymentReference(activeCart);
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

                    invalidatePaymentReference(activeCart);
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

            invalidatePaymentReference(activeCart);
        }
    }

    @Override
    public PaymentReference createPaymentReference(Cart cart) {
        Cart activeCart = cartRepository.findActiveCart();

        if (activeCart == null) {
            return null;
        }

        double totalPrice = getTotalPrice();
        String entity = "99999";
        String reference = String.format("%09d", new Random().nextInt(1_000_000_000));

        PaymentReference existingPaymentReference = paymentReferenceRepository.findByCart(activeCart);
        if (existingPaymentReference != null) {
            return existingPaymentReference;
        }

        PaymentReference paymentReference = new PaymentReference(entity, reference, totalPrice, activeCart);
        return paymentReferenceRepository.save(paymentReference);
    }

    @Override
    public Cart pay(String entity, String reference, Double amount) {
        PaymentReference paymentReference = paymentReferenceRepository.findByReference(reference);
        Cart cart = paymentReference.getCart();
        if (cart == null) {
            throw new IllegalArgumentException("Carrinho não encontrado.");
        }

        cart.setPaid(true);
        cartRepository.save(cart);

        paymentReferenceRepository.delete(paymentReference);

        return cart;
    }

    private void invalidatePaymentReference (Cart cart) {
        PaymentReference paymentReference = paymentReferenceRepository.findByCart(cart);
        if (paymentReference != null) {
            paymentReferenceRepository.delete(paymentReference);
        }
    }
}