<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    boolean isAuthenticated = auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal());
%>

<%@ include file="top-header.jsp" %>


<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="/">
            <img src="/images/Logo_Cash.svg" alt="CashMe" height="40">
        </a>

        <!-- Botão do Menu para Mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Menu de Navegação -->
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="/mainPage">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/contacts">Contacto</a></li>
                <li class="nav-item"><a class="nav-link" href="/aboutUs">Sobre Nós</a></li>
                <li class="nav-item"><a class="nav-link" href="/storesMap">Lojas</a></li>
            </ul>
        </div>

        <!-- Barra de Pesquisa e Ícones -->
        <div class="d-flex align-items-center">
            <!-- Barra de Pesquisa -->
            <form class="search-bar d-flex align-items-center" action="/search" method="GET">
                <input type="text" class="form-control search-input" name="query" placeholder="Pesquisar produtos..." required>
                <a href="/scan/viaBarcode" class="search-btn btn btn-link p-0 ms-2 d-flex flex-column align-items-center" style="text-decoration: none;">
                    <img src="/images/scanIcon.svg" alt="Scan" height="20">
                    <span style="font-size: 10px; text-decoration: underline; text-decoration-color: orange; text-underline-offset: 2px; color: black; ">Scan</span>
                </a>
            </form>

            <!-- Ícone Wishlist -->
            <a href="/wishlist" class="nav-icon me-3 ms-3">
                <img src="/images/wishlist.svg" alt="Wishlist" height="24">
            </a>

            <!-- Ícone Cart -->
            <a href="/cart" class="nav-icon me-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="Black" class="bi bi-cart3" viewBox="0 0 16 16">
                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l.84 4.479 9.144-.459L13.89 4zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                </svg>
            </a>

            <!-- Dropdown User -->
            <div class="dropdown">
                <a href="#" class="nav-icon" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="/images/user.svg" alt="User" height="24">
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <% if (isAuthenticated) { %>
                    <li><a class="dropdown-item" href="/account">Perfil</a></li>
                    <li><a class="dropdown-item" href="#">Definições</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="/logout">Logout</a></li>
                    <% } else { %>
                    <li><a class="dropdown-item" href="/login">Login</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </div>
</nav>