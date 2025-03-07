package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.Store;

import java.util.List;

@Repository
public interface StoreRepository  extends JpaRepository <Store, Long> {

    Store findByName(String name);

    Store findByImageUrl(String imageUrl);

    List<Store> findStoresByItemsContains(Item item);

}
