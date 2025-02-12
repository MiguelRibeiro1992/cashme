package pt.upskill.CashMe.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import pt.upskill.CashMe.models.SignUpModel;

@Entity
public class User {

    private String username;
    private String password;
    private String name;
    private String email;


    public User() {
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public User(SignUpModel signUp) {
        this.username = signUp.getUsername();
        this.password = signUp.getPassword();
        this.name = signUp.getName();
        this.email = signUp.getEmail();

    }

    @Id
    @GeneratedValue
    private Long id;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public boolean isAdmin () {
        return false;
    }
}
