package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Store;

import java.util.List;
import java.util.Optional;

public interface StoreService {

    public List<Store> findAllStores();


    public Store findStoreById(Long id);

    public Store  saveStore(Store store);
}
