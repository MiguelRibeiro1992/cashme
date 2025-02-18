package pt.upskill.CashMe.entities;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Category {

    @Id
    @GeneratedValue // Garante que o ID é gerado corretamente no banco
    private Long id;

    @Column(unique = true, length = 100, nullable = false) // Nome único e obrigatório
    private String name;

    @Column(nullable = false)
    private boolean isActive; // Indica se a categoria está ativa na mainPage

    @ManyToMany(mappedBy = "category", cascade = {CascadeType.MERGE, CascadeType.PERSIST})
    private List<Item> items = new ArrayList<>();


    // Construtor padrão obrigatório para JPA
    public Category() {
    }

    // Construtor para inicializar rapidamente
    public Category(String name, boolean isActive) {
        this.name = name;
        this.isActive = isActive;
    }

    // Getters e Setters
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) { // Melhor nome para o setter
        this.isActive = isActive;
    }

    public void setActive(boolean active) {
        this.isActive = active;
    }
}

