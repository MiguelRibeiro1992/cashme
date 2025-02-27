package pt.upskill.CashMe.controllers;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.entities.Wishlist;
import pt.upskill.CashMe.models.ItemModel;
import pt.upskill.CashMe.models.WishlistModel;
import pt.upskill.CashMe.repositories.UserRepository;
import pt.upskill.CashMe.services.ItemService;
import pt.upskill.CashMe.services.StoreService;
import pt.upskill.CashMe.services.UserService;
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
    @Autowired
    private UserService userService;

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

    @GetMapping("/underConstruction")
    public String underConstruction() {
        return "underConstruction";
    }

    @GetMapping("/storeView")
    public String storeView() {
        return "storeView";
    }

    @GetMapping("/item/{id}")
    public String itemPage(@PathVariable("id") Item item, Model model) {
        if (item != null) {
            model.addAttribute("item", item);

            List<Store> stores = storeService.findStoresByItem(item); // Obtém a loja correspondente ao item
            model.addAttribute("stores", stores);
        } else {
            model.addAttribute("error", "Item não encontrado");
        }
        return "item";
    }

    @GetMapping("/items")
    public String itemsPage(Model model) {
        List<Item> items = itemService.findAll(); // Buscar todos os itens
        model.addAttribute("items", items);
        return "allItemView"; // Retornar para a página "items.jsp"
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

    @GetMapping("/contacts")
    public String contacts() {
        return "contacts";
    }


    @GetMapping("/wishlist")
    public String getWishlist(Model model) {
        Wishlist wishlist = wishlistService.getWishlistByUser(userService.getCurrentUser());

        if (wishlist != null) {
            model.addAttribute("wishlist", wishlist);
        } else {
            model.addAttribute("error", "Wishlist não encontrada.");
        }

        return "wishlist"; // Criar uma página para exibir os favoritos
    }

    @PostMapping("/wishlist/toggle/{itemId}")
    public String toggleWishlist(@PathVariable("itemId") Item item, Model model) {
        Wishlist updatedWishlist = wishlistService.toggleFavorito(userService.getCurrentUser(), item);
        model.addAttribute("wishlist", updatedWishlist);
        return "redirect:/wishlist"; // Atualiza a página dos favoritos
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

    @GetMapping("/settings")
    public String settings() {
        return "settings";
    }

    @GetMapping("/paymentMethods")
    public String paymentMethods(){
        return "paymentMethods";
    }

    @GetMapping("/history")
    public String history(){
        return "history";
    }

    @GetMapping("/privacy-policy")
    public String privacyPolicy() { return "privacyPolicy";}

    @GetMapping("/terms")
    public String showTerms() {
        return "terms";
    }
    @GetMapping("/faq")
    public String showFAQ() {
            return "faq";
        }

    @GetMapping("/redirectToMainPage")
    public String redirectToMainPage(Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated()) {
            return "redirect:/mainPage"; // Vai para a página principal se estiver logado
        } else {
            return "redirect:/login"; // Redireciona para login se não estiver autenticado
        }
    }

    @GetMapping("/stores")
    public String showAllStores(Model model) {
        List<Store> stores = storeService.findAllStores(); // Buscar todas as lojas
        model.addAttribute("stores", stores);
        return "allStoresView"; // Nome da página JSP
    }

    @GetMapping("/availableSoon")
    public String availableSoon() {
        return "availableSoon";
    }


}
