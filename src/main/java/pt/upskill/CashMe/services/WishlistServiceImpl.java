package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.entities.Wishlist;
import pt.upskill.CashMe.models.WishlistModel;
import pt.upskill.CashMe.repositories.UserRepository;
import pt.upskill.CashMe.repositories.WishlistRepository;

import java.util.Optional;

@Service
public class WishlistServiceImpl implements WishlistService {

    @Autowired
    private WishlistRepository wishlistRepository;

    @Autowired
    private UserRepository userRepository;

    // Converte a entidade Wishlist para o modelo WishlistModel
    private WishlistModel toModel(Wishlist wishlist) {
        return new WishlistModel(
                wishlist.getId(),
                wishlist.getFavoritos(),
                wishlist.getUser().getId()
        );
    }

    // Busca a wishlist de um utilizador
    @Override
    public WishlistModel getWishlistByUserId(Long userId) {
        Optional<Wishlist> wishlistOpt = wishlistRepository.findByUserId(userId);
        return wishlistOpt.map(this::toModel).orElse(null);
    }

    // Adiciona ou remove um item dos favoritos
    @Override
    public WishlistModel toggleFavorito(Long userId, int itemId) {
        Wishlist wishlist = wishlistRepository.findByUserId(userId)
                .orElseGet(() -> {
                    User user = userRepository.findById(userId).orElseThrow(() ->
                            new RuntimeException("Utilizador não encontrado"));
                    return new Wishlist(user);
                });

        wishlist.toggleFavorito(itemId);
        wishlistRepository.save(wishlist);
        return toModel(wishlist);
    }
}