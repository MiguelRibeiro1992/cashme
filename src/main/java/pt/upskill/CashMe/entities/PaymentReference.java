package pt.upskill.CashMe.entities;

import jakarta.persistence.*;

@Entity
public class PaymentReference {

    @Id
    @GeneratedValue
    private Long id;

    @Column(nullable = false)
    private String entity;

    @Column(nullable = false, unique = true)
    private String reference;

    @Column(nullable = false)
    private double amount;

    @OneToOne
    @JoinColumn(name = "cart_id", nullable = false, unique = true)
    private Cart cart;

    public PaymentReference () {}

    public PaymentReference(String entity, String reference, double amount, Cart cart) {
        this.entity = entity;
        this.reference = reference;
        this.amount = amount;
        this.cart = cart;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEntity() {
        return entity;
    }

    public void setEntity(String entity) {
        this.entity = entity;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}