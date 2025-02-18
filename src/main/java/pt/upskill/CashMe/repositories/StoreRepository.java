package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.CashMe.entities.Store;

@Repository
public interface StoreRepository  extends JpaRepository <Store, Long> {

    Store findByName(String name);
}
