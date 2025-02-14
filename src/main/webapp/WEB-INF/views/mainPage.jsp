<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<!-- Banner Principal -->
<section class="container-fluid mt-0">
    <div class="container">
        <div class="row align-items-start mt-5">
            <div class="col-md-3 text-left">
                <div class="d-flex flex-column ms-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Moda feminina</b></p>
                        <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3" style="margin-top: -10px;">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Moda masculina</b></p>
                        <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3" style="margin-top: -10px;">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Electrónica</b></p>
                        <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3" style="margin-top: -15px;">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Estilo de vida</b></p>
                        <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3" style="margin-top: -15px;">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Medicina</b></p>
                        <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3" style="margin-top: -15px;">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Desporto</b></p>
                        <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3" style="margin-top: -15px;">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Brinquedos</b></p>
                        <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3" style="margin-top: -15px;">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Supermercado</b></p>
                        <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3" style="margin-top: -15px;">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Saúde e Beleza</b></p>
                        <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3" style="margin-top: -15px;">
                    </div>
                </div>
            </div>
            <div class="col-md-1 d-flex justify-content-start">
                <img src="/images/verticalLine.svg" alt="Linha vertical" class="img-fluid h-100">
            </div>
            <div class="col-md-8 d-flex justify-content-center">
                <img src="/images/saldosZara.svg" alt="Saldos Zara" class="img-fluid" style="max-width: 90%; height: auto;">
            </div>
        </div>
    </div>
</section>

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">

<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid">
        <h3 class="ms-3 me-auto">Categorias</h3>

        <!-- Botão Seta Esquerda -->
        <button class="arrow-btn" id="prevBtn">
            <img src="images/leftArrow.svg" alt="Seta Esquerda">
        </button>

        <!-- Botão Seta Direita -->
        <button class="arrow-btn" id="nextBtn">
            <img src="images/rightArrow.svg" alt="Seta Direita">
        </button>
    </div>
</section>



<section class="container mt-5">
    <h2>Pesquise lojas por categoria</h2>
    <div class="mb-4"></div>

    <div class="partner-wrapper mt-6 mb-6">
        <div class="partner-carousel row flex-nowrap" id="partnerCarousel">
            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.continente.pt" target="_blank">
                    <img src="/images/continente.svg" alt="Continente" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                    <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                </div>
                <p class="mt-2"><b>Continente</b></p>
            </div>
            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.zara.pt" target="_blank">
                    <img src="/images/zara.svg" alt="Zara" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                    <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                </div>
                <p class="mt-2"><b>Zara</b></p>
            </div>
            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.lidl.pt" target="_blank">
                    <img src="/images/lidl.svg" alt="Lidl" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                    <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                </div>
                <p class="mt-2"><b>LIDL</b></p>
            </div>
            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.fnac.pt" target="_blank">
                    <img src="/images/fnac.svg" alt="Fnac" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                    <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                </div>
                <p class="mt-2"><b>FNAC</b></p>
            </div>
            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.nike.com.pt" target="_blank">
                    <img src="/images/nike.svg" alt="Nike" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                    <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                </div>
                <p class="mt-2"><b>Nike</b></p>
            </div>
            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.adidas.pt" target="_blank">
                    <img src="/images/adidas.svg" alt="Adidas" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                    <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                </div>
                <p class="mt-2"><b>Adidas</b></p>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center mt-4">
        <button class="btn btn-primary" onclick="window.location.href=''">Ver todas as lojas</button>
    </div>
</section>


<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">

<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid">
        <h3 class="ms-3 me-auto">Categorias</h3>

        <!-- Botão Seta Esquerda -->
        <button class="arrow-btn" id="prevCategoryBtn">
            <img src="images/leftArrow.svg" alt="Seta Esquerda">
        </button>

        <!-- Botão Seta Direita -->
        <button class="arrow-btn" id="nextCategoryBtn">
            <img src="images/rightArrow.svg" alt="Seta Direita">
        </button>
    </div>
</section>

