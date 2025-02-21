package pt.upskill.CashMe.entities;

import jakarta.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "wishlist")
public class Wishlist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ElementCollection
    private Set<Integer> favoritos = new HashSet<>();

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user; // Associação com o utilizador

    public Wishlist() {}

    public Wishlist(User user) {
        this.user = user;
    }

    public void toggleFavorito(int itemId) {
        if (favoritos.contains(itemId)) {
            favoritos.remove(itemId);
        } else {
            favoritos.add(itemId);
        }
    }

    public boolean isFavorito(int itemId) {
        return favoritos.contains(itemId);
    }

    public Set<Integer> getFavoritos() {
        return favoritos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setFavoritos(Set<Integer> favoritos) {
        this.favoritos = favoritos;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}