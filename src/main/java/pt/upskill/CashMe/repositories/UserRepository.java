package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pt.upskill.CashMe.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username); // Agora usamos apenas o email como identificador
}