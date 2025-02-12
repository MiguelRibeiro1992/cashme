package pt.upskill.CashMe.services;


import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.LoginModel;
import pt.upskill.CashMe.models.SignUpModel;

public interface AuthService {

    User validateLogin (LoginModel loginModel);

    User registerUser (SignUpModel signUpModel);

}
