<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Lojas</title>

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

<section class="container mt-4">
    <h2 class="fw-bold">Encontre uma loja</h2>
    <div class="row mt-3">
        <!-- Barra de pesquisa e lista de lojas -->
        <div class="col-md-4">
            <input type="text" class="form-control mb-3" placeholder="Procure por Região">
            <p class="text-muted">15 lojas perto de si</p>
            <button class="btn btn-outline-secondary mb-3">Filtro</button>

            <!-- Lista de Lojas (Escrito Manualmente) -->
            <div class="list-group">
                <div class="list-group-item border-0">
                    <h5 class="fw-bold">FNAC</h5>
                    <p class="mb-1">Centro Colombo, Av. Lusíada Loja A - 103, Lisboa, PT</p>
                    <p class="text-danger fw-bold">Fechado - Abre às 11:00</p>
                </div>

                <div class="list-group-item border-0">
                    <h5 class="fw-bold">LIDL</h5>
                    <p class="mb-1">Entrecampos, Rua Cordeiro de Sousa, Lisboa, PT</p>
                    <p class="text-success fw-bold">Aberto - Fecha às 21:30</p>
                </div>

                <div class="list-group-item border-0">
                    <h5 class="fw-bold">IKEA</h5>
                    <p class="mb-1">Alfragide, Lisboa, PT</p>
                    <p class="text-danger fw-bold">Fechado - Abre às 21:30</p>
                </div>
            </div>
        </div>

        <!-- Mapa (Imagem Estática) -->
        <div class="col-md-8 mb-6">
            <img src="/images/map.svg" alt="Mapa de Localização" class="img-fluid rounded shadow-sm w-100">
        </div>
    </div>
</section>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

