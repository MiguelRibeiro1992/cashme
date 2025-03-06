package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.CashMe.entities.Cart;
import pt.upskill.CashMe.entities.PaymentReference;

@Repository
public interface PaymentReferenceRepository extends JpaRepository <PaymentReference, Long> {
    PaymentReference findByCart(Cart activeCart);
}
