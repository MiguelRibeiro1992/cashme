package pt.upskill.CashMe.entities;

import jakarta.persistence.*;
import pt.upskill.CashMe.models.SignUpModel;

import java.time.LocalDate;

@Entity
@Table(name = "users") // Mapeia explicitamente para a tabela "users"
public class User {

    @Id
    @GeneratedValue
    private Long id;

    private boolean admin;

    public User() {}

    public User(SignUpModel model) {
        this.name = model.getName();
        this.username = model.getUsername();
        this.password = model.getPassword(); //encriptar aqui!
    }

    private String name;
    private String username;
    private String password;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }
}