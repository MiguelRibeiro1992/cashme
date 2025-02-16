package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.CashMe.models.AddCategoryModel;
import pt.upskill.CashMe.services.CategoryService;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    /**
     * Obtém a lista de todas as categorias e envia-as para a vista.
     * Agora usa `getAllCategories()` pois as categorias são globais.
     */
    @GetMapping
    public ModelAndView categoryList() {
        ModelAndView mav = new ModelAndView("categories");
        mav.addObject("categories", categoryService.getAllCategories());
        return mav;
    }

    @GetMapping("/mainPage")
    public ModelAndView carregarMainPage() {
        ModelAndView mav = new ModelAndView("mainPage");
        mav.addObject("todasCategorias", categoryService.getAllCategories()); // Envia todas as categorias para a mainPage
        return mav;
    }

    /**
     * Adiciona uma nova categoria.
     * Apenas administradores podem executar esta ação.
     */
    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/add")
    public String addCategory(@ModelAttribute AddCategoryModel categoryModel) {
        categoryService.addCategory(categoryModel);
        return "redirect:/categories";
    }

    /**
     * Edita o nome de uma categoria existente.
     * Apenas administradores podem modificar categorias.
     */
    @PreAuthorize("hasRole('ADMIN')")
    @PutMapping("/edit/{id}")
    public String editCategory(@PathVariable Long id, @RequestParam String newName) {
        categoryService.editCategory(id, newName);
        return "redirect:/categories";
    }
}