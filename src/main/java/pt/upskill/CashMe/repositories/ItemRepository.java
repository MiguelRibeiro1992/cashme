package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;
import pt.upskill.CashMe.entities.Item;

import java.util.Optional;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {

    Item findByName(String name);

    //Item findByBarcode(String barcode);

    @Query("SELECT i FROM Item i WHERE LOWER(i.barcode) = LOWER(:barcode)")
    Item findByBarcode(@Param("barcode") String barcode);

    @Nullable
    Optional<Item> findById(Long id);
}
