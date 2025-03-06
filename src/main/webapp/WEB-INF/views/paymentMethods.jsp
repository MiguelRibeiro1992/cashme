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
    <p><a href="/mainPage" class="text-decoration-none text-dark">Home</a> / <b>Opções de Pagamento</b></p>
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
                    <li><a href="/account/paymentMethods" class="text-decoration-none text-orange">Opções de
                        Pagamento</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Encomendas</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/account/history" class="text-decoration-none text-muted">Histórico</a></li>
                    <li><a href="/account/stats" class="text-decoration-none text-muted">Estatísticas de Gastos</a></li>
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

        <!-- Opções de Pagamento -->
        <div class="col-md-9">
            <div class="p-4 border rounded shadow-sm w-100">
                <h4 class="fw-bold text-orange">Métodos de Pagamento</h4>
                <div class="row">
                    <!-- Cartões Atuais e Formulário Para Novo Cartão -->
                    <div class="col-md-6 border-end">
                        <c:choose>
                            <c:when test="${not empty paymentMethods}">
                                <h5 class="fw-bold">Cartões Atuais</h5>
                                <ul class="list-group mb-4">
                                    <c:forEach var="paymentMethod" items="${paymentMethods}">
                                        <li class="list-group-item d-flex justify-content-between align-items-center">

                                            <!-- Informação do Cartão -->
                                            <span>
                                <img src="/images/${paymentMethod.cardBrand}Icon.svg"
                                     alt="${paymentMethod.cardBrand}" class="me-2"
                                     style="width: 30px; height: 30px">
                                ${paymentMethod.cardBrand} --------- ${paymentMethod.cardNumber}
                            </span>

                                            <!-- Para apagar -->
                                            <form action="/account/paymentMethods/delete" method="post"
                                                  style="display: inline;">
                                                <input type="hidden" name="id" value="${paymentMethod.id}">
                                                <button type="submit" class="btn btn-sm btn-danger">
                                                    <img src="/images/delete.svg" alt="Deletar"
                                                         style="width: 16px; height: 16px;">
                                                </button>
                                            </form>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <p>Você ainda não adicionou nenhum método de pagamento.</p>
                            </c:otherwise>
                        </c:choose>

                        <h5 class="fw-bold">Adicionar Novo Cartão</h5>
                        <form action="/account/paymentMethods/add" method="post">
                            <div class="mb-3">
                                <select class="form-select" name="cardBrand" required>
                                    <option value="" selected disabled>Selecione o tipo de cartão</option>
                                    <option value="Visa">Visa</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" name="cardNumber" placeholder="Número do Cartão"
                                       required>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control" name="expiryDate"
                                           placeholder="Data de Validade" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control" name="cvv" placeholder="CVV" required>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center">
                                <button type="submit" class="btn btn-primary">Guardar Cartão</button>
                            </div>
                        </form>
                    </div>

                    <!-- Fundos -->
                    <div class="col-md-6">
                        <h5 class="fw-bold">Adicionar Fundos</h5>
                        <p class="mb-2">Valor Atual em Conta</p>
                        <h4 class="fw-bold text-orange">
                            <c:choose>
                                <c:when test="${accountBalance > 0}">€ ${accountBalance}</c:when>
                                <c:otherwise>€ 0,00</c:otherwise>
                            </c:choose>
                        </h4>

                        <p class="mt-4 text-center">Disponível em breve!</p>

                        <div class="mt-4 opacity-50">
                            <h5 class="fw-bold">Adicionar Fundos</h5>
                            <div class="d-flex flex-wrap gap-2">
                                <button class="btn btn-outline-secondary">€ 5</button>
                                <button class="btn btn-outline-secondary">€ 10</button>
                                <button class="btn btn-outline-secondary">€ 20</button>
                                <button class="btn btn-outline-secondary">€ 50</button>
                                <button class="btn btn-outline-secondary">€ 100</button>
                                <button class="btn btn-outline-secondary">€ 200</button>
                            </div>
                            <div class="d-flex justify-content-center mt-4">
                                <button class="btn btn-primary">Gerar Referência Multibanco</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>
