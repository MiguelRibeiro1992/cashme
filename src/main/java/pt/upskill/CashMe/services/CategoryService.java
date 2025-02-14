package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.models.AddCategoryModel;

import java.util.List;

public interface CategoryService {

    List<Category> getUserCategories();

    Category addCategory(AddCategoryModel categoryModel);
}
