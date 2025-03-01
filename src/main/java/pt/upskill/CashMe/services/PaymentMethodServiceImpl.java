package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.PaymentMethod;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.repositories.PaymentMethodRepository;

import java.util.List;

@Service
public class PaymentMethodServiceImpl implements PaymentMethodService {

    @Autowired
    private PaymentMethodRepository paymentMethodRepository;

    @Autowired
    private UserServiceImpl userService;

    @Override
    public List<PaymentMethod> getUserPaymentMethods(User user) {
        return paymentMethodRepository.findByUser(user);
    }

    @Override
    public void savePaymentMethod(User user, PaymentMethod newPaymentMethod) {
        newPaymentMethod.setUser(user);
        paymentMethodRepository.save(newPaymentMethod);
    }

    @Override
    public void deletePaymentMethod(Long id) {
        paymentMethodRepository.deleteById(id);
    }
}
