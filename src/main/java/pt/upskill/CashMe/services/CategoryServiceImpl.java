package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.AddCategoryModel;
import pt.upskill.CashMe.repositories.CategoryRepository;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    UserService userService;

    @Override
    public List<Category> getUserCategories() {
        User user = userService.getCurrentUser();
        return categoryRepository.findAllByUser(user);
    }

    @Override
    public Category addCategory(AddCategoryModel categoryModel) {
        User user = userService.getCurrentUser();
        Category category = new Category();
        category.setUser(user);
        category.setName(categoryModel.getName());
        return categoryRepository.save(category);
    }
}
