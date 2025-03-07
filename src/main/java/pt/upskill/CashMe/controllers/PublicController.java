package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.entities.*;
import pt.upskill.CashMe.repositories.PaymentReferenceRepository;
import pt.upskill.CashMe.repositories.UserRepository;
import pt.upskill.CashMe.services.*;

import java.util.List;


@Controller
public class PublicController {

    @Autowired
    private ItemServiceImpl itemService;

    @Autowired
    private StoreServiceImpl storeService;

    @Autowired
    private WishlistServiceImpl wishlistService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private PaymentReferenceRepository paymentReferenceRepository;
    @Autowired
    private CartServiceImpl cartService;

    @GetMapping("/")
    public String homePage() {
        return "home";
    }

    @GetMapping("/mainPage")
    public String mainPage(Model model) {
        List<Item> items = itemService.findAll();
        User currentUser = userService.getCurrentUser();
        Wishlist userWishlist = wishlistService.getWishlistByUser(currentUser);
        List<Category> categories = categoryService.getAllCategories();

        // Verifica se cada item está na wishlist
        for (Item item : items) {
            boolean isInWishlist = userWishlist.getItems().contains(item);
            item.setInWishlist(isInWishlist);
        }

        model.addAttribute("stores", storeService.findAllStores());
        model.addAttribute("items", items);
        model.addAttribute("categories", categories);
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

    @GetMapping("/storeView/{id}")
    public String storeView(@PathVariable Long id, @RequestParam(value = "category", required = false) List<String> categories,
                            @RequestParam(value = "maxPrice", required = false) Integer maxPrice, Model model) {
        Store store = storeService.findStoreById(id);

        if (store != null) {
            List<Item> filteredItems = storeService.getFilteredItems(store, categories, maxPrice);

            //Vai buscar o user ativo para aceder à wishlist
            User currentUser = userService.getCurrentUser();
            Wishlist userWishlist = wishlistService.getWishlistByUser(currentUser);
            //Vê se já está na wishlist
            for (Item item : filteredItems) {
                boolean isInWishlist = userWishlist.getItems().contains(item);
                item.setInWishlist(isInWishlist);
            }

            model.addAttribute("store", store);
            model.addAttribute("items", filteredItems);
            model.addAttribute("categories", categoryService.getAllCategories());
        } else {
            model.addAttribute("error", "Store not found");
        }

        return "storeView";
    }

    @GetMapping("/item/{id}")
    public String itemPage(@PathVariable("id") Long id, Model model) {
        Item item = itemService.getItemById(id);
        if (item != null) {
            boolean inWishlist = wishlistService.isInWishlist(id);
            item.setInWishlist(inWishlist);
            model.addAttribute("item", item);

            List<Store> stores = storeService.findStoresByItem(item);
            model.addAttribute("stores", stores);
        } else {
            model.addAttribute("error", "Item não encontrado");
        }
        return "item";
    }

    @PostMapping("/item/{id}/rate/{rating}")
    @ResponseBody
    public Item rateItem(@PathVariable("id") Item item, @PathVariable("rating") Integer rating) {
        System.out.println("Rating: " + rating + " Item: " + item);
        itemService.rateItem(item, rating);
        return item;
    }

    @GetMapping("/items")
    public String itemsPage(Model model) {
        List<Item> items = itemService.findAll(); // Buscar todos os itens
        model.addAttribute("items", items);
        return "allItemView"; // Retornar para a página "items.jsp"
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

        return "wishlist";
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

    @GetMapping("/privacy-policy")
    public String privacyPolicy() {
        return "privacyPolicy";
    }

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
        List<Store> stores = storeService.findAllStores();
        model.addAttribute("stores", stores);
        return "allStoresView";
    }

    @GetMapping("/availableSoon")
    public String availableSoon() {
        return "availableSoon";
    }

    @GetMapping("/atm")
    public String atm() { return "atm"; }

    @PostMapping("/atm/pay")
    @ResponseBody
    public Cart atmPay(String entity, String reference, Double amount) {
        System.out.println(entity + " " + reference + " " + amount);

        if (entity == null || reference == null || amount == null){
            throw new IllegalArgumentException("Todos os campos são obrigatórios.");
        }

        PaymentReference paymentReference = paymentReferenceRepository.findByReference(reference);
        if (paymentReference == null) {
            throw new IllegalArgumentException("Referência não encontrada.");
        }

        Cart cart = cartService.pay(entity, reference, amount);
        return cart;
    }
}