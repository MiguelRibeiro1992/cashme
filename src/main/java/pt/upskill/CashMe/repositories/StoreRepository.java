package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pt.upskill.CashMe.entities.Store;

public interface StoreRepository  extends JpaRepository <Store, Long> {
}
