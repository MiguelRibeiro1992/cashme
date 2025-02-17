package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pt.upskill.CashMe.models.ItemModel;
import pt.upskill.CashMe.services.ItemService;

@Controller
public class PublicController {

    @Autowired
    private ItemService itemService;

    @GetMapping("/home")
    public String homePage() {
        return "home";
    }

    @GetMapping("/mainPage")
    public String mainPage() {
        return "mainPage";
    }

    @GetMapping("/item")
    public String itemPage(Model model) {
        ItemModel itemModel = itemService.getItemById(1); // Supondo que você tenha um serviço para buscar o item
        model.addAttribute("item", itemModel);
        return "item";
    }


}
