package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pt.upskill.CashMe.entities.User;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    // Busca um utilizador pelo username (se realmente for usado)
    Optional<User> findByUsername(String username);

    // Alternativamente, buscar pelo email, que geralmente é único
    Optional<User> findByEmail(String email);
}