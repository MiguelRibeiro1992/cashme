package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.models.EditItemModel;
import pt.upskill.CashMe.models.ItemModel;

import java.util.List;

public interface ItemService {

    Item getItemById(long id);

    void editItem(EditItemModel editItem);

    List<Item> findAll();

    void deleteItem(Long itemId);

    public List<Item> searchItems(String query);

    List<Item> getItemsByCategory(Category category);

    public List<Item> getAllItemsSortedByPrice();
}
