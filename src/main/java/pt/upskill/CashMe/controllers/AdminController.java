package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pt.upskill.CashMe.services.ItemServiceImpl;


@Controller
public class AdminController {

    @Autowired
    private ItemServiceImpl itemService;

    // Página de login do admin
    @GetMapping("/admin/login")
    public String adminLoginPage() {
        return "adminLogin";
    }

    // Dashboard do admin
    @GetMapping("/admin/dashboard")
    public String adminDashboard() {
        return "adminDashboard";
    }

    //Adicionar produtos
    //@GetMapping("addProduct")

}