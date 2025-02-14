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
                        <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Moda masculina</b></p>
                        <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Electrónica</b></p>
                        <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Estilo de vida</b></p>
                        <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Medicina</b></p>
                        <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Desporto</b></p>
                        <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Brinquedos</b></p>
                        <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Supermercado</b></p>
                        <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Saúde e Beleza</b></p>
                        <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                </div>
            </div>
            <div class="col-md-1 d-flex justify-content-start">
                <img src="/images/verticalLine.svg" alt="Linha vertical" class="img-fluid h-100">
            </div>
            <div class="col-md-8 d-flex flex-column align-items-end">
                <img src="/images/saldosZara.svg" alt="Saldos Zara" class="img-fluid" style="max-width: 200%; height: auto; margin-right: 70px;">
                <a href="#" class="text-dark fw-bold mt-3 d-flex align-items-center">
                    Descarregar <img src="/images/rightArrow.svg" alt="Seta Direita" class="ms-2" style="margin-right: 50px">
                </a>
            </div>
        </div>
    </div>
</section>


<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">

<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid">
        <span class="ms-2 span-highlight">Hoje</span>
        <div class="ms-auto d-flex">
            <button class="arrow-btn" id="prevBtn">
                <img src="images/leftArrow.svg" alt="Seta Esquerda">
            </button>
            <button class="arrow-btn" id="nextBtn">
                <img src="images/rightArrow.svg" alt="Seta Direita">
            </button>
        </div>
    </div>
</section>



<section class="container mt-5">
    <h2>Lojas mais visitadas</h2>
    <div class="mb-4"></div>

    <div class="partner-wrapper mt-6 mb-6">
        <div class="partner-carousel row flex-nowrap" id="partnerCarousel">
            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.continente.pt" target="_blank">
                    <img src="/images/continente.svg" alt="Continente" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                    <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                </div>
                <p class="mt-3 text-left"><b>Continente</b></p>
                <div class="rating">
                    <span class="star" data-value="5">&#9733;</span>
                    <span class="star" data-value="4">&#9733;</span>
                    <span class="star" data-value="3">&#9733;</span>
                    <span class="star" data-value="2">&#9733;</span>
                    <span class="star" data-value="1">&#9733;</span>
                    <span class="rating-value">(88)</span>
                </div>
            </div>
            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.zara.pt" target="_blank">
                    <img src="/images/zara.svg" alt="Zara" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                    <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                </div>
                <p class="mt-5 text-left"><b>Zara</b></p>
                <div class="rating">
                    <span class="star" data-value="5">&#9733;</span>
                    <span class="star" data-value="4">&#9733;</span>
                    <span class="star" data-value="3">&#9733;</span>
                    <span class="star" data-value="2">&#9733;</span>
                    <span class="star" data-value="1">&#9733;</span>
                    <span class="rating-value">(75)</span>
                </div>
            </div>

            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.lidl.pt" target="_blank">
                    <img src="/images/lidl.svg" alt="Lidl" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                    <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                </div>
                <p class="mt-3 text-left"><b>LIDL</b></p>
                <div class="rating">
                    <span class="star" data-value="5">&#9733;</span>
                    <span class="star" data-value="4">&#9733;</span>
                    <span class="star" data-value="3">&#9733;</span>
                    <span class="star" data-value="2">&#9733;</span>
                    <span class="star" data-value="1">&#9733;</span>
                    <span class="rating-value">(99)</span>
                </div>
            </div>

            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.fnac.pt" target="_blank">
                    <img src="/images/fnac.svg" alt="Fnac" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                    <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                </div>
                <p class="mt-3 text-left"><b>FNAC</b></p>
                <div class="rating">
                    <span class="star" data-value="5">&#9733;</span>
                    <span class="star" data-value="4">&#9733;</span>
                    <span class="star" data-value="3">&#9733;</span>
                    <span class="star" data-value="2">&#9733;</span>
                    <span class="star" data-value="1">&#9733;</span>
                    <span class="rating-value">(32)</span>
                </div>
            </div>

            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.nike.com.pt" target="_blank">
                    <img src="/images/nike.svg" alt="Nike" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                    <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                </div>
                <p class="mt-3 text-left"><b>Nike</b></p>
                <div class="rating">
                    <span class="star" data-value="5">&#9733;</span>
                    <span class="star" data-value="4">&#9733;</span>
                    <span class="star" data-value="3">&#9733;</span>
                    <span class="star" data-value="2">&#9733;</span>
                    <span class="star" data-value="1">&#9733;</span>
                    <span class="rating-value">(157)</span>
                </div>
            </div>

            <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                <a href="https://www.adidas.pt" target="_blank">
                    <img src="/images/adidas.svg" alt="Adidas" class="img-fluid partner-link">
                </a>
                <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                    <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                    <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                </div>
                <p class="mt-3 text-left"><b>Adidas</b></p>
                <div class="rating">
                    <span class="star" data-value="5">&#9733;</span>
                    <span class="star" data-value="4">&#9733;</span>
                    <span class="star" data-value="3">&#9733;</span>
                    <span class="star" data-value="2">&#9733;</span>
                    <span class="star" data-value="1">&#9733;</span>
                    <span class="rating-value">(46)</span>
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
        <span class="ms-2 span-highlight">Categorias</span>
        <div class="ms-auto d-flex">
        <!-- Botão Seta Esquerda -->
        <button class="arrow-btn" id="prevCategoryBtn">
            <img src="images/leftArrow.svg" alt="Seta Esquerda">
        </button>

        <!-- Botão Seta Direita -->
        <button class="arrow-btn" id="nextCategoryBtn">
            <img src="images/rightArrow.svg" alt="Seta Direita">
        </button>
    </div>
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

