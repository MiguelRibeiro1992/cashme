package pt.upskill.CashMe.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

import java.util.List;

@Entity
public class Store {

    @Id
    @GeneratedValue
    private Long id;

    private String name;
    private String location;
    private String imageUrl;

    @OneToMany
    private List<Item> items;

    public Store() {}

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Store(String name, String location, String imageUrl) {
        this.name = name;
        this.location = location;
        this.imageUrl = imageUrl;

    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public List<Item> getItems() { return items; }
    public void setItems(List<Item> items) { this.items = items; }


}
