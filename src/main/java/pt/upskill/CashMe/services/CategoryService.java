package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.models.AddCategoryModel;

import java.util.List;

public interface CategoryService {

    // Buscar todas as categorias (ativas e inativas)
    List<Category> getAllCategories();

    // Buscar apenas as categorias ativas na mainPage
    List<Category> getActiveCategories();

    // Buscar uma categoria pelo ID
    Category getCategoryById(Long categoryId);

    // Criar uma nova categoria (apenas admin pode chamar este método)
    Category addCategory(AddCategoryModel categoryModel);

    // Editar uma categoria (apenas admin pode mudar o nome)
    Category editCategory(Long categoryId, String newName);

    // Remover uma categoria (apenas admin pode executar esta ação)
    void deleteCategory(Long categoryId);

    void saveCategory(Long id, String name);

}