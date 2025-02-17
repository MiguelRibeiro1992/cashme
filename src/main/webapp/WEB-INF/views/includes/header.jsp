<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contacto</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Sobre Nós</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Lojas</a></li>
            </ul>
        </div>

        <!-- Barra de Pesquisa e Ícones -->
        <div class="d-flex align-items-center">
            <!-- Barra de Pesquisa -->
            <form class="search-bar d-flex align-items-center" action="/search" method="GET">
                <input type="text" class="form-control search-input" name="query" placeholder="Pesquisar produtos..." required>
                <button type="submit" class="search-btn btn btn-link p-0 ms-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search search-icon" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                    </svg>
                </button>
            </form>

            <!-- Ícones Wishlist e User -->
            <a href="#" class="nav-icon me-3 ms-3">
                <img src="/images/wishlist.svg" alt="Wishlist" height="24">
            </a>
            <a href="#" class="nav-icon">
                <img src="/images/user.svg" alt="User" height="24">
            </a>
        </div>
    </div>
</nav>