<section class="container mt-5 overflow-hidden">
    <h2>Pesquise lojas por categoria</h2>
    <div class="mb-4"></div>

    <div class="category-wrapper mt-6 mb-6 position-relative">
        <div class="category-carousel d-flex flex-nowrap" id="categoryCarousel" style="overflow: hidden; white-space: nowrap;">
            <div class="category-container d-flex">
                <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                    <img src="/images/smartphone.svg" alt="Smartphone" class="img-fluid category-link">
                    <p class="mt-2"><b>Smartphones</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                    <img src="/images/computadores.svg" alt="Computadores" class="img-fluid category-link">
                    <p class="mt-2"><b>Computadores</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                    <img src="/images/smartwatch.svg" alt="SmartWatch" class="img-fluid category-link">
                    <p class="mt-2"><b>SmartWatch</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                    <img src="/images/camara.svg" alt="Camera" class="img-fluid category-link">
                    <p class="mt-2"><b>Camera</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                    <img src="/images/headphones.svg" alt="HeadPhones" class="img-fluid category-link">
                    <p class="mt-2"><b>HeadPhones</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                    <img src="/images/gaming.svg" alt="Gaming" class="img-fluid category-link">
                    <p class="mt-2"><b>Gaming</b></p>
                </div>
            </div>
        </div>
    </div>
</section>

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">

<section class = "container mt-5">
    <div>
        <img src="/images/sorteio.svg" alt="Sorteio" class="img-fluid w-100">
    </div>
</section>

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">

<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid">
        <h3 class="ms-3 me-auto">Produtos dos nossos parceiros</h3>

        <!-- Botão Seta Esquerda -->
        <button class="arrow-btn" id="prevProductBtn">
            <img src="images/leftArrow.svg" alt="Seta Esquerda">
        </button>

        <!-- Botão Seta Direita -->
        <button class="arrow-btn" id="nextProductBtn">
            <img src="images/rightArrow.svg" alt="Seta Direita">
        </button>
    </div>
</section>

<section class="container mt-5">
    <h2>Produtos mais vendidos</h2>
    <div class="mb-4"></div>

    <div class="product-wrapper mt-6 mb-6 position-relative">
        <div class="product-carousel row flex-wrap" id="productCarousel" style="overflow: hidden; white-space: nowrap;">
            <div class="product-container d-flex flex-wrap justify-content-center">
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-white rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                        <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                    </div>
                    <img src="/images/racaoCao.svg" alt="Ração para cão" class="img-fluid product-link">
                    <p class="mt-2"><b>Ração para cão "Cesar"</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                        <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                    </div>
                    <img src="/images/canon.svg" alt="Camera CANON" class="img-fluid product-link">
                    <p class="mt-2"><b>Camara CANON EOS DSLR</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                        <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                    </div>
                    <img src="/images/laptop.svg" alt="Portátil Gaming" class="img-fluid product-link">
                    <p class="mt-2"><b>Portátil Gaming ASUS FHD</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                        <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                    </div>
                    <img src="/images/curologia.svg" alt="Curologia" class="img-fluid product-link">
                    <p class="mt-2"><b>Conjunto de produtos de curologia</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                        <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                    </div>
                    <img src="/images/carroEletrico.svg" alt="Carro elétrico" class="img-fluid product-link">
                    <p class="mt-2"><b>Carro elétrico criança</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                        <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                    </div>
                    <img src="/images/chuteiras.svg" alt="Chuteiras" class="img-fluid product-link">
                    <p class="mt-2"><b>Chuteiras Jr. Zoom</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                        <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                    </div>
                    <img src="/images/gamingPad.svg" alt="Gaming Pad" class="img-fluid product-link">
                    <p class="mt-2"><b>Comando GP11 Shooter USB</b></p>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1">
                        <img src="/images/eye.svg" alt="Visualizar" class="img-fluid">
                    </div>
                    <img src="/images/jacket.svg" alt="Casaco" class="img-fluid product-link">
                    <p class="mt-2"><b>Casaco de cetim verde</b></p>
                </div>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center mt-4">
        <button class="btn btn-primary" onclick="window.location.href=''">Ver todas as lojas</button>
    </div>
</section>


<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">


<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid">
        <h3 class="ms-3">Novidades</h3>
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