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
        // Buscar o utilizador pelo email (que está a ser usado como username)
        User user = userRepository.findByEmail(loginModel.getUsername()).orElse(null);
        if (user == null || user.getId() == null) {
            return null;
        }

        // Verificar se a palavra-passe fornecida corresponde à encriptada
        if (passwordEncoder.matches(loginModel.getPassword(), user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public User registerUser(SignUpModel signUpModel) {
        // Verifica se o utilizador já existe pelo email
        if (userRepository.findByEmail(signUpModel.getEmail()).isPresent()) {
            throw new RuntimeException("Este email já está registado!");
        }

        // Criar utilizador manualmente e encriptar password
        User newUser = new User();
        newUser.setName(signUpModel.getName());
        newUser.setEmail(signUpModel.getEmail());
        newUser.setUsername(signUpModel.getEmail()); // Usa o email como username
        newUser.setPassword(passwordEncoder.encode(signUpModel.getPassword())); // Encripta password
        newUser.setAdmin(false); // Define como utilizador normal

        // Guardar na base de dados
        return userRepository.save(newUser);
    }
}