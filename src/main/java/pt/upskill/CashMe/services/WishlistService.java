package pt.upskill.CashMe.services;

import pt.upskill.CashMe.models.WishlistModel;

public interface WishlistService {
    WishlistModel getWishlistByUserId(Long userId);
    WishlistModel toggleFavorito(Long userId, int itemId);
}