package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.LoginModel;
import pt.upskill.CashMe.models.SignUpModel;
import pt.upskill.CashMe.repositories.UserRepository;

@Service

public class AuthServiceImpl implements AuthService {

    @Autowired
    UserRepository userRepository;

    @Override
    public User validateLogin(LoginModel loginModel) {
        User user = userRepository.getUserByUsername(loginModel.getUsername());
        if (user == null || user.getId() == null){
            return null;
        }
        if (user.getPassword().equals(loginModel.getPassword())){
            return user;
        }
        return null;
    }

    @Override
    public User registerUser(SignUpModel signUpModel) {
        if (userRepository.getUserByUsername(signUpModel.getUsername()) != null){
            throw new RuntimeException("User already exists");
        }
        return userRepository.save(new User(signUpModel));
    }
}
