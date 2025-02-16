package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.services.ItemServiceImpl;


@Controller
public class AdminController {

    @Autowired
    private ItemServiceImpl itemService;

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
        model.addAttribute("items", itemService.findAll());
        model.addAttribute("item", new Item("", "", 0.0));
        return "manageItems";
    }

    //Adicionar o produto mesmo
    @PostMapping("/items")
    public String addProduct (@ModelAttribute("item") Item item) {
        itemService.save(item);
        return "redirect:/manageItems";
    }
}