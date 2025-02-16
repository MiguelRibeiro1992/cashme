package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Item;

import java.util.List;

public interface ItemService {

    public void save(Item item);

    public List<Item> findAll();
}
