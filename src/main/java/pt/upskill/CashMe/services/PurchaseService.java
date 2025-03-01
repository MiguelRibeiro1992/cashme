package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.Purchase;
import pt.upskill.CashMe.entities.User;

import java.util.List;

public interface PurchaseService {
    List<Purchase> getPurchasesByUser(User user);

    void save(Purchase purchase);

    List<Purchase> findAllPurchases();
}
