package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.services.CategoryServiceImpl;
import pt.upskill.CashMe.services.ItemServiceImpl;
import pt.upskill.CashMe.services.StoreServiceImpl;

import java.util.List;
import java.util.Optional;


@Controller
public class AdminController {

    @Autowired
    private ItemServiceImpl itemService;

    @Autowired
    private StoreServiceImpl storeService;

    @Autowired
    private CategoryServiceImpl categoryService;

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
        model.addAttribute("stores", stores);
        return "manageItems";
    }

    //Adicionar o produto
    @PostMapping("/manageItems")
    public String addProduct(@ModelAttribute("item") Item item,
                             @RequestParam("storeId") Long storeId,
                             @RequestParam("category") List<Long> categoryIds) {
        System.out.println("Produto recebido: " + item.getName() + ", " + item.getPrice());
        System.out.println("IDs das Categorias recebidas: " + categoryIds);

        Optional<Store> store = storeService.findStoreById(storeId);
        store.ifPresent(item::setStore);

        List<Category> categories = categoryService.findCategoriesByIds(categoryIds);
        item.setCategory(categories);

        itemService.save(item);

        return "redirect:/manageItems";
    }


    //Adicionar depois ao public
    @GetMapping("/manageStores")
    public String manageStores(Model model) {
        List<Store> stores = storeService.findAllStores();
        model.addAttribute("stores", stores);
        model.addAttribute("store", new Store());
        return "manageStores";
    }

    @PostMapping("/stores")
    public String addStore(@ModelAttribute("store") Store store) {
        storeService.saveStore(store);
        return "redirect:/manageStores";
    }

}