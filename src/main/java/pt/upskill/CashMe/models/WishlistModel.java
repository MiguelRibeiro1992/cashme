package pt.upskill.CashMe.models;

import java.util.Set;

public class WishlistModel {
    private Long id;
    private Set<Integer> favoritos;
    private Long userId;

    public WishlistModel() {}

    public WishlistModel(Long id, Set<Integer> favoritos, Long userId) {
        this.id = id;
        this.favoritos = favoritos;
        this.userId = userId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set<Integer> getFavoritos() {
        return favoritos;
    }

    public void setFavoritos(Set<Integer> favoritos) {
        this.favoritos = favoritos;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}