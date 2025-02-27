<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>CashMe - Histórico</title>

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
    <p><a href="/mainPage" class="text-decoration-none text-dark">Home</a> / <b>Histórico</b></p>
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
                    <li><a href="/paymentMethods" class="text-decoration-none text-muted">Opções de Pagamento</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Encomendas</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/history" class="text-decoration-none text-orange">Histórico</a></li>
                    <li><a href="#" class="text-decoration-none text-muted">Estatísticas de Gastos</a></li>
                    <li><a href="#" class="text-decoration-none text-muted">Tracking de Preços</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Outros</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="#" class="text-decoration-none text-muted">Wishlist</a></li>
                    <li><a href="#" class="text-decoration-none text-muted">Notificações</a></li>
                    <li><a href="#" class="text-decoration-none text-muted">Pontos</a></li>
                    <li><a href="/settings" class="text-decoration-none text-muted">Definições</a></li>
                </ul>
            </div>
        </div>

        <!-- Histórico de Compras -->
        <div class="col-md-9 d-flex align-items-center">
            <div class="p-4 border rounded shadow-sm w-100 align-self-center">
                <h4 class="fw-bold text-orange">Histórico de Compras</h4>

                <!-- Filtro -->
                <div class="mb-4">
                    <label for="dateFilter" class="form-label fw-bold">Filtrar por Data</label>
                    <input type="date" id="dateFilter" class="form-control" name="dateFilter">
                </div>

                <!-- Tabela -->
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Data da Compra</th>
                        <th scope="col">Loja</th>
                        <th scope="col">Preço</th>
                        <th scope="col">Status</th>
                        <th scope="col">Detalhes</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Simulação de exemplos -->
                    <tr>
                        <td>2025-02-15</td>
                        <td>Fnac</td>
                        <td>€ 20,00</td>
                        <td><span class="badge bg-success">Pago</span></td>
                        <td>
                            <button class="btn btn-outline-secondary btn-sm">Ver Detalhes</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2025-02-10</td>
                        <td>Continente</td>
                        <td>€ 15,50</td>
                        <td><span class="badge bg-warning">Aguardando Pagamento</span></td>
                        <td>
                            <button class="btn btn-outline-secondary btn-sm">Ver Detalhes</button>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <!-- Se não houver compras, exibir uma mensagem -->
                <div id="noHistoryMessage" class="mt-3" style="display: none;">
                    <p class="text-center">Ainda não tem compras realizadas.</p>
                </div>

            </div>
        </div>

    </div>
</section>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>


