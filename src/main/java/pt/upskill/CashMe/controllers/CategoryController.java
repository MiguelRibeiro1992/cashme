package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.CashMe.models.AddCategoryModel;
import pt.upskill.CashMe.services.CategoryService;

public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @GetMapping("/categories")
    public ModelAndView categoryList() {
        ModelAndView mav = new ModelAndView("categories");
        mav.addObject("categories", categoryService.getUserCategories());
        return mav;
    }

    @PostMapping("/categories/add")
    public String addCategory(AddCategoryModel categoryModel) {
        categoryService.addCategory(categoryModel);
        return "redirect:/categories";
    }

}
