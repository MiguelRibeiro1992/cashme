package pt.upskill.CashMe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.LoginModel;
import pt.upskill.CashMe.services.AuthService;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    AuthService authService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String email = authentication.getPrincipal().toString();
        String password = authentication.getCredentials().toString();
        LoginModel login = new LoginModel(email, password);
        User user = authService.validateLogin(login);
        if (user != null) {
            System.out.println("User: " + user.getUsername());
            List<GrantedAuthority> roleList = new ArrayList<>();
            roleList.add(new SimpleGrantedAuthority("ROLE_USER"));
            if(user.isAdmin()) {
                roleList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
                System.out.println("É Admin");
            }
            return new UsernamePasswordAuthenticationToken(email, password, roleList);

        }
        return null;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}