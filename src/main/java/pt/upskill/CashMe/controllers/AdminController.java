package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.services.ItemServiceImpl;
import pt.upskill.CashMe.services.StoreServiceImpl;

import java.util.List;


@Controller
public class AdminController {

    @Autowired
    private ItemServiceImpl itemService;

    @Autowired
    private StoreServiceImpl storeService;

    // Página de login do admin
    @GetMapping("/adminLogin")
    public String adminLoginPage() {
        return "adminLogin";
    }

    // Dashboard do admin
    @GetMapping("/adminDashboard")
    public String adminDashboard() {
        return "adminDashboard";
    }


    //Mesma pagina para adicionar e ver lista (mudar aqui se mudar as views)
    @GetMapping("/manageItems")
    public String listAndAddProduct(Model model) {
        List<Store> stores = storeService.findAllStores();
        model.addAttribute("items", itemService.findAll());
        model.addAttribute("item", new Item("", "", 0.0));
        return "manageItems";
    }

    //Adicionar o produto mesmo
    @PostMapping("/items")
    public String addProduct(@ModelAttribute("item") Item item, @RequestParam("storeId") Long storeId) {
        Store store = storeService.findStoreById(storeId).orElse(null);
        if (store != null) {
            item.setStore(store);
            itemService.save(item);
        }
        return "redirect:/manageItems";
    }
}