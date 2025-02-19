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

<section class="container mt-5 position-relative">
    <div class="custom-overlay">
        <h1><b>Bem-vindo <br> à CashMe!</b></h1>
        <p><b>Descubra uma nova forma de fazer compras </b></p>
        <p><b> e simplifique com a nossa app</b></p>
    </div>
    <div  class = "custom-overlay-2">
    <p class=" text-center mt-4">Vá à sua loja, use a nossa app para ler o código de barras</p>
    <p class=" text-center mt-4"> e pague automaticamente com total segurança.</p>
    </div>

    <div class="row align-items-center">
        <img src="/images/diagramCashMe.svg" alt="Imagem representativa da CashMe" class="img-fluid">
    </div>
</section>

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">


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

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">


<section class="container mt-5">
    <div class="row align-items-center">
        <div class="col-md-6 d-flex flex-column align-items-center">
            <h2 class="fw-bold text-center">Ainda não é cliente <br> CashMe?</h2>
        </div>
        <div class="col-md-6 d-flex flex-column align-items-center">
            <p class="fw-semibold">Crie a sua conta e comece já a usufruir!</p>
            <button class="btn btn-primary" onclick="window.location.href='signup'">Registar Conta</button>
            <p class="mt-4">Já tem uma conta? <a href="login" class="fw-semibold text-dark">Entrar</a></p>

        </div>
    </div>
</section>

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">


<section class="container text-center mt-5 position-relative">
    <img src="/images/trackingCashMe.svg" alt="Tracking Cash Me" class="img-fluid">
    <div class="overlay-text position-absolute col-md-6" style="top: 80%; left: 65%; transform: translate(-50%, -50%); text-align: center; color: black;">
        <h2>Experimente a nossa app!</h2>
        <p>Faça download da app Cash Me e comece já a pagar as suas</p>
        <p class="mt-1">compras sem ter de esperar em filas!</p>
        <div class="mt-4">
            <div class="col-md-12 d-flex justify-content-center">
                <img src="/images/qrcode_cash_black.svg" alt="QR Code" class="img-fluid" style="width: 150px; height: auto; position: relative; top: 5px; left: -120px;">
            </div>
            <div class="col-md-12 d-flex flex-column justify-content-center align-items-center mt-3">
                <img src="/images/googlePlay.svg" alt="QR Code Google Play" class="img-fluid mb-2 app-link" data-url="https://play.google.com/" style="width: 200px; height: auto; position: relative; top: -150px; left: 60px;">
                <img src="/images/appStore.svg" alt="QR Code App Store" class="img-fluid app-link" data-url="https://www.apple.com/app-store/" style="width: 200px; height: auto; position: relative; top: -150px; left: 60px;">
            </div>
        </div>
    </div>
</section>

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">


<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid">
        <span class="ms-2 span-highlight">Parceiros</span>
        <div class="ms-auto d-flex">

        <!-- Botão Seta Esquerda -->
        <button class="arrow-btn" id="prevBtn">
            <img src="images/leftArrow.svg" alt="Seta Esquerda">
        </button>

        <!-- Botão Seta Direita -->
        <button class="arrow-btn" id="nextBtn">
            <img src="images/rightArrow.svg" alt="Seta Direita">
        </button>
    </div>
    </div>
</section>



<section class="container mt-5">
    <h2>Os nossos parceiros</h2>
    <div class="mb-4"></div>

    <div class="partner-wrapper mt-6 mb-6">
        <div class="partner-carousel row flex-nowrap" id="partnerCarousel">
            <div class="col-md-3 d-flex justify-content-center">
                <a href="https://www.continente.pt" target="_blank"><img src="/images/continente.svg" alt="Continente" class="img-fluid partner-link"></a>
            </div>
            <div class="col-md-3 d-flex justify-content-center">
                <a href="https://www.zara.pt" target="_blank"><img src="/images/zara.svg" alt="Zara" class="img-fluid partner-link"></a>
            </div>
            <div class="col-md-3 d-flex justify-content-center">
                <a href="https://www.lidl.pt" target="_blank"><img src="/images/lidl.svg" alt="Lidl" class="img-fluid partner-link"></a>
            </div>
            <div class="col-md-3 d-flex justify-content-center">
                <a href="https://www.fnac.pt" target="_blank"><img src="/images/fnac.svg" alt="Fnac" class="img-fluid partner-link"></a>
            </div>
            <div class="col-md-3 d-flex justify-content-center">
                <a href="https://www.nike.com.pt" target="_blank"><img src="/images/nike.svg" alt="Nike" class="img-fluid partner-link"></a>
            </div>
            <div class="col-md-3 d-flex justify-content-center">
                <a href="https://www.adidas.pt" target="_blank"><img src="/images/adidas.svg" alt="Adidas" class="img-fluid partner-link"></a>
            </div>
        </div>
    </div>
</section>

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">


<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid">
        <span class="ms-2 span-highlight">Novidades</span>
        <div class="ms-auto d-flex">
    </div>
    </div>
</section>

<section class="container mt-5">
    <h2 class="fw-bold">Novas Lojas estão a chegar!</h2>
    <div class="mb-4"></div>
    <div class="row">
        <div class="col-md-6">
            <a href="https://www.worten.pt" target="_blank">
                <img src="/images/groupWorten.svg" alt="Worten" class="img-fluid w-100">
            </a>
        </div>
        <div class="col-md-6 d-flex flex-column">
            <div class="mb-3">
                <a href="https://www.stradivarius.pt" target="_blank">
                    <img src="/images/stradivarius.svg" alt="Stradivarius" class="img-fluid w-100">
                </a>
            </div>
            <div class="d-flex">
                <div class="col-md-6">
                    <a href="https://www.auchan.pt" target="_blank">
                        <img src="/images/auchan.svg" alt="Auchan" class="img-fluid w-100">
                    </a>
                </div>
                <div class="col-md-6">
                    <a href="https://www.pullandbear.com/pt" target="_blank">
                        <img src="/images/pullAndBear.svg" alt="Pull&Bear" class="img-fluid w-100">
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">


<section class="container text-center mt-5">
    <div class="row mt-6 mb-6">
        <div class="col-md-4">
            <div class="icon-circle">
                <img src="/images/scanMini.svg" alt="Leitura fácil e rápida" class="img-fluid">
            </div>
            <h4 class="fw-bold mt-3">Leitura fácil e rápida</h4>
            <p>Leitura de produtos fácil de usar para fast-checkout</p>
        </div>
        <div class="col-md-4">
            <div>
                <img src="/images/phonesMini.svg" alt="Apoio ao cliente" class="img-fluid">
            </div>
            <h4 class="fw-bold mt-3">Apoio ao cliente</h4>
            <p>Linha de apoio ao cliente disponível 24/7</p>
        </div>
        <div class="col-md-4">
            <div>
                <img src="/images/securityMini.svg" alt="Segurança garantida" class="img-fluid">
            </div>
            <h4 class="fw-bold mt-3">Segurança garantida</h4>
            <p>Procedimentos com segurança máxima garantida</p>
        </div>
    </div>
</section>

<section class="container mt-5 d-flex justify-content-end mb-5 arrow-container">
    <button class="arrow-btn arrow-up" id="scrollTopBtn">
        <img src="/images/upArrow.svg" alt="Seta cima" class="img-fluid">
    </button>
</section>


<%@ include file="includes/footer.jsp"%> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>