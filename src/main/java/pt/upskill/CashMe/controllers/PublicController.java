package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.models.ItemModel;
import pt.upskill.CashMe.models.WishlistModel;
import pt.upskill.CashMe.repositories.UserRepository;
import pt.upskill.CashMe.services.ItemService;
import pt.upskill.CashMe.services.StoreService;
import pt.upskill.CashMe.services.WishlistService;

import java.util.List;

@Controller
public class PublicController {

    @Autowired
    private ItemService itemService;

    @Autowired
    private StoreService storeService;

    @Autowired
    private WishlistService wishlistService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String homePage() {
        return "home";
    }

    @GetMapping("/mainPage")
    public String mainPage(Model model) {
        List<Item> items = itemService.findAll();
        model.addAttribute("stores", storeService.findAllStores());
        model.addAttribute("items", items);
        return "mainPage";
    }

    @GetMapping("/storeView")
    public String storeView() {
        return "storeView";
    }

    @GetMapping("/item/{id}")
    public String itemPage(@PathVariable Long id, Model model) {
        Item item = itemService.getItemById(id);
        if (item != null) {
            model.addAttribute("item", item);

            Store store = storeService.findStoreByItemId(id); // Obtém a loja correspondente ao item
            model.addAttribute("store", store);
        } else {
            model.addAttribute("error", "Item não encontrado");
        }
        return "item";
    }

    @GetMapping("/items")
    public String itemsPage(Model model) {
        List<Item> items = itemService.findAll(); // Buscar todos os itens
        model.addAttribute("items", items);
        return "items"; // Retornar para a página "items.jsp"
    }


    @GetMapping("/storeView/{id}")
    public String storeView(@PathVariable Long id, Model model) {
        Store store = storeService.findStoreById(id);
        if (store != null) {
            model.addAttribute("store", store);
            model.addAttribute("items", store.getItems());
        } else {
            model.addAttribute("error", "Store not found");
        }
        return "storeView";
    }

    @GetMapping("/aboutUs")
    public String aboutUs() {
        return "aboutUs";
    }
    @GetMapping("/wishlist")
    public String getWishlist(Authentication authentication, Model model) {
        Long userId = getUserIdFromAuthentication(authentication);
        return getWishlist(userId, model);
    }

    private Long getUserIdFromAuthentication(Authentication authentication) {
        return userRepository.findByUsername(authentication.getName()).getId();
    }

    @GetMapping("/contacts")
    public String contacts() {
        return "contacts";
    }


    @GetMapping("/wishlist/{userId}")
    public String getWishlist(@PathVariable Long userId, Model model) {
        WishlistModel wishlist = wishlistService.getWishlistByUserId(userId);

        if (wishlist != null) {
            model.addAttribute("wishlist", wishlist);
        } else {
            model.addAttribute("error", "Wishlist não encontrada.");
        }

        return "wishlist"; // Criar uma página para exibir os favoritos
    }

    @PostMapping("/wishlist/toggle/{userId}/{itemId}")
    public String toggleWishlist(@PathVariable Long userId, @PathVariable int itemId, Model model) {
        WishlistModel updatedWishlist = wishlistService.toggleFavorito(userId, itemId);

        model.addAttribute("wishlist", updatedWishlist);
        return "wishlist"; // Atualiza a página dos favoritos
    }

    @GetMapping("/messageSubmit")
    public String messageSubmit() {
        return "messageSubmit";
    }

    @GetMapping("/storesMap")
    public String storesMap() {
        return "storesMap";
    }

    @GetMapping("/account")
    public String account() {
        return "account";
    }

}
