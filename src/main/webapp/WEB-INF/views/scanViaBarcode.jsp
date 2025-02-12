<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Scan Código de Barras | CashMe</title>

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

    <!-- <script src="https://unpkg.com/html5-qrcode" type="text/javascript"/> -->

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

<!-- Scan Container -->
<div class="container mt-5">
    <div class="row align-items-center">
        <!-- Imagem à esquerda -->
        <div class="col-md-6 text-center">
            <img src="/static/images/scanSymbol.svg" alt="Código de Barras" class="img-fluid">
        </div>

        <!-- Texto e botões à direita -->
        <div class="col-md-6 d-flex flex-column justify-content-center">
            <h4 class="mb-3">Leitura de código de barras</h4>
            <div class="d-flex align-items-center">
                <div class="bg-orange rounded me-2" style="width: 10px; height: 20px;"></div>
                <p class="mb-0">Ler um código:</p>
            </div>
            <!-- Botão para ligar a câmara com estilos corrigidos -->
            <button class="btn btn-primary btn-login mt-3 w-100">Ligar a câmara</button>
            <p class="text-muted mt-2 text-center">Nenhum produto detetado</p>
        </div>
    </div>

    <!-- Linha com botões NFC e ações -->
    <div class="row mt-4 align-items-center">
        <!-- Botão para NFC -->
        <div class="col-md-6 text-start">
            <a href="/scanViaNFC">
                <img src="/static/images/button_changeToScanViaNFC.svg" alt="Mudar para Scan Via NFC" class="img-fluid">
            </a>
        </div>

        <!-- Botões de ação -->
        <div class="col-md-6 text-end">
            <button class="btn btn-outline-dark me-2">Cancelar</button>
            <button class="btn btn-primary btn-login">Adicionar ao carrinho</button>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>