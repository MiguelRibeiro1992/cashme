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

            auth.requestMatchers("/login", "/favicon.ico", "/styles/**", "/scripts/**", "/images/**", "/home", "/scanViaBarcode", "/scanViaNFC", "/signup", "/cart", "/mainPage", "/storeView/**", "/storeView", "/adminLogin","/").permitAll();
            auth.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll();
            // Qualquer utilizador autenticado pode ver categorias
            auth.requestMatchers("/categories", "/categories/**").hasAnyRole("USER", "ADMIN");
            // Apenas admins podem modificar categorias
            auth.requestMatchers( "/adminDashboard","/adminDashboard/**","/adminDashboard/categories/save","/adminDashboard/categories/{id}", "/adminDashboard/manageItems", "/adminDashboard/manageStores").hasRole("ADMIN");
            auth.requestMatchers("**").denyAll();


        });
        httpSecurity.formLogin(loginConfig -> {
            loginConfig.loginPage("/login");
            loginConfig.loginProcessingUrl("/login");
            loginConfig.defaultSuccessUrl("/mainpage", true);
        });

            // Autorização ADMIN
        httpSecurity.formLogin(adminLoginConfig -> {
            adminLoginConfig.loginPage("/adminLogin");
            adminLoginConfig.loginProcessingUrl("/adminLogin");
            adminLoginConfig.defaultSuccessUrl("/adminDashboard", true);
        });
        httpSecurity.authenticationProvider(userAuthenticationProvider);
        return httpSecurity.build();
    }
}
