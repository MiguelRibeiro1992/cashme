package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.LoginModel;
import pt.upskill.CashMe.models.SignUpModel;
import pt.upskill.CashMe.repositories.UserRepository;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private UserRepository userRepository;


    PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);


    @Override
    public User validateLogin(LoginModel loginModel) {
        User user = userRepository.findByUsername(loginModel.getUsername());
        if(user == null || user.getId() == null) {
            return null;
        }

        if (passwordEncoder.matches(loginModel.getPassword(), user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public User registerUser(SignUpModel signUpModel) {
        if(userRepository.findByUsername(signUpModel.getUsername()) != null) {
            throw new RuntimeException("User already exists!");
        }

        User newUser = new User(signUpModel);

        newUser.setPassword(passwordEncoder.encode(signUpModel.getPassword()));

        // Definir se é admin ou não
        newUser.setAdmin(false);

        return userRepository.save(newUser);
    }
}