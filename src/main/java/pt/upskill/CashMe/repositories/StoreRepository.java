package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pt.upskill.CashMe.entities.Store;

@Repository
public interface StoreRepository  extends JpaRepository <Store, Long> {

    Store findByName(String name);

    Store findByImageUrl(String imageUrl);

    @Query("SELECT s FROM Store s JOIN s.items i WHERE i.id = :itemId")
    Store findStoreByItemId(@Param("itemId") Long itemId);

}
