package pt.upskill.CashMe.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.CashMe.entities.Category;

import java.util.List;
import java.util.Optional;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

    // Procurar todas as categorias ativas para a mainPage
    List<Category> findByIsActiveTrue();

    // Verificar se já existe uma categoria com determinado nome
    boolean existsByName(String name);

    Optional<Category> findBySlug(String slug);
}