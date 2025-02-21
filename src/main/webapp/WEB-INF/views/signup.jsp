<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Criar Conta | CashMe</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">


</head>

<body class="signup-page">

<!-- Importando Header -->
<%@ include file="includes/header.jsp" %>

<!-- Signup Container -->
<div class="container login-container">
    <div class="row">
        <div class="col-md-6 d-flex align-items-center">
            <img src="/images/Login_register.svg" alt="Shopping" class="img-fluid">
        </div>
        <div class="col-md-6">
            <h2 class="mb-4">Criar Conta</h2>
            <p>Insira os seus dados</p>

            <!-- Formulário de Criação de Conta -->
            <form method="POST" action="/signup">
                <div class="mb-3">
                    <label for="name" class="form-label">Nome</label>
                    <input type="text" name="name" class="form-control" id="name" required>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Email</label>
                    <input type="email" name="username" class="form-control" id="username" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Palavra-passe</label>
                    <input id="password" name="password" type="password" class="form-control" required>
                </div>

                <c:if test="${error != null}">
                    <p class="alert alert-danger">Oops... erro ao criar a conta: ${error}</p>
                </c:if>

                <button type="submit" class="btn btn-primary w-100 text-white">Criar Conta</button>

                <div class="mt-3 text-center">
                    <button class="btn btn-light w-100">
                        <img src="/images/Icon-Google.svg" alt="Google" width="20" class="me-2"> Entrar com Google
                    </button>
                </div>
                <div class="text-center mt-3">
                    Já tem uma conta? <a href="/login">Entrar</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Importando Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>