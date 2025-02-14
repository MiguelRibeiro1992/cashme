package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.LoginModel;
import pt.upskill.CashMe.models.SignUpModel;
import pt.upskill.CashMe.repositories.UserRepository;

import java.util.Optional;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private UserRepository userRepository;


    PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);


    @Override
    public User validateLogin(LoginModel loginModel) {
        // Buscar o utilizador pelo email

        String email = loginModel.getUsername();

        if (email == null || email.isEmpty()) {
            System.out.println("Erro: Email do login está vazio!");
            return null;
        }

        System.out.println("Procurar utilizador com email: " + loginModel.getUsername());

        Optional<User> optionalUser = userRepository.findByUsername(email.trim());

        if (optionalUser.isEmpty()) {
            System.out.println("Utilizador não encontrado");
            return null; // Se o utilizador não existir, retorna null
        }

        User user = optionalUser.get();
        System.out.println("Utilizador encontrado: " + user.getUsername());

        // Verificar se a palavra-passe fornecida corresponde à encriptada
        if (passwordEncoder.matches(loginModel.getPassword(), user.getPassword())) {
            System.out.println("Login bem-sucedido");
            return user; // Login bem-sucedido
        }

        System.out.println("Password incorreta");
        return null; // Password incorreta
    }

    @Override
    public User registerUser(SignUpModel signUpModel) {
        // Verifica se o utilizador já existe pelo email
        if (userRepository.findByUsername(signUpModel.getUsername()).isPresent()) {
            throw new RuntimeException("Este email já está registado!");
        }

        // Criar utilizador manualmente e encriptar password
        User newUser = new User();
        newUser.setName(signUpModel.getName());
        newUser.setUsername(signUpModel.getUsername());
        newUser.setPassword(passwordEncoder.encode(signUpModel.getPassword())); // Encripta password
        newUser.setAdmin(false); // Define como utilizador normal

        // Guardar na base de dados
        return userRepository.save(newUser);
    }
}