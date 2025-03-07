package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;
import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.EditItemModel;
import pt.upskill.CashMe.services.CategoryServiceImpl;
import pt.upskill.CashMe.services.ItemServiceImpl;
import pt.upskill.CashMe.services.StoreServiceImpl;
import pt.upskill.CashMe.services.UserServiceImpl;


import java.util.List;



@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ItemServiceImpl itemService;

    @Autowired
    private StoreServiceImpl storeService;

    @Autowired
    private CategoryServiceImpl categoryService;

    @Autowired
    private UserServiceImpl userService;

    // Página de login do admin
    @GetMapping("/login")
    public String adminLoginPage() {
        return "adminLogin";
    }

    @GetMapping("/logout")
    public RedirectView logout() {
        return new RedirectView("/admin/login");
    }

    // Dashboard do admin
    @GetMapping("/dashboard")
    public String adminDashboard() {
        return "adminDashboard";
    }




    //Mesma pagina para adicionar e ver lista (mudar aqui se mudar as views)
    @GetMapping("/dashboard/manageItems")
    public String listAndAddProduct(Model model) {
        List<Category> categories = categoryService.getAllCategories();
        List<Store> stores = storeService.findAllStores();
        model.addAttribute("categories", categories);
        model.addAttribute("stores", stores);
        model.addAttribute("items", itemService.findAll());
        model.addAttribute("item", new Item());
        return "manageItems";
    }

    //Adicionar o produto
    @PostMapping("/dashboard/manageItems")
    public String addProduct(EditItemModel editItem) {
        System.out.println("Produto recebido: " + editItem.getName() + ", " + editItem.getPrice());

        if (editItem.getStore() == null || editItem.getStore().getId() == null) {
            System.out.println("Erro: Loja não encontrada!");
            return "redirect:/admin/dashboard/manageItems";
        }

        //TODO iterar por cada categoria e verificar se existe

        itemService.editItem(editItem);
        return "redirect:/admin/dashboard/manageItems";
    }


    @PostMapping("/dashboard/manageStores")
    public String addStore(@ModelAttribute("store") Store store) {
        storeService.saveStore(store);
        return "redirect:/admin/dashboard/manageStores";
    }

    @GetMapping("/dashboard/manageStores")
    public String manageStores(Model model) {
        List<Store> stores = storeService.findAllStores();
        model.addAttribute("stores", stores);
        model.addAttribute("store", new Store());
        return "manageStores";
    }

    // Página de gestão de categorias
    @GetMapping("/dashboard/categories")
    public String manageCategories(Model model) {
        model.addAttribute("categories", categoryService.getAllCategories());
        return "manageCategories"; // O ficheiro deve estar em WEB-INF/views/manageCategories.jsp
    }

    @PostMapping("/dashboard/categories/save")
    public String saveCategory(@RequestParam(required = false) Long id, @RequestParam String name) {
        categoryService.saveCategory(id, name);
        return "redirect:/admin/dashboard/categories"; // Redireciona para a lista após salvar
    }

    @PostMapping("/dashboard/categories/{id}")
    public String deleteCategory(@PathVariable Long id) {
        categoryService.deleteCategory(id);
        return "redirect:/admin/dashboard/categories";
    }

    @PostMapping("/dashboard/items/{id}")
    public String deleteItem(@PathVariable Long id) {
        User currentUser = userService.getCurrentUser();
        System.out.println("Utilizador atual: " + currentUser.getUsername() + " | Role: " + currentUser.isAdmin());

        if (!currentUser.isAdmin()) {
            System.out.println("Acesso negado: Utilizador não é ADMIN.");
            return "redirect:/admin/dashboard/manageItems?error=notAdmin";
        }

        itemService.deleteItem(id);
        return "redirect:/admin/dashboard/manageItems";
    }

}