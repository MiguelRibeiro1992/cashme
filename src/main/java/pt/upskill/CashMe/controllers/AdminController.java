package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.models.AddCategoryModel;
import pt.upskill.CashMe.repositories.CategoryRepository;
import pt.upskill.CashMe.repositories.ItemRepository;
import pt.upskill.CashMe.repositories.StoreRepository;
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
    @GetMapping("/adminDashboard/manageItems")
    public String listAndAddProduct(Model model) {
        List<Category> categories = categoryService.getAllCategories();
        List<Store> stores = storeService.findAllStores();
        model.addAttribute("categories", categories);
        model.addAttribute("stores", stores);
        model.addAttribute("items", itemService.findAll());
        model.addAttribute("item", new Item("", "", 0.0));
        return "manageItems";
    }

    //Adicionar o produto
    @PostMapping("/adminDashboard/manageItems")
    public String addProduct(@ModelAttribute("item") Item item,
                             @RequestParam("storeId") Long storeId,
                             @RequestParam("categoryId") Long categoryId) {
        System.out.println("Produto recebido: " + item.getName() + ", " + item.getPrice());

        Store store = storeService.findStoreById(storeId);
        if (store == null) {
            System.out.println("Erro: Loja não encontrada!");
            return "redirect:/adminDashboard/manageItems";
        }
        item.setStore(store);

        Category category = categoryService.getCategoryById(categoryId);
        if (category == null) {
            System.out.println("Erro: Categoria não encontrada!");
            return "redirect:/adminDashboard/manageItems";
        }

        item.setCategory(List.of(category));

        itemService.save(item);
        return "redirect:/manageItems";
    }


    @PostMapping("/adminDashboard/manageStores")
    public String addStore(@ModelAttribute("store") Store store) {
        storeService.saveStore(store);
        return "redirect:/adminDashboard/manageStores";
    }

    @GetMapping("/adminDashboard/manageStores")
    public String manageStores(Model model) {
        List<Store> stores = storeService.findAllStores();
        model.addAttribute("stores", stores);
        model.addAttribute("store", new Store());
        return "manageStores";
    }

    // Página de gestão de categorias
    @GetMapping("/adminDashboard/categories")
    public String manageCategories(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        return "manageCategories"; // O ficheiro deve estar em WEB-INF/views/manageCategories.jsp
    }

    @PostMapping("/adminDashboard/categories/save")
    public String saveCategory(@RequestParam(required = false) Long id, @RequestParam String name) {
        categoryService.saveCategory(id, name);
        return "redirect:/adminDashboard/categories"; // Redireciona para a lista após salvar
    }

    @PostMapping("/adminDashboard/categories/{id}")
    public String deleteCategory(@PathVariable Long id) {
        categoryService.deleteCategory(id);
        return "redirect:/adminDashboard/categories";
    }


}