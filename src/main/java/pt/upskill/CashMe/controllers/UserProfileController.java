package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pt.upskill.CashMe.services.UserServiceImpl;

@Controller
@RequestMapping("/account")
public class UserProfileController {

    @Autowired
    private UserServiceImpl userService;

    @GetMapping
    public String account() {
        return "account";
    }

    @GetMapping("/settings")
    public String settings() {
        return "settings";
    }

    @GetMapping("/paymentMethods")
    public String paymentMethods(){
        return "paymentMethods";
    }

    @GetMapping("/history")
    public String history(){
        return "history";
    }

    @GetMapping("/stats")
    public String stats() {
        return "stats";
    }

    @GetMapping("/tracking")
    public String tracking() {
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
