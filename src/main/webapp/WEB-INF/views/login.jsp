<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Login | CashMe</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body class="login-page"> <!-- Aplica fundo branco ao login -->

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="/images/Logo_Cash.svg" alt="CashMe" height="40">
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
            <img src="/images/Login_register.svg" alt="Shopping" class="img-fluid">
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

                <button type="submit" class="btn btn-primary w-100 text-white">Log In</button>

                <div class="text-end mt-2">
                    <a href="#">Esqueceu a password?</a>
                </div>
                <div class="mt-3 text-center">
                    <button class="btn btn-light w-100">
                        <img src="/images/Icon-Google.svg" alt="Google" width="20" class="me-2"> Entrar com Google
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
<%@ include file="includes/footer.jsp"%>

</body>
</html>