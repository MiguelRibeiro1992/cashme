package pt.upskill.CashMe.entities;

import jakarta.persistence.*;

import java.util.HashMap;
import java.util.Map;


@Entity
public class Cart {

    @Id
    @GeneratedValue
    private Long id;
    private boolean active;

    @ElementCollection
    @CollectionTable(name = "cart_items", joinColumns = @JoinColumn(name = "cart_id"))
    @MapKeyJoinColumn(name = "item_id")
    @Column(name = "quantity")
    private Map<Item, Integer> items = new HashMap<>();

    public Cart() {
        this.active = true;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Map<Item, Integer> getItems() {
        return items;
    }

    public void setItems(Map<Item, Integer> items) {
        this.items = items;
    }

    public void addItem(Item item, int quantity) {
        items.merge(item, quantity, Integer::sum);
    }

    public void removeItem(String barcode) {
        items.entrySet().removeIf(entry -> entry.getKey().getBarcode().equals(barcode));
    }

    public double getTotalPrice() {
        return items.entrySet().stream()
                .mapToDouble(entry -> entry.getKey().getPrice() * entry.getValue())
                .sum();
    }
}