<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Login | CashMe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 900px;
            margin: 50px auto;
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-login {
            background-color: #f18733;
            border: none;
        }
        .btn-login:hover {
            background-color: #e67629;
        }
        .footer {
            background-color: #333;
            color: white;
            padding: 20px 0;
        }
        .footer a {
            color: #f18733;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="/images/logo.png" alt="CashMe" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contacto</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Sobre nós</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Lojas</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Login Container -->
<div class="container login-container">
    <div class="row">
        <div class="col-md-6 d-flex align-items-center">
            <img src="/images/shopping-image.png" alt="Shopping" class="img-fluid">
        </div>
        <div class="col-md-6">
            <h2 class="mb-4">Login</h2>
            <p>Insira os seus dados</p>

            <!-- Formulário de Login -->
            <form method="POST" action="/login">
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Insira o seu email" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Insira a sua password" required>
                </div>

                <!-- Exibição de Erros e Sucessos -->
                <c:if test="${error != null}">
                    <p class="alert alert-danger">${error}</p>
                </c:if>
                <c:if test="${success != null}">
                    <p class="alert alert-success">${success}</p>
                </c:if>

                <button type="submit" class="btn btn-login w-100 text-white">Log In</button>

                <div class="text-end mt-2">
                    <a href="#">Esqueceu a password?</a>
                </div>
                <div class="mt-3 text-center">
                    <button class="btn btn-light w-100">
                        <img src="/images/google-logo.png" alt="Google" width="20" class="me-2"> Entrar com Google
                    </button>
                </div>
                <div class="text-center mt-3">
                    Ainda não tem uma conta? <a href="#">Registar</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5>CashMe</h5>
                <p>Compre com a nossa app!</p>
            </div>
            <div class="col-md-3">
                <h5>Suporte</h5>
                <p>Av. do Brasil, 53, 1700-083 Lisboa</p>
                <p>cashme@gmail.com</p>
                <p>+351-555-999999</p>
            </div>
            <div class="col-md-3">
                <h5>Conta</h5>
                <a href="#">A minha conta</a><br>
                <a href="#">Login / Registar</a><br>
                <a href="#">Histórico</a><br>
                <a href="#">Wishlist</a><br>
                <a href="#">Definições</a>
            </div>
            <div class="col-md-3">
                <h5>Links Úteis</h5>
                <a href="#">Política de Privacidade</a><br>
                <a href="#">Termos de Utilização</a><br>
                <a href="#">FAQ</a><br>
                <a href="#">Contacto</a>
            </div>
        </div>
        <hr class="my-3">
        <p>&copy; 2025 CashMe. Todos os direitos reservados.</p>
    </div>
</footer>

</body>
</html>