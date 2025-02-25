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
                    auth.requestMatchers("/admin/login").permitAll();
                    auth.anyRequest().hasRole("ADMIN");
                }).formLogin(adminLoginConfig -> {
                    adminLoginConfig.loginPage("/admin/login");
                    adminLoginConfig.loginProcessingUrl("/admin/login");
                    adminLoginConfig.defaultSuccessUrl("/admin/dashboard", true);
                    adminLoginConfig.failureUrl("/admin/login?error=true");
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
            loginConfig.defaultSuccessUrl("/mainPage", true);
        });

        httpSecurity.authorizeHttpRequests(auth -> {
            auth.requestMatchers("/login", "/favicon.ico", "/styles/**", "/scripts/**", "/images/**", "/home", "/signup", "/", "/privacy-policy","/redirectToMainPage", "/terms","/faq","/stores").permitAll();
            auth.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll();
            // Qualquer utilizador autenticado pode ver :
            auth.requestMatchers("/categories", "/categories/**", "/cart", "/cart/**", "/mainPage", "/scan/**", "/storeView", "/storeView/**","/wishlist/**", "/aboutUs", "/contacts", "/messageSubmit", "/storesMap","/account","/item/**", "/", "/underConstruction","/api/stores").hasAnyRole("USER", "ADMIN");
            auth.requestMatchers("/**").denyAll();
        });

        httpSecurity.authenticationProvider(userAuthenticationProvider);
        return httpSecurity.build();
    }
}
