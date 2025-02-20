package pt.upskill.CashMe;

import jakarta.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityWebConfig {

    @Autowired
    UserAuthenticationProvider userAuthenticationProvider;

    @Bean
    @Order(1)
    protected SecurityFilterChain adminFilterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                .securityMatcher("/admin/**")
                .authorizeHttpRequests(auth -> {
                    auth.anyRequest().hasRole("ADMIN");
                }).formLogin(adminLoginConfig -> {
                    adminLoginConfig.loginPage("/admin/login");
                    adminLoginConfig.loginProcessingUrl("/adminLogin");
                    adminLoginConfig.defaultSuccessUrl("/admin/Dashboard", true);
                }).csrf(csrfConfigurer -> {
                    csrfConfigurer.disable();
                }).authenticationProvider(userAuthenticationProvider).build();
    }

    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf(csrfConfigurer -> {
            csrfConfigurer.disable();
        });


        httpSecurity.formLogin(loginConfig -> {
            loginConfig.loginPage("/login");
            loginConfig.loginProcessingUrl("/login");
            loginConfig.defaultSuccessUrl("/mainpage", true);
        });

        httpSecurity.authorizeHttpRequests(auth -> {
            auth.requestMatchers("/login", "/favicon.ico", "/styles/**", "/scripts/**", "/images/**", "/home", "/scanViaBarcode", "/scanViaNFC", "/signup", "/cart", "/storeView", "/adminLogin","/").permitAll();
            auth.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll();
            // Qualquer utilizador autenticado pode ver categorias
            auth.requestMatchers("/categories", "/categories/**", "/mainPage", "/").hasAnyRole("USER", "ADMIN");
            auth.requestMatchers("/**").denyAll();
        });

        httpSecurity.authenticationProvider(userAuthenticationProvider);
        return httpSecurity.build();
    }
}
