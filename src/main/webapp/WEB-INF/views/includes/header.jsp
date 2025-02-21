<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    boolean isAuthenticated = auth != null && auth.isAuthenticated() && !"anonymousUser".equals(auth.getPrincipal());
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="#">
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
                <button type="submit" class="search-btn btn btn-link p-0 ms-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                    </svg>
                </button>
            </form>

            <!-- Ícone Wishlist -->
            <a href="/wishlist" class="nav-icon me-3 ms-3">
                <img src="/images/wishlist.svg" alt="Wishlist" height="24">
            </a>

            <!-- Dropdown User -->
            <div class="dropdown">
                <a href="#" class="nav-icon" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="/images/user.svg" alt="User" height="24">
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <% if (isAuthenticated) { %>
                    <li><a class="dropdown-item" href="#">Perfil</a></li>
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