package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.CashMe.entities.Wishlist;

import java.util.List;

@Repository
public interface WishlistRepository extends JpaRepository<Wishlist, Long> {
    // List<Wishlist> findByDescriptionIgnoreCaseContaining(String search);
}
