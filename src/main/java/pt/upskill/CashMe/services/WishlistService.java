package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.entities.Wishlist;

public interface WishlistService {

    Wishlist getWishlistByUser(User user);
    Wishlist toggleFavorito(User user, Item item);

    boolean isInWishlist(Long id);
}