package pt.upskill.CashMe.entities;

public enum Role {
    USER,
    ADMIN;

    public String getRole() {
        return name();
    }

}
