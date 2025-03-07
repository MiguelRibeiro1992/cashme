package pt.upskill.CashMe.entities;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "wishlist")
public class Wishlist {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToMany
    private List<Item> items = new ArrayList<>();

    @OneToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user; // Associação com o utilizador

    public Wishlist() {}

    public Wishlist(User user) {
        this.user = user;
    }

    public void toggleFavorito(Item item) {
        if (items.contains(item)) {
            items.remove(item);
        } else {
            items.add(item);
        }
    }

    public boolean isFavorito(Item item) {
        return items.contains(item);
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}