package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.CashMe.models.AddCategoryModel;
import pt.upskill.CashMe.repositories.CategoryRepository;
import pt.upskill.CashMe.services.CategoryService;
import pt.upskill.CashMe.services.CategoryServiceImpl;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryServiceImpl categoryService;

    @Autowired
    private CategoryRepository categoryRepository;

    /**
     * Obtém a lista de todas as categorias e envia-as para a vista.
     * Agora usa `getAllCategories()` pois as categorias são globais.
     */
    @GetMapping
    public ModelAndView categoryList() {
        ModelAndView mav = new ModelAndView("categories/categories");
        mav.addObject("categories", categoryService.getActiveCategories()); // Apenas categorias ativas
        return mav;
    }

    @GetMapping("/mainPage")
    public ModelAndView carregarMainPage() {
        ModelAndView mav = new ModelAndView("mainPage");
        mav.addObject("todasCategorias", categoryService.getAllCategories()); // Envia todas as categorias para a mainPage
        return mav;
    }



}