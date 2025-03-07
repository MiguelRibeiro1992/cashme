package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.services.CategoryService;
import pt.upskill.CashMe.services.ItemService;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ItemService itemService;


    @GetMapping("/{slug}")
    public String showCategory(@PathVariable String slug, Model model) {
        Category category = categoryService.getCategoryBySlug(slug);
        List<Item> items = itemService.getItemsByCategory(category);

        model.addAttribute("category", category);
        model.addAttribute("items", items);

        return "category"; // Nome da página JSP
    }

    @GetMapping("/all")
    public String getAllCategories(Model model) {
        List<Category> categories = categoryService.getAllCategories(); // Buscar todas as categorias
        model.addAttribute("categories", categories);
        return "userCategory"; // Nome da tua página JSP
    }


}