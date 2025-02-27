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
                        <!-- redirecionar para underConstruction -->
                        <a href="underConstruction"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                        <!-- <a href="#"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a> -->
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Moda masculina</b></p>
                        <a href="underConstruction"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Escritório</b></p>
                        <a href="underConstruction"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Estilo de vida</b></p>
                        <a href="underConstruction"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Livraria</b></p>
                        <a href="underConstruction"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Desporto</b></p>
                        <a href="underConstruction"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Brinquedos</b></p>
                        <a href="underConstruction"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Supermercado</b></p>
                        <a href="underConstruction"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <p class="mb-3"><b>Saúde e Beleza</b></p>
                        <a href="underConstruction"><img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3"></a>
                    </div>
                </div>
            </div>
            <div class="col-md-1 d-flex justify-content-start">
                <img src="/images/verticalLine.svg" alt="Linha vertical" class="img-fluid h-100">
            </div>
            <div class="col-md-8 d-flex flex-column align-items-end">
                <img src="/images/saldosZara.svg" alt="Saldos Zara" class="img-fluid" style="max-width: 200%; height: auto; margin-right: 70px;">
                <a href="/availableSoon" class="text-dark fw-bold mt-3 d-flex align-items-center">
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
            <c:forEach var="store" items="${stores}">
                <div class="col-md-3 d-flex flex-column align-items-center position-relative">
                    <a href="/storeView/${store.id}" target="_blank">
                        <img src="/images/${store.imageUrl}" alt="${store.name}" class="img-fluid">
                    </a>
                    <div class="position-absolute top-0 end-0 d-flex flex-column p-2">
                        <a href="/wishlist.jsp"><img src="/images/heart.svg" alt="Favorito" class="img-fluid mb-1"></a>
                        <a href="#"><img src="/images/eye.svg" alt="Visualizar" class="img-fluid"></a>
                    </div>
                    <p class="mt-3 text-left"><b>${store.name}</b></p>
                    <div class="rating">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="d-flex justify-content-center mt-4">
        <button class="btn btn-primary" onclick="window.location.href='/stores'">Ver todas as lojas</button>
    </div>



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
            <div class="row justify-content-center">
                <c:forEach var="item" items="${items}">
                    <div class="col-md-4 col-sm-6 d-flex flex-column align-items-center position-relative p-3 bg-light rounded">
                        <a href="/item/${item.id}" class="text-decoration-none text-dark">
                            <!-- Container da imagem para posicionamento correto dos ícones -->
                            <div class="image-container position-relative">
                                <img src="/images/${item.imageUrl}" alt="${item.name}" class="img-fluid product-link">

                                <!-- Ícones de Favorito e Visualizar -->
                                <div class="icons-container position-absolute top-0 end-0 p-2">
                                    <button onclick="toggleWishlist(${item.id}, event)" type="button" class="border-0 bg-transparent p-0">
                                        <img src="/images/heart.svg" alt="Favorito" class="icon">
                                    </button>
                                    <a href="/item/${item.id}" onclick="event.stopPropagation();">
                                        <img src="/images/eye.svg" alt="Visualizar" class="icon">
                                    </a>
                                </div>
                            </div>

                            <!-- Nome do Produto -->
                            <p class="mt-4"><b>${item.name}</b></p>

                            <!-- Preço formatado -->
                            <h5 class="text-primary fw-bold">${item.formattedPrice}</h5>

                            <!-- Classificação por estrelas -->
                            <div class="rating mt-2">
                                <c:forEach var="i" begin="1" end="5">
                                    <span class="star ${i <= (item.rating != null ? item.rating : 0) ? 'text-warning' : ''}">&#9733;</span>
                                </c:forEach>
                                <span class="rating-value">(${item.reviewsCount != null ? item.reviewsCount : 0})</span>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Botão para ver todos os produtos -->
        <div class="d-flex justify-content-center mt-4">
            <button class="btn btn-primary" onclick="window.location.href='/items'">Ver todos os produtos</button>
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

    <script>
        function toggleWishlist(itemId, event) {
            event.preventDefault();
            event.stopPropagation();
            fetch("/wishlist/toggle/" + itemId, {
                method: 'POST'
            }).then(response => {
                if (response.ok) {
                    location.reload(); //TODO mudar isto para atualizar apenas o ícone
                } else {
                    alert('Erro ao adicionar à wishlist');
                }
            });
        }
    </script>

</section>

<%@ include file="includes/footer.jsp"%> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>