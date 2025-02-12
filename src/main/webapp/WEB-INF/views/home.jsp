<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Landing Page</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">
</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<section class="container mt-5">
    <div class="row">
        <div class="col-md-6 text-left">
            <h1 class="text-center">Bem-vindo</h1>
            <h1 class="text-center">à CashMe!</h1>
            <p class="text-center"><b>Descubra uma nova forma de fazer compras</b></p>
            <p class="text-center">
                <b>e simplifique com a nossa app!</b>
                <span class="overlay-text">
                    <p>Vá à sua loja, use a nossa app para ler o</p>
                    <p>código de barras e pague</p>
                    <p>automaticamente com total segurança</p>
                </span>
            </p>
        </div>
        <div class="col-md-6 position-relative">
            <img src="/images/diagramCashMe.svg" alt="Diagram" class="img-fluid">
        </div>
    </div>
</section>

<section class="container text-left mt-5">
    <div class="row">
        <div class="col-md-12">
            <div class="feature-box position-relative text-center">
                <img src="/images/userTemplate.svg" alt="Pagamento Automático" class="img-fluid">
                <div class="overlay-text">
                    <h3>Pagamento Automático</h3>
                    <p>Registe o código de barras e passe na saída com CashMe.</p>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="feature-box position-relative text-center">
                <img src="/images/writeTemplate.svg" alt="Pesquisa Avançada" class="img-fluid">
                <div class="overlay-text">
                    <h3>Pesquisa Avançada</h3>
                    <p>Pesquise produtos e crie as suas listas de compras.</p>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="feature-box position-relative text-center">
                <img src="/images/giftTemplate.svg" alt="Sistema de Pontos" class="img-fluid">
                <div class="overlay-text">
                    <h3>Sistema de Pontos</h3>
                    <p>Acumule pontos e tenha direito a promoções exclusivas.</p>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="feature-box position-relative text-center">
                <img src="/images/deskTemplate.svg" alt="Tracking de preços" class="img-fluid">
                <div class="overlay-text">
                    <h3>Tracking de Preços</h3>
                    <p>Acompanhe promoções e gira os seus gastos de forma inteligente.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="container text-center mt-5">
    <h2>Ainda não é cliente CashMe?</h2>
    <button class="btn btn-primary">Registar Conta</button>
</section>

<section class="container text-center mt-5">
    <img src = "/images/trackingCashMe.svg" alt ="Tracking Cash Me" class ="img-fluid">
</section>

<section class="container text-center mt-5">
    <h2>Experimente a nossa app!</h2>
    <div class="d-flex justify-content-center mt-3">
        <img src="/images/googlePlay.svg" alt="QR Code Google Play" class="img-fluid">
        <img src="/images/appStore.svg" alt="QR Code App Store" class="img-fluid">
    </div>
</section>

<section class="container text-center mt-5">
    <h2>Os nossos parceiros</h2>
    <div class="row">
        <div class="col-md-3"><img src="/images/continente.svg" alt="Continente" class="img-fluid"></div>
        <div class="col-md-3"><img src="/images/zara.svg" alt="Zara" class="img-fluid"></div>
        <div class="col-md-3"><img src="/images/lidl.svg" alt="Lidl" class="img-fluid"></div>
        <div class="col-md-3"><img src="/images/fnac.svg" alt="Fnac" class="img-fluid"></div>
    </div>
</section>

<section class="container text-center mt-5">
    <h2>Novas Lojas estão a chegar!</h2>
    <div class="row">
        <div class="col-md-4"><img src="/images/groupWorten.svg" alt="Worten" class="img-fluid"></div>
        <div class="col-md-4"><img src="/images/auchan.svg" alt="Auchan" class="img-fluid"></div>
        <div class="col-md-4"><img src="/images/pullAndBear.svg" alt="Pull&Bear" class="img-fluid"></div>
    </div>
</section>

<%@ include file="includes/footer.jsp"%> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>