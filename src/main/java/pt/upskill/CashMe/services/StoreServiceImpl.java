package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.repositories.StoreRepository;

import java.util.List;
import java.util.Optional;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreRepository storeRepository;


    @Override
    public List<Store> findAllStores() {
        return storeRepository.findAll();
    }

    @Override
    public Optional<Store> findStoreById(Long id) {
        return storeRepository.findById(id);
    }

    @Override
    public Store saveStore(Store store) {
        return storeRepository.save(store);
    }
}
