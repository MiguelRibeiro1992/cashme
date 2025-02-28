<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Loja</title>

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

<!-- Seção da Loja -->
<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/${store.imageUrl}" alt="${store.name}" class="img-fluid me-3" style="height: 50px;">
        <h2 class="fw-bold">${store.name}</h2>
    </div>
</section>

<!-- Lista de Produtos -->
<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid">
        <span class="ms-2 span-highlight">Produtos</span>
        <div class="ms-auto d-flex">
        </div>
    </div>
</section>

<!-- Produtos e Filtros -->
<section class="container mt-4 mb-6">
    <div class="row align-items-start">
        <!-- Barra de Filtros -->
        <div class="col-md-3">
            <div class="filters p-3 border rounded" style="height: 100%;">
                <h5 class="fw-bold">Filtros</h5>

                <!-- Filtros -->
                <form method="GET" action="/storeView/${store.id}">
                    <!-- Categorias -->
                    <div class="mb-3">
                        <h6 class="fw-bold">Categorias</h6>
                        <c:forEach var="category" items="${categories}">
                            <div>
                                <input type="checkbox" name="category" value="${category.name}" id="${category.name}"
                                       class="form-check-input">
                                <label for="${category.name}" class="form-check-label ms-2">${category.name}</label>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Faixa de Preço -->
                    <div class="mb-3">
                        <h6 class="fw-bold">Preço</h6>
                        <input type="range" class="form-range" id="priceRange" name="maxPrice" min="0" max="500"
                               step="5" value="100">
                        <p class="text-muted">Até <b id="priceValue">100€</b></p>
                    </div>

                    <button class="btn btn-primary w-100" type="submit">Aplicar Filtros</button>
                </form>
            </div>
        </div>

        <!-- Produtos -->
        <div class="col-md-9">
            <h2 class="text-center mb-4">Itens disponíveis em ${store.name}</h2>

            <div class="row d-flex justify-content-center">
                <c:choose>
                    <c:when test="${not empty items}">
                        <c:forEach var="item" items="${items}">
                            <div class="col-md-4 text-center">
                                <div class="product-card p-3 border rounded mb-6 position-relative">
                                    <!-- Wishlist -->
                                    <div class="position-absolute top-0 end-0 p-2">
                                        <button onclick="toggleWishlist(${item.id}, event)" type="button"
                                                class="border-0 bg-transparent p-0">
                                            <img id="wishlist-icon-${item.id}"
                                                 src="/images/${item.inWishlist ? 'heartfill.svg' : 'heart.svg'}"
                                                 alt="Favorito"
                                                 class="icon"
                                                 data-in-wishlist="${item.inWishlist ? 'true' : 'false'}">
                                        </button>
                                    </div>

                                    <a href="/item/${item.id}">
                                        <img src="/images/${item.imageUrl}" alt="${item.name}" class="img-fluid">
                                    </a>
                                    <p class="mt-2"><b>${item.name}</b></p>
                                    <h5 class="text-primary fw-bold">${item.formattedPrice}</h5>

                                    <button class="btn btn-primary mt-2 w-100"
                                            onclick="window.location.href='/scan/viaBarcode?id=${item.id}'">
                                        Scan do Produto
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="text-center">Nenhum item disponível para esta loja.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

    </div>
</section>

<!-- Script para atualizar preço -->
<script>
    document.getElementById("priceRange").addEventListener("input", function() {
        document.getElementById("priceValue").textContent = this.value + "€";
    });
</script>

<!-- script para a wishlist -->
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
                    heartIcon.src = isCurrentlyInWishlist ? "/images/heart.svg" : "/images/heartfill.svg";
                    heartIcon.dataset.inWishlist = isCurrentlyInWishlist ? "false" : "true";
                }
            })
            .catch(error => {
                console.error("Erro ao atualizar a wishlist:", error);
            });
    }
</script>


<%@ include file="includes/footer.jsp"%> <!-- Footer -->

<script src= "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>
