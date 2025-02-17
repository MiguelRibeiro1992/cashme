package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.ItemModel;
import pt.upskill.CashMe.models.LoginModel;
import pt.upskill.CashMe.models.SignUpModel;
import pt.upskill.CashMe.services.AuthService;

@Controller
public class AuthController {

    @Autowired
    AuthService authService;

    @GetMapping("/login")
    public ModelAndView loginPage(@RequestParam(value = "success", required = false) String success,
                                  @RequestParam(value = "error", required = false) String error) {
        ModelAndView mav = new ModelAndView("login");
        if (success != null) {
            mav.addObject("success", "Conta registada com sucesso! Por favor faça login.");
        }
        if (error != null) {
            mav.addObject("error", "Utilizador não encontrado. Crie uma conta.");
        }
        return mav;
    }

    @GetMapping("/signup")
    public String signUpPage() {
        return "signup";
    }

    @PostMapping(value= "/login")
    public ModelAndView loginAction(@ModelAttribute LoginModel login) {
        System.out.println("DEBUG - Email recebido no controlador: " + login.getUsername());
        System.out.println("DEBUG - Password recebida no controlador: " + login.getPassword());

        if (login.getUsername() == null || login.getUsername().isEmpty()) {
            System.out.println("⚠ ERRO: O email chegou vazio no controlador!");
            return new ModelAndView("redirect:/login?error=1");
        }

        User user = authService.validateLogin(login);

        if (user != null) {
            System.out.println("✅ Login bem-sucedido! Redirecionando para /home");
            return new ModelAndView("redirect:/mainPage");
        }

        System.out.println("❌ Login falhou! Redirecionando para /login?error=1");
        return new ModelAndView("redirect:/login?error=1");
    }


    @PostMapping("/signup")
    public ModelAndView signUpAction(SignUpModel signUpModel) {
        ModelAndView mav = new ModelAndView("signup");
        try {
            authService.registerUser(signUpModel);
            mav.setViewName("redirect:/login?success");
        } catch (Exception e) {
            mav.addObject("error", e.getMessage());
        }
        return mav;
    }

}