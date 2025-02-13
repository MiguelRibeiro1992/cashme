package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import pt.upskill.CashMe.services.CartServiceImpl;

@Controller
public class CartController {

    @Autowired
    private CartServiceImpl cartService;


}
