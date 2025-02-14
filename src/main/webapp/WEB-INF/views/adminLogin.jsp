<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Admin Login | CashMe</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>

<body class="login-page"> <!-- Aplica fundo branco ao login -->

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Login Container -->
<div class="container login-container">
    <div class="row">
        <div class="col-md-6 d-flex align-items-center">
            <img src="/images/Login_register.svg" alt="Shopping" class="img-fluid">
        </div>
        <div class="col-md-6">
            <h2 class="mb-4">Login - Admin</h2>
            <p>Insira os seus dados para aceder à área de administração</p>

            <!-- Formulário de Login -->
            <form method="POST" action="/admin/login">
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="username" class="form-control" placeholder="Insira o seu email" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" placeholder="Insira a sua password" required>
                </div>

                <button type="submit" class="btn btn-primary w-100 text-white">Login</button>

                <!-- Exibição de Erros e Sucessos -->
                <c:if test="${error != null}">
                    <p class="alert alert-danger">${error}</p>
                </c:if>
                <c:if test="${success != null}">
                    <p class="alert alert-success">${success}</p>
                </c:if>

                <div class="text-end mt-2">
                    <a href="#">Esqueceu a password?</a>
                </div>
                <div class="mt-3 text-center">
                    <button class="btn btn-light w-100">
                        <img src="/images/Icon-Google.svg" alt="Google" width="20" class="me-2"> Entrar com Google
                    </button>
                </div>
                <div class="text-center mt-3">
                    Não é administrador? <a href="/login">Faça login como usuário</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>