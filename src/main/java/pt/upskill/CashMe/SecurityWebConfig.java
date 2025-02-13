package pt.upskill.CashMe;

import jakarta.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityWebConfig {

    @Autowired
    UserAuthenticationProvider userAuthenticationProvider;

    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf(csrfConfigurer -> {
            csrfConfigurer.disable();
        });
        httpSecurity.authorizeHttpRequests(auth -> {

            auth.requestMatchers("/login", "/favicon.ico", "/styles/**", "/scripts/**", "/images/**", "/home", "/scanViaBarcode", "/scanViaNFC", "/signup", "/cart").permitAll();
            auth.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll();
            auth.requestMatchers("**").denyAll();
        });
        httpSecurity.formLogin(loginConfig -> {
            loginConfig.loginPage("/login");
            loginConfig.loginProcessingUrl("/login");
        });
        httpSecurity.authenticationProvider(userAuthenticationProvider);
        return httpSecurity.build();
    }
}
