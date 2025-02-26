package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.models.EditItemModel;
import pt.upskill.CashMe.models.ItemModel;

import java.util.List;

public interface ItemService {

    public Item getItemById(long id);

    public void editItem(EditItemModel editItem);

    public List<Item> findAll();

    void deleteItem(Long itemId);
}
