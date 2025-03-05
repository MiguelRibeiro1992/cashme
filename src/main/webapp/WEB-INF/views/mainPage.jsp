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
<section class="container mt-0">
    <div class="row">
        <div class="col-sm-3">
            <div class="row align-items-start mt-5">
                <div class="text-left">
                    <div class="d-flex flex-column ms-4">
                        <c:forEach var="category" items="${categories}">
                            <div class="d-flex justify-content-between align-items-center">
                                <p class="mb-0"><b>${category.name}</b></p>
                                <a href="/category/${category.slug}">
                                    <img src="/images/arrowRightNoFill.svg" alt="Seta Direita" class="img-fluid ms-3">
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-1 d-flex justify-content-center">
            <img src="/images/verticalLine.svg" alt="Linha vertical" class="img-fluid h-100">
        </div>
        <div class="col-sm-8 d-flex flex-column align-items-end">
            <a href="/storeView/152" target="_blank" class="mt-5">
                <img src="/images/saldosZara.svg" alt="Saldos Zara" class="img-fluid"
                     style="height: auto; margin-right: 70px;">
            </a>
            <a href="/availableSoon" class="text-dark fw-bold mt-3 d-flex align-items-center">
                Descarregar <img src="/images/rightArrow.svg" alt="Seta Direita" class="ms-2"
                                 style="margin-right: 40px">
            </a>
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
                <div class="d-flex flex-column align-items-center position-relative partner-carousel-item">
                    <a href="/storeView/${store.id}" target="_blank">
                        <img src="/images/${store.imageUrl}" alt="${store.name}" class="img-store">
                    </a>
                    <p class="mt-3 text-left"><b>${store.name}</b></p>
                    <div class="rating">
                        <span class="star" data-value="5">&#9733;</span>
                        <span class="star" data-value="4">&#9733;</span>
                        <span class="star" data-value="3">&#9733;</span>
                        <span class="star" data-value="2">&#9733;</span>
                        <span class="star" data-value="1">&#9733;</span>
                        <span class="rating-value">(0)</span>
                    </div>

                </div>
            </c:forEach>
        </div>
    </div>
    <div class="d-flex justify-content-center mt-4">
        <button class="btn btn-primary" onclick="window.location.href='/stores'">Ver todas as lojas</button>
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
            <div class="category-carousel d-flex flex-nowrap" id="categoryCarousel"
                 style="overflow: hidden; white-space: nowrap;">
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
                        <img src="/images/fotografia.svg" alt="Fotografia" class="img-fluid category-link">
                        <p class="mt-2"><b>Fotografia</b></p>
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
        <div class="d-flex justify-content-center mt-4">
            <button class="btn btn-primary" onclick="window.location.href='/category/all'">Ver todas as categorias
            </button>
        </div>
    </section>

    <img src="/images/lineBlack.svg" alt="Linha separadora" class="d-block mx-auto my-5">

    <section class="container mt-5 position-relative">
        <div>
            <img src="/images/sorteio.svg" alt="Sorteio" class="img-fluid w-100">
            <button class="btn btn-primary position-absolute" style="bottom: 100px; left: 75px; height: 60px"
                    onclick="window.location.href='/availableSoon'">Descarregar agora
            </button>
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
        <div class="product-carousel row flex-nowrap" id="productCarousel">
            <c:forEach var="item" items="${items}">
                <div class="d-flex flex-column align-items-center position-relative product-carousel-item">
                    <!-- Link apenas na imagem e nome para evitar redirecionamento ao clicar nas estrelas -->
                    <a href="/item/${item.id}" class="text-decoration-none text-dark">
                        <div class="image-container position-relative">
                            <img src="/images/${item.imageUrl}" alt="${item.name}" class="img-store">

                            <!-- Ícones de Favorito e Visualizar -->
                            <div class="icons-container position-absolute top-0 end-0 p-2">
                                <button onclick="toggleWishlist(${item.id}, event)" type="button"
                                        class="icons-container">
                                    <img id="wishlist-icon-${item.id}"
                                         src="/images/${item.inWishlist ? 'heartfill.svg' : 'heart.svg'}"
                                         alt="Favorito"
                                         class="icon"
                                         data-in-wishlist="${item.inWishlist ? 'true' : 'false'}">
                                </button>
                            </div>
                        </div>
                    </a>

                    <!-- Nome do Produto (também clicável para evitar clique nas estrelas) -->
                    <a href="/item/${item.id}" class="text-decoration-none text-dark">
                        <p class="mt-4"><b>${item.name}</b></p>
                    </a>

                    <!-- Preço formatado -->
                    <h5 class="text-primary fw-bold">${item.formattedPrice}</h5>

                    <!-- Classificação por estrelas -->
                    <div class="rating mt-2" id="rating-${item.id}">
                        <c:forEach var="i" begin="1" end="5">
        <span class="star"
              data-value="${i}"
              onclick="rateItem(${item.id}, ${i}, event)">&#9733;</span>
                        </c:forEach>
                        <span class="rating-value">(0)</span>
                    </div>
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
                <a href="storeView/4" target="_blank">
                    <img src="/images/groupWorten.svg" alt="Worten" class="img-fluid w-100">
                </a>
            </div>
            <div class="col-md-6 d-flex flex-column">
                <div class="mb-3">
                    <a href="storeView/3" target="_blank">
                        <img src="/images/stradivarius.svg" alt="Stradivarius" class="img-fluid w-100">
                    </a>
                </div>
                <div class="d-flex">
                    <div class="col-md-6">
                        <a href="storeView/1" target="_blank">
                            <img src="/images/auchan.svg" alt="Auchan" class="img-fluid w-100">
                        </a>
                    </div>
                    <div class="col-md-6">
                        <a href="storeView/2" target="_blank">
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

            let heartIcon = document.getElementById("wishlist-icon-" + itemId);
            let isCurrentlyInWishlist = heartIcon.dataset.inWishlist === "true";

            fetch("/wishlist/toggle/" + itemId, {
                method: "POST"
            })
                .then(response => {
                    if (response.ok) {
                        // Atualiza o ícone sem recarregar a página
                        heartIcon.src = isCurrentlyInWishlist ? "/images/heart.svg" : "/images/heartfill.svg";
                        heartIcon.dataset.inWishlist = isCurrentlyInWishlist ? "false" : "true";
                    } else {
                        //alert("Erro ao atualizar a wishlist");
                    }
                })
                .catch(error => {
                    console.error("Erro ao atualizar a wishlist:", error);
                });
        }

    </script>

</section>

<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>