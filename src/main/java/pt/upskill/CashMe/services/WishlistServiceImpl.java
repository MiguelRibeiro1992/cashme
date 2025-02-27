package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.entities.Wishlist;
import pt.upskill.CashMe.models.WishlistModel;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.repositories.UserRepository;
import pt.upskill.CashMe.repositories.WishlistRepository;

import java.util.Optional;

@Service
public class WishlistServiceImpl implements WishlistService {

    @Autowired
    private WishlistRepository wishlistRepository;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ItemRepository itemRepository;
    @Autowired
    private ItemServiceImpl itemServiceImpl;


    // Busca a wishlist de um utilizador
    @Override
    public Wishlist getWishlistByUser(User user) {
        Optional<Wishlist> wishlistOpt = wishlistRepository.findByUser(user);
        if(wishlistOpt.isEmpty()) {
            Wishlist wishlist = new Wishlist(user);
            return wishlistRepository.save(wishlist);
        }
        return wishlistOpt.get();
    }

    // Adiciona ou remove um item dos favoritos
    @Override
    public Wishlist toggleFavorito(User user, Item item) {
        Wishlist wishlist = wishlistRepository.findByUser(user).orElse(new Wishlist(user));
        wishlist.toggleFavorito(item);
        return wishlistRepository.save(wishlist);
    }

    @Override
    public boolean isInWishlist(Long id) {
        User currentUser = userService.getCurrentUser();
        Wishlist wishlist = getWishlistByUser(currentUser);
        return wishlist.getItems().stream().anyMatch(item -> item.getId() == id);
    }

}