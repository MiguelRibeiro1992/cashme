package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.repositories.StoreRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreRepository storeRepository;


    @Override
    public List<Store> findAllStores() {
        return storeRepository.findAll();
    }


    @Override
    public Store findStoreById(Long id) {
        System.out.println("store found" + storeRepository.findById(id).orElse(null));
        return storeRepository.findById(id).orElse(null);
    }

    @Override
    public Store findByName(String name) {
        return storeRepository.findByName(name);
    }

    @Override
    public Store findByImageUrl(String imageUrl) {
        return storeRepository.findByImageUrl(imageUrl);
    }

    @Override
    public Store saveStore(Store store) {
        return storeRepository.save(store);
    }

    @Override
    public List<Store> findStoresByItem(Item item) {
        return storeRepository.findStoresByItemsContains(item);
    }

    @Override
    public List<Store> getStoresWithStatus() {
        List<Store> stores = storeRepository.findAll();
        return stores.stream()
                .map(store -> {
                    store.getStatus(); // Atualiza status automaticamente
                    return store;
                })
                .collect(Collectors.toList());
    }


}
