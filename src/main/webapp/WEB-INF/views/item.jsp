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
        <!-- Galeria de Imagens -->
        <div class="col-md-5 d-flex">
            <div class="col-md-5 d-flex">
                <div class="flex-grow-1">
                    <img src="/images/${item.id}.svg" alt="Produto Principal" class="img-fluid w-100 border rounded">
                </div>
            </div>
        </div>

        <!-- Informações do Produto -->
        <div class="col-md-7">
            <h2 class="fw-bold">${item.name}Nome do Produto</h2>
            <div class="d-flex align-items-center">
                <div class="rating text-warning">
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star">&#9733;</span>
                    <span class="star text-secondary">&#9733;</span>
                </div>
                <span class="ms-2 text-muted">(150 Reviews)</span>
                <span class="text-success ms-3">In Stock</span>
            </div>
            <h3 class="mt-3 fw-bold">${item.price}</h3>
            <p class="mt-2">${item.description}</p>

            <!-- Opções de Cores -->
            <h5 class="fw-bold">Colours:</h5>
            <div class="d-flex">
                <button class="btn btn-outline-dark rounded-circle me-2" style="width: 24px; height: 24px;"></button>
                <button class="btn btn-outline-danger rounded-circle" style="width: 24px; height: 24px;"></button>
            </div>

            <!-- Seletor de Quantidade -->
            <div class="d-flex align-items-center mt-3">
                <button class="btn btn-outline-secondary">-</button>
                <span class="mx-3 fs-5">2</span>
                <button class="btn btn-outline-secondary">+</button>
                <button class="btn btn-primary ms-3">Adicionar à wishlist</button>
            </div>

            <!-- Botões Extras -->
            <div>
                <button class="btn btn-primary mt-3 w-100">Ler Código de Barras</button>
            </div>

            <button class="btn btn-primary mt-3 w-100 ">Ler NFC</button>

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
        <div class="col-md-3 text-center">
            <img src="/images/store-placeholder.svg" alt="Loja" class="img-fluid">
            <p class="mt-2">Loja 1</p>
            <div class="rating">
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9734;</span>
                <span>(65)</span>
            </div>
        </div>
        <div class="col-md-3 text-center">
            <img src="/images/store-placeholder.svg" alt="Loja" class="img-fluid">
            <p class="mt-2">Loja 2</p>
            <div class="rating">
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9734;</span>
                <span>(65)</span>
            </div>
        </div>
        <div class="col-md-3 text-center">
            <img src="/images/store-placeholder.svg" alt="Loja" class="img-fluid">
            <p class="mt-2">Loja 3</p>
            <div class="rating">
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9734;</span>
                <span>(65)</span>
            </div>
        </div>
        <div class="col-md-3 text-center">
            <img src="/images/store-placeholder.svg" alt="Loja" class="img-fluid">
            <p class="mt-2">Loja 4</p>
            <div class="rating">
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9733;</span>
                <span class="star">&#9734;</span>
                <span>(75)</span>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center mt-4 mb-5">
        <button class="btn btn-primary">Ver todas</button>
    </div>
</section>

<%@ include file="includes/footer.jsp"%> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>
