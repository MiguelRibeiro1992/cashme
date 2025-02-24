<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<footer class="footer">
    <div class="footer-top-bar"></div> <!-- Barra laranja no topo -->
    <div class="container">
        <div class="row">
            <div class="col">
                <h5>CashMe</h5>
                <p>Compre com a nossa app!</p>
            </div>
            <div class="col">
                <h5>Suporte</h5>
                <p>Av. do Brasil, 53, 1700-083 Lisboa</p>
                <p>cashme@gmail.com</p>
                <p>+351-555-999999</p>
            </div>
            <div class="col">
                <h5>Conta</h5>
                <a href="/account">A minha conta</a><br>
                <a href="/login">Login / Registar</a><br>
                <a href="#">Histórico</a><br>
                <a href="/wishlist">Wishlist</a><br>
                <a href="#">Definições</a>
            </div>
            <div class="col">
                <h5>Links Úteis</h5>
                <a href="/privacy-policy">Política de Privacidade</a><br>
                <a href="/terms">Termos de Utilização</a><br>
                <a href="/faq">FAQ</a><br>
                <a href="/contacts">Contacto</a>
            </div>
            <div class="col-md-3 download-app text-center">
                <h5>Download App</h5>
                <div class="d-flex align-items-center justify-content-center flex-wrap gap-3">
                    <img class="qrcode" src="/images/qrcode_cash.svg" alt="QR Code">
                    <div class="d-flex flex-column">
                        <a href="#">
                            <img src="/images/googleapp.svg" alt="Google Play" class="app-btn">
                        </a>
                        <a href="#">
                            <img src="/images/appstore.svg" alt="App Store" class="app-btn">
                        </a>
                    </div>
                </div>
            </div>

                <div class="social-icons">
                    <a href="#"><img src="/images/facebook.svg" alt="Facebook"></a>
                    <a href="#"><img src="/images/instagram.svg" alt="Instagram"></a>
                    <a href="#"><img src="/images/linkedin.svg" alt="LinkedIn"></a>
                </div>
            </div>
        </div>
        <hr class="my-3">
        <p class="copyright">
            <i class="bi bi-c-circle"></i> Copyright 2025. All rights reserved.
        </p>
    </div>
</footer>