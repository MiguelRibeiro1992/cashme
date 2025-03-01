package pt.upskill.CashMe.services;

import pt.upskill.CashMe.entities.PaymentMethod;
import pt.upskill.CashMe.entities.User;

import java.util.List;

public interface PaymentMethodService {
    public List<PaymentMethod> getUserPaymentMethods(User user );

    public void savePaymentMethod(User user, PaymentMethod paymentMethod);

    public void deletePaymentMethod(Long id);
}