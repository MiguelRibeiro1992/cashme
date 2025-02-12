package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.LoginModel;
import pt.upskill.CashMe.models.SignUpModel;
import pt.upskill.CashMe.services.AuthService;

@Controller
public class AuthController {

    @Autowired
    AuthService authService;

    @GetMapping("/home")
    public String homePage(){
        return "home";
    }

    @GetMapping("/login")
    public ModelAndView loginPage(@RequestParam("success") @Nullable String success) {
        ModelAndView mav = new ModelAndView("login");
        if(success != null) {
            mav.addObject("success", "Conta registada com sucesso! Por favor faça login.");
        }
        return mav;
    }

    @GetMapping("/signup")
    public String signUpPage() {
        return "signup";
    }

    @PostMapping(value= "/login")
    public ModelAndView loginAction(LoginModel login) {
        ModelAndView mav = new ModelAndView();
        User user = authService.validateLogin(login);
        if(user != null) {
            mav.setView(new RedirectView("/user/" + user.getId() + "/tasks"));
            return mav;
        }
        mav.setViewName("login");
        mav.addObject("error", "Invalid credentials.");
        return mav;
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
