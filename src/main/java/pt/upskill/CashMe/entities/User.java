package pt.upskill.CashMe.entities;

import jakarta.persistence.*;
import pt.upskill.CashMe.models.SignUpModel;

@Entity
@Table(name = "users") // Mapeia explicitamente para a tabela "users"
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Define o ID autoincrementado
    private Long id;

    @Column(nullable = false, unique = true) // O username não pode ser nulo e deve ser único
    private String username;

    @Column(nullable = false) // A password não pode ser nula
    private String password;

    @Column(nullable = false) // O nome não pode ser nulo
    private String name;

    @Column(nullable = false, unique = true) // O email deve ser único e não pode ser nulo
    private String email;

    @Column(nullable = false) // O isAdmin não pode ser nulo
    private boolean isAdmin;

    // Construtor padrão
    public User() {
    }

    // Construtor que recebe todos os atributos
    public User(String username, String password, String name, String email, boolean isAdmin) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.isAdmin = isAdmin;
    }

    // Construtor que recebe um objeto SignUpModel
    public User(SignUpModel signUpModel) {
        this.username = signUpModel.getEmail(); // Usa o email como username
        this.password = signUpModel.getPassword(); // NÃO ESTÁ ENCRIPTADO AQUI! Tem que ser encriptado antes de salvar!
        this.name = signUpModel.getName();
        this.email = signUpModel.getEmail();
        this.isAdmin = false; // Por padrão, um novo utilizador não é admin
    }

    // Getters e Setters
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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }
}