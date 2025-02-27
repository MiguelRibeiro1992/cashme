<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Pesquisa</title>

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

<div class="container mt-5">

    <h2 class="mb-4">Resultados da Pesquisa</h2>

    <c:if test="${empty searchResults}">
        <p>Nenhum item encontrado.</p>
    </c:if>


    <c:if test="${not empty searchResults}">
        <div class="row">
            <c:forEach var="item" items="${searchResults}">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="/images/${item.imageUrl}" alt="${item.name}" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">${item.name}</h5>
                            <p class="card-text">${item.description}</p>
                            <h6 class="text-success">${item.formattedPrice} €</h6>

                            <!-- Avaliação Clicável -->
                            <div class="d-flex align-items-center mb-2">
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
                            </div>

                            <!-- Botões -->
                            <div class="d-flex justify-content-end">
                                <a href="/scan/viaBarcode" class="btn btn-primary mt-3 d-flex align-items-center ms-2">Scan</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

    <!-- Botões final da página -->
    <c:if test="${empty searchResults}">
        <div class="d-flex justify-content-end">
            <a href="/mainPage" class="btn btn-primary mt-3 d-flex align-items-end ms-2">Voltar à página
                principal</a>
        </div>
    </c:if>

    <c:if test="${not empty searchResults}">
        <div class="d-flex justify-content-end">
            <a href="/mainPage" class="btn btn-primary mt-3 d-flex align-items-end ms-2">Voltar à pagina principal</a>
        </div>
    </c:if>

</div>

<br>

<%@ include file="includes/footer.jsp" %>

</body>
</html>


