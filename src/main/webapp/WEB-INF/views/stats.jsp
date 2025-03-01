<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>CashMe - Opções de Pagamento</title>

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
    <p><a href="/mainPage" class="text-decoration-none text-dark">Home</a> / <b>Estatísticas de Gastos</b></p>
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
                    <li><a href="/account/stats" class="text-decoration-none text-orange">Estatísticas de Gastos</a></li>
                    <li><a href="/account/tracking" class="text-decoration-none text-muted">Tracking de Preços</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Outros</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/account/notifications" class="text-decoration-none text-muted">Notificações</a></li>
                    <li><a href="/account/points" class="text-decoration-none text-muted">Pontos</a></li>
                    <li><a href="/account/settings" class="text-decoration-none text-muted">Definições</a></li>
                </ul>
            </div>
        </div>

        <!-- Estatísticas de Gastos -->
        <div class="col-md-9">
            <div class="p-4 border rounded shadow-sm w-100">
                <h4 class="fw-bold text-orange">Estatísticas de Gastos</h4>

                <div class="d-flex justify-content-around text-center">
                    <!-- Eventualmente ter gráficos aqui -->
                </div>

                <h5 class="mt-4 fw-bold">Gastos Por Loja</h5>

                <c:if test="${empty totalByStore}">
                    <div id="noHistoryMessage" class="mt-3">
                        <p class="text-center">Ainda não tem compras realizadas.</p>
                    </div>
                </c:if>

                <c:if test="${not empty totalByStore}">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Loja</th>
                            <th scope="col">Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="counter" value="1" />
                        <c:forEach var="entry" items="${totalByStore}">
                            <tr>
                                <td>${counter}</td>
                                <td>${entry.key}</td>
                                <td>€ ${entry.value}</td>
                            </tr>
                            <c:set var="counter" value="${counter + 1}" />
                        </c:forEach>
                        </tbody>
                    </table>

                </c:if>

            </div>
        </div>


    </div>
</section>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>
