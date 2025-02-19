package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.models.ItemModel;
import pt.upskill.CashMe.services.ItemService;
import pt.upskill.CashMe.services.StoreService;

import java.util.List;

@Controller
public class PublicController {

    @Autowired
    private ItemService itemService;

    @Autowired
    private StoreService storeService;

    @GetMapping("/")
    public String homePage() {
        return "home";
    }

    @GetMapping("/mainPage")
    public String mainPage(Model model) {
        model.addAttribute("stores", storeService.findAllStores());
        return "mainPage";
    }

    @GetMapping("/storeView")
    public String storeView() {
        return "storeView";
    }

    @GetMapping("/item")
    public String itemPage(Model model) {
        ItemModel itemModel = itemService.getItemById(1); // Assuming you have a service to fetch the item
        if (itemModel != null) {
            model.addAttribute("item", itemModel);
        } else {
            model.addAttribute("error", "Item not found");
        }
        return "item";
    }

    @GetMapping("/storeView/{id}")
    public String storeView(@PathVariable Long id, Model model) {
        Store store = storeService.findStoreById(id);
        if (store != null) {
            model.addAttribute("store", store);
        } else {
            model.addAttribute("error", "Store not found");
        }
        return "storeView";
    }






}
