package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.CashMe.entities.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findFirstByOrderByIdAsc();
}