<section class="container mt-5 position-relative">
    <div>
        <img src="/images/sorteio.svg" alt="Sorteio" class="img-fluid w-100">
        <button class="btn btn-primary position-absolute" style="bottom: 100px; left: 75px; height: 60px" onclick="window.location.href='#'">Descarregar agora</button>
    </div>
</section>

<img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">

<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid">
        <span class="ms-2 span-highlight">Produtos dos nossos parceiros</span>
        <div class="ms-auto d-flex">

        <!-- Botão Seta Esquerda -->
        <button class="arrow-btn" id="prevProductBtn">
            <img src="images/leftArrow.svg" alt="Seta Esquerda">
        </button>

        <!-- Botão Seta Direita -->
        <button class="arrow-btn" id="nextProductBtn">
            <img src="images/rightArrow.svg" alt="Seta Direita">
        </button>
    </div>
    </div>
</section>

<section class="container mt-5">
    <h2>Produtos mais vendidos</h2>
    <div class="mb-4"></div>

    <div class="product-wrapper mt-6 mb-6 position-relative">
        <div class="product-carousel row flex-wrap" id="productCarousel" style="overflow: hidden; white-space: nowrap;">
            <div class="product-container d-flex flex-wrap justify-content-center gap-4">
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                        <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                    </div>
                    <img src="/images/racaoCao.svg" alt="Ração para cão" class="img-fluid product-link">
                    <p class="mt-4"><b>Ração para cão "Cesar"</b></p>
                    <div class="rating">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="rating-value">(50)</span>
                    </div>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                        <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                    </div>
                    <img src="/images/canon.svg" alt="Camera CANON" class="img-fluid product-link">
                    <p class="mt-4"><b>Camara CANON EOS DSLR</b></p>
                    <a href="/wishlist.jsp" class="d-block text-white text-center bg-black p-1 w-100" style="font-size: 0.9rem; text-decoration: none;">Adicionar à Wishlist</a>
                    <div class="rating mt-2">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="rating-value">(12)</span>
                    </div>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                        <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                    </div>
                    <img src="/images/laptop.svg" alt="Portátil Gaming" class="img-fluid product-link">
                    <p class="mt-4"><b>Portátil Gaming ASUS FHD</b></p>
                    <div class="rating">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="rating-value">(34)</span>
                    </div>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                        <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                    </div>
                    <img src="/images/curologia.svg" alt="Curologia" class="img-fluid product-link">
                    <p class="mt-4"><b>Conjunto de produtos de curologia</b></p>
                    <div class="rating">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="rating-value">(106)</span>
                    </div>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <img src="/images/new.svg" alt="Novo" class="position-absolute top-0 start-0 p-2">
                    <div class="position-absolute top-0 end-0 p-2">
                        <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                        <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                    </div>
                    <img src="/images/carroEletrico.svg" alt="Carro elétrico" class="img-fluid product-link">
                    <p class="mt-4"><b>Carro elétrico criança</b></p>
                    <div class="rating">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="rating-value">(25)</span>
                    </div>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                        <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                    </div>
                    <img src="/images/chuteiras.svg" alt="Chuteiras" class="img-fluid product-link">
                    <p class="mt-4"><b>Chuteiras Jr. Zoom</b></p>
                    <div class="rating">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="rating-value">(71)</span>
                    </div>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <img src="/images/new.svg" alt="Novo" class="position-absolute top-0 start-0 p-2">
                    <div class="position-absolute top-0 end-0 p-2">
                        <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                        <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                    </div>
                    <img src="/images/gamingPad.svg" alt="Gaming Pad" class="img-fluid product-link">
                    <p class="mt-4"><b>Comando GP11 Shooter USB</b></p>
                    <div class="rating">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="rating-value">(154)</span>
                    </div>
                </div>
                <div class="col-md-3 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                    <div class="position-absolute top-0 end-0 p-2">
                        <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                        <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                    </div>
                    <img src="/images/jacket.svg" alt="Casaco" class="img-fluid product-link">
                    <p class="mt-4"><b>Casaco de cetim verde</b></p>
                    <div class="rating">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="rating-value">(250)</span>
                    </div>
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