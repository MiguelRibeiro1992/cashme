package pt.upskill.CashMe.services;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.models.AddCategoryModel;
import pt.upskill.CashMe.repositories.CategoryRepository;
import pt.upskill.CashMe.entities.User;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private UserServiceImpl userService; // Para verificar se o utilizador é admin

    @Override
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @Override
    public Category getCategoryById(Long categoryId) {
        // Verifica se a categoria existe antes de retornar
        return categoryRepository.findById(categoryId)
                .orElseThrow(() -> new IllegalArgumentException("Categoria não encontrada."));
    }


    @Override
    public List<Category> getActiveCategories() {
        return categoryRepository.findByIsActiveTrue();
    }

    @Override
    public Category addCategory(AddCategoryModel categoryModel) {
        User currentUser = userService.getCurrentUser();

        // Verifica se o utilizador é admin antes de criar uma nova categoria
        if (!currentUser.isAdmin()) {
            throw new SecurityException("Apenas administradores podem criar categorias.");
        }

        // Verifica se já existe uma categoria com o mesmo nome
        if (categoryRepository.existsByName(categoryModel.getName())) {
            throw new IllegalArgumentException("Já existe uma categoria com este nome.");
        }

        Category category = new Category();
        category.setName(categoryModel.getName());
        category.setActive(categoryModel.isActive()); // Definir se a categoria estará ativa na mainPage

        return categoryRepository.save(category);
    }

    @Override
    public void saveCategory(Long id, String name) {
        User currentUser = userService.getCurrentUser();

        // Apenas administradores podem criar ou editar categorias
        if (!currentUser.isAdmin()) {
            throw new SecurityException("Apenas administradores podem criar ou editar categorias.");
        }

        Category category;

        if (id != null) {
            // Se um ID for passado, significa que é uma edição
            category = categoryRepository.findById(id)
                    .orElseThrow(() -> new IllegalArgumentException("Categoria não encontrada."));
        } else {
            // Se não houver ID, é uma nova categoria
            category = new Category();
        }

        // Verifica se já existe outra categoria com o mesmo nome
        if (categoryRepository.existsByName(name) && (id == null || !category.getName().equals(name))) {
            throw new IllegalArgumentException("Já existe uma categoria com este nome.");
        }

        category.setName(name);
        String slug = name.toLowerCase().replace(" ", "-");
        category.setSlug(slug);
        categoryRepository.save(category);
    }

    @Override
    public Category getCategoryBySlug(String slug) {
        return categoryRepository.findBySlug(slug)
                .orElseThrow(() -> new IllegalArgumentException("Categoria não encontrada."));
    }

    @Override
    public Category editCategory(Long categoryId, String newName) {
        User currentUser = userService.getCurrentUser();

        // Verifica se o utilizador é admin antes de editar a categoria
        if (!currentUser.isAdmin()) {
            throw new SecurityException("Apenas administradores podem editar categorias.");
        }

        // Verifica se a categoria existe
        Optional<Category> categoryOpt = categoryRepository.findById(categoryId);
        if (categoryOpt.isEmpty()) {
            throw new IllegalArgumentException("Categoria não encontrada.");
        }

        Category category = categoryOpt.get();
        category.setName(newName); // Atualiza o nome da categoria

        return categoryRepository.save(category);
    }

    @Override
    public void deleteCategory(Long categoryId) {
        User currentUser = userService.getCurrentUser();

        // Apenas administradores podem remover categorias
        if (!currentUser.isAdmin()) {
            throw new SecurityException("Apenas administradores podem remover categorias.");
        }

        // Verifica se a categoria existe
        Optional<Category> categoryOpt = categoryRepository.findById(categoryId);
        if (categoryOpt.isEmpty()) {
            throw new IllegalArgumentException("Categoria não encontrada.");
        }

        categoryRepository.deleteById(categoryId);
    }


}