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
    <p><a href="/mainPage" class="text-decoration-none text-dark">Home</a> / <b>Tracking de Preços</b></p>
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
                    <li><a href="/account/paymentMethods" class="text-decoration-none text-muted">Opções de
                        Pagamento</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Encomendas</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/account/history" class="text-decoration-none text-muted">Histórico</a></li>
                    <li><a href="/account/stats" class="text-decoration-none text-muted">Estatísticas de Gastos</a></li>
                    <li><a href="/account/tracking" class="text-decoration-none text-orange">Tracking de Preços</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Outros</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/account/notifications" class="text-decoration-none text-muted">Notificações</a></li>
                    <li><a href="/account/points" class="text-decoration-none text-muted">Pontos</a></li>
                    <li><a href="/account/settings" class="text-decoration-none text-muted">Definições</a></li>
                </ul>
            </div>
        </div>

        <!-- Tracking de Preços -->
        <div class="col-md-9">
            <div class="p-4 border rounded shadow-sm w-100">
                <h4 class="fw-bold text-orange">Tracking de Preços</h4>

                <!-- Barra de pesquisa -->
                <div class="mb-3">
                    <input type="text" id="searchBar" name="query" class="form-control" placeholder="Pesquisar produto..." onkeyup="filterProducts()">
                </div>


                    <table class="table table-striped" id="priceTable">
                        <thead>
                        <tr>
                            <th>Produto</th>
                            <th>Preço (€ &#x2B07)</th>
                            <th>Loja</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${items}">
                            <tr>
                                <td>${item.name}</td>
                                <td>€ ${item.price}</td>
                                <td>${item.store.name}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

            </div>
        </div>

    </div>
</section>

<script>
    function filterProducts() {
        let input = document.getElementById("searchBar").value.toLowerCase();
        let normalizedInput = normalizeString(input);
        let rows = document.querySelectorAll("#priceTable tbody tr");

        rows.forEach(row => {
            let product = row.cells[0].textContent.toLowerCase();
            let normalizedProduct = normalizeString(product);

            if (normalizedProduct.includes(normalizedInput)) {
                row.style.display = "";
            } else {
                row.style.display = "none";
            }
        });
    }

    // Função para remover acentos e tornar a pesquisa insensível a maiúsculas
    function normalizeString(str) {
        return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toLowerCase();
    }
</script>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>
