<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>CashMe - Pontos</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Breadcrumb -->
<section class="container mt-4">
    <p><a href="/mainPage" class="text-decoration-none text-dark">Home</a> / <b>Pontos</b></p>
</section>

<!-- Seção Principal -->
<section class="container mt-4">
    <div class="row aling-items center mb-6">
        <!-- Sidebar de navegação -->
        <div class="col-md-3">
            <div class="p-4 border rounded shadow-sm">
                <h5 class="fw-bold">Gestão de Conta</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/account" class="text-decoration-none text-muted">O meu perfil</a></li>
                    <li><a href="/account/paymentMethods" class="text-decoration-none text-muted">Opções de Pagamento</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Encomendas</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/account/history" class="text-decoration-none text-muted">Histórico</a></li>
                    <li><a href="/account/stats" class="text-decoration-none text-muted">Estatísticas de Gastos</a></li>
                    <li><a href="/account/tracking" class="text-decoration-none text-muted">Tracking de Preços</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Outros</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/wishlist" class="text-decoration-none text-muted">Wishlist</a></li>
                    <li><a href="/account/notifications" class="text-decoration-none text-muted">Notificações</a></li>
                    <li><a href="/account/points" class="text-decoration-none text-orange">Pontos</a></li>
                    <li><a href="/account/settings" class="text-decoration-none text-muted">Definições</a></li>
                </ul>
            </div>
        </div>

        <!-- Formulário de Definições da Conta -->
        <div class="col-md-9 d-flex align-items-center">
            <div class="p-4 border rounded shadow-sm w-100 align-self-center">
                <h4 class="fw-bold text-orange">Pontos</h4>
                <form id="settingsForm">
                    <div class="row g-3">
                        <!-- Secção de Pontos -->
                            <div class="p-4 border rounded shadow-sm w-100">
                                <div class="row g-3">
                                    <!-- Pontos Atuais -->
                                    <div class="col-md-6">
                                        <div class="p-3 border rounded text-center bg-light w-100">
                                            <h5 class="fw-bold">Pontos Atuais</h5>
                                            <p class="fs-4 fw-bold text" style="color: #d1641d">1258</p> <!-- Número fictício -->
                                        </div>
                                    </div>

                                    <!-- Pontos a Expirar -->
                                    <div class="col-md-6">
                                        <div class="p-3 border rounded text-center bg-light w-100">
                                            <h5 class="fw-bold">Pontos a expirar nos próximos 30 dias:</h5>
                                            <p class="fs-4 fw-bold text" style="color: #606060">279</p> <!-- Número fictício -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <br>
                        <h5 class="fw-bold text-orange">Produtos disponíveis para redimir</h5>
                        <div class="p-4 border rounded shadow-sm w-100">
                            Neste momento não há produtos para redimir.
                        </div>

                        <!-- Botões -->
                            <div class="col-12 d-flex justify-content-end mt-3">
                                <button type="submit" class="btn btn-primary" id="saveSettingsBtn">Redimir Pontos
                                </button>
                            </div>
                        </div>
                </form>
            </div>
        </div>

    </div>
</section>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>