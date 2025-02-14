package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pt.upskill.CashMe.entities.User;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByUsername(String username); // Agora usamos apenas o email como identificador
}