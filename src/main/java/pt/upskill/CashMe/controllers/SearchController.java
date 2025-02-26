package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.services.ItemServiceImpl;

import java.util.List;

@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private ItemServiceImpl itemService;

    @GetMapping
    public String search(@RequestParam("query") String query, Model model){
        List<Item> searchResults = itemService.searchItems(query);
        model.addAttribute("searchResults", searchResults);
        return "searchResults";
    }

}
