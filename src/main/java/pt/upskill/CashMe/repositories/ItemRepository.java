package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;
import pt.upskill.CashMe.entities.Item;

import java.util.Optional;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {

    @Nullable
    public Item findByBarcode(String barcode);

    @Nullable
    Optional<Item> findById(Long id);

}
