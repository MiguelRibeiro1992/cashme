package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.PaymentMethod;
import pt.upskill.CashMe.entities.Purchase;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.services.*;

import java.util.*;

@Controller
@RequestMapping("/account")
public class UserProfileController {

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private PaymentMethodServiceImpl paymentMethodService;

    @Autowired
    private ItemServiceImpl itemService;

    @Autowired
    private PurchaseServiceImpl purchaseService;

    @GetMapping
    public String account() {
        return "account";
    }

    @GetMapping("/settings")
    public String settings() {
        return "settings";
    }

    @GetMapping("/paymentMethods")
    public String paymentMethods(Model model){
        User user = userService.getCurrentUser();
        List<PaymentMethod> paymentMethods = paymentMethodService.getUserPaymentMethods(user);
        model.addAttribute("paymentMethods", paymentMethods);
        return "paymentMethods";
    }

    @PostMapping("/paymentMethods/add")
    public String addPaymentMethod (@RequestParam String cardNumber,
                                    @RequestParam String cardBrand,
                                    @RequestParam String expiryDate) {
        User user = userService.getCurrentUser();

        String last4Digits = cardNumber.substring(cardNumber.length() - 4);

        PaymentMethod paymentMethod = new PaymentMethod();
        paymentMethod.setUser(user);
        paymentMethod.setCardNumber(last4Digits);
        paymentMethod.setCardBrand(cardBrand);
        paymentMethod.setExpiryDate(expiryDate);

        paymentMethodService.savePaymentMethod(user, paymentMethod);

        return "redirect:/account/paymentMethods";
    }

    @PostMapping("/paymentMethods/delete")
    public String deletePaymentMethod (@RequestParam Long id) {
        paymentMethodService.deletePaymentMethod(id);
        return "redirect:/account/paymentMethods";
    }

    @GetMapping("/history")
    public String history(Model model){
        User user = userService.getCurrentUser();
        List<Purchase> purchases = purchaseService.getPurchasesByUser(user);
        model.addAttribute("purchases", purchases);
        return "history";
    }

    @GetMapping("/stats")
    public String stats(Model model) {
        User user = userService.getCurrentUser();
        List<Purchase> purchases = purchaseService.getPurchasesByUser(user);
        Map<String, Double> totalByStore = new HashMap<>();

        for (Purchase purchase : purchases) {
            totalByStore.merge(purchase.getStore(), purchase.getTotal(), Double::sum);
        }

        model.addAttribute("user", user);
        model.addAttribute("purchases", purchases);
        model.addAttribute("totalByStore", totalByStore);

        return "stats";
    }

    @GetMapping("/tracking")
    public String tracking(Model model) {
        List<Item> items = itemService.getAllItemsSortedByPrice();
        model.addAttribute("items", items);
        return "tracking";
    }

    @GetMapping("/notifications")
    public String notifications() {
        return "notifications";
    }

    @GetMapping("/points")
    public String points() {
        return "points";
    }
}
