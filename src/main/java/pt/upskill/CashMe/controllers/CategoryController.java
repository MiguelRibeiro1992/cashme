package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.models.AddCategoryModel;
import pt.upskill.CashMe.repositories.CategoryRepository;
import pt.upskill.CashMe.services.CategoryService;
import pt.upskill.CashMe.services.CategoryServiceImpl;
import pt.upskill.CashMe.services.ItemService;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ItemService itemService;

    @GetMapping
    public String category() {
        return "userCategory";
    }

    @GetMapping("/{slug}")
    public String showCategory(@PathVariable String slug, Model model) {
        Category category = categoryService.getCategoryBySlug(slug);
        List<Item> items = itemService.getItemsByCategory(category);

        model.addAttribute("category", category);
        model.addAttribute("items", items);

        return "category"; // Nome da página JSP
    }


}