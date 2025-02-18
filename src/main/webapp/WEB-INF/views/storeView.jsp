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
        <img src="/images/store-logo-placeholder.svg" alt="Logo da Loja" class="img-fluid me-3" style="height: 50px;">
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
<section class="container mt-4">
    <div class="row">
        <!-- Barra de Filtros -->
        <div class="col-md-3">
            <div class="filters p-3 border rounded" style="height: 100%;">
                <h5 class="fw-bold">Filtros</h5>

                <!-- Categorias -->
                <div class="mb-3">
                    <h6 class="fw-bold">Categorias</h6>
                    <div><input type="checkbox" id="gaming" class="form-check-input"><label for="gaming" class="form-check-label ms-2">Gaming</label></div>
                    <div><input type="checkbox" id="eletronicos" class="form-check-input"><label for="eletronicos" class="form-check-label ms-2">Eletrónicos</label></div>
                    <div><input type="checkbox" id="roupas" class="form-check-input"><label for="roupas" class="form-check-label ms-2">Roupas</label></div>
                    <div><input type="checkbox" id="animais" class="form-check-input"><label for="animais" class="form-check-label ms-2">Animais</label></div>
                    <div><input type="checkbox" id="brinquedos" class="form-check-input"><label for="brinquedos" class="form-check-label ms-2">Brinquedos e Jogos</label></div>
                    <div><input type="checkbox" id="bricolage" class="form-check-input"><label for="bricolage" class="form-check-label ms-2">Bricolage</label></div>
                    <div><input type="checkbox" id="casa" class="form-check-input"><label for="casa" class="form-check-label ms-2">Casa e Jardim</label></div>
                    <div><input type="checkbox" id="bebe" class="form-check-input"><label for="bebe" class="form-check-label ms-2">Bebé</label></div>
                    <div><input type="checkbox" id="beleza" class="form-check-input"><label for="beleza" class="form-check-label ms-2">Beleza e Higiene</label></div>
                    <div><input type="checkbox" id="mercearia" class="form-check-input"><label for="mercearia" class="form-check-label ms-2">Mercearia</label></div>
                    <div><input type="checkbox" id="eletrodomesticos" class="form-check-input"><label for="eletrodomesticos" class="form-check-label ms-2">Eletrodomésticos</label></div>
                    <div><input type="checkbox" id="desporto" class="form-check-input"><label for="desporto" class="form-check-label ms-2">Desporto</label></div>
                </div>

                <!-- Faixa de Preço -->
                <div class="mb-3">
                    <h6 class="fw-bold">Preço</h6>
                    <input type="range" class="form-range" id="priceRange" min="0" max="500" step="5" value="100">
                    <p class="text-muted">Até <b id="priceValue">100€</b></p>
                </div>

                <button class="btn btn-primary w-100">Aplicar Filtros</button>
            </div>
        </div>

        <!-- Produtos -->
        <div class="col-md-9 d-flex flex-column justify-content-center">
            <div class="row">
                <!-- Primeira Linha de Produtos -->
                <div class="col-md-4 text-center">
                    <div class="product-card p-3 border rounded">
                        <img src="/images/product-placeholder.svg" alt="Produto" class="img-fluid">
                        <p class="mt-2"><b>Produto 1</b></p>
                        <h5 class="text-primary fw-bold">99,99€</h5>
                        <button class="btn btn-dark mt-2 w-100">Adicionar à Wishlist</button>
                    </div>
                </div>

                <div class="col-md-4 text-center">
                    <div class="product-card p-3 border rounded">
                        <img src="/images/product-placeholder.svg" alt="Produto" class="img-fluid">
                        <p class="mt-2"><b>Produto 2</b></p>
                        <h5 class="text-primary fw-bold">49,99€</h5>
                        <button class="btn btn-dark mt-2 w-100">Adicionar à Wishlist</button>
                    </div>
                </div>

                <div class="col-md-4 text-center">
                    <div class="product-card p-3 border rounded">
                        <img src="/images/product-placeholder.svg" alt="Produto" class="img-fluid">
                        <p class="mt-2"><b>Produto 3</b></p>
                        <h5 class="text-primary fw-bold">79,99€</h5>
                        <button class="btn btn-dark mt-2 w-100">Adicionar à Wishlist</button>
                    </div>
                </div>

                <!-- Segunda Linha de Produtos -->
                <div class="col-md-4 text-center mt-4">
                    <div class="product-card p-3 border rounded">
                        <img src="/images/product-placeholder.svg" alt="Produto" class="img-fluid">
                        <p class="mt-2"><b>Produto 4</b></p>
                        <h5 class="text-primary fw-bold">119,99€</h5>
                        <button class="btn btn-dark mt-2 w-100">Adicionar à Wishlist</button>
                    </div>
                </div>

                <div class="col-md-4 text-center mt-4">
                    <div class="product-card p-3 border rounded">
                        <img src="/images/product-placeholder.svg" alt="Produto" class="img-fluid">
                        <p class="mt-2"><b>Produto 5</b></p>
                        <h5 class="text-primary fw-bold">29,99€</h5>
                        <button class="btn btn-dark mt-2 w-100">Adicionar à Wishlist</button>
                    </div>
                </div>

                <div class="col-md-4 text-center mt-4">
                    <div class="product-card p-3 border rounded">
                        <img src="/images/product-placeholder.svg" alt="Produto" class="img-fluid">
                        <p class="mt-2"><b>Produto 6</b></p>
                        <h5 class="text-primary fw-bold">59,99€</h5>
                        <button class="btn btn-dark mt-2 w-100">Adicionar à Wishlist</button>
                    </div>
                </div>
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



<%@ include file="includes/footer.jsp"%> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>
