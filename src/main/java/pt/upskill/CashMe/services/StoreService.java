package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.Store;

import java.util.List;

public interface StoreService {

    public List<Store> findAllStores();

    public Store findStoreById(Long id);

    public Store findByName(String name);

    Store findByImageUrl(String imageUrl);

    public Store  saveStore(Store store);

    List<Store> findStoresByItem(Item item);

    List<Store> getStoresWithStatus();

    List<Item> getFilteredItems(Store store, List<String> categories, Integer maxPrice);
}
