<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Produto</title>

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
        <!-- Galeria de Imagens -->
        <div class="col-md-5">
            <div class="image-container">
                <img src="/images/${item.imageUrl}" alt="${item.name}" class="img-fluid w-100 border rounded">
            </div>
        </div>

        <!-- Informações do Produto -->
        <div class="col-md-7">
            <h2 class="fw-bold">${item.name}</h2>

            <!-- Avaliação Clicável -->
            <div class="d-flex align-items-center">
                <div class="rating text-warning">
                    <c:forEach var="i" begin="1" end="5">
                        <span class="star clickable ${i <= (item.rating != null ? item.rating : 0) ? 'text-warning' : 'text-secondary'}"
                              data-value="${i}"
                              onclick="rateItem(${item.id}, ${i})">
                            &#9733;
                        </span>
                    </c:forEach>
                </div>
                <span class="ms-2 text-muted">(${item.reviewsCount != null ? item.reviewsCount : 0} Reviews)</span>
                <span class="text-success ms-3">Em stock</span>
            </div>

            <!-- Preço Formatado -->
            <h3 class="mt-3 fw-bold">${item.formattedPrice}</h3>

            <p class="mt-2">${item.description}</p>

            <!-- Seletor de Quantidade -->
            <div class="d-flex align-items-center mt-3">
                <button class="btn btn-outline-secondary quantity-btn" onclick="updateQuantity(-1)">-</button>
                <span class="mx-3 fs-5" id="quantity">1</span>
                <button class="btn btn-outline-secondary quantity-btn" onclick="updateQuantity(1)">+</button>
                <button class="btn btn-primary ms-3">Adicionar à Wishlist</button>
            </div>

            <!-- Botões Extras -->
            <div>
                <button class="btn btn-primary mt-3 w-100">Ler Código de Barras</button>
            </div>

            <button class="btn btn-primary mt-3 w-100">Ler NFC</button>
        </div>
    </div>
</section>

<!-- Disponibilidade nas Lojas -->
<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/rectangleBullet.svg" alt="Bullet" class="img-fluid">
        <h4 class="ms-3">Disponível em:</h4>
    </div>

    <div class="row mt-4">
        <c:if test="${store != null}">
            <div class="col-md-3 text-center">
                <img src="/images/store-placeholder.svg" alt="Loja" class="img-fluid">
                <p class="mt-2">${store.name}</p>
                <div class="rating">
                    <c:forEach var="i" begin="1" end="5">
                        <span class="star ${i <= store.rating ? 'text-warning' : 'text-secondary'}">&#9733;</span>
                    </c:forEach>
                    <span>(${store.reviews})</span>
                </div>
            </div>
        </c:if>
        <c:if test="${store == null}">
            <p class="text-muted">Este produto não está disponível em nenhuma loja.</p>
        </c:if>
    </div>
</section>

<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>


