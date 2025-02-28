<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${category.name} - CashMe</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">


</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<section class="container mt-5">
    <h2 class="fw-bold text-orange">${category.name}</h2>
    <p>Veja todos os produtos disponíveis nesta categoria.</p>
</section>

<section class="container mt-5">
    <div class="row">
        <c:choose>
            <c:when test="${not empty items}">
                <c:forEach var="item" items="${items}">
                    <div class="col-md-4 text-center">
                        <div class="product-card p-3 border rounded mb-4">
                            <a href="/item/${item.id}">
                                <img src="/images/${item.imageUrl}" alt="${item.name}" class="img-fluid" style="max-height: 150px;">
                            </a>
                            <h4 class="mt-2 fw-bold">${item.name}</h4>
                            <a href="/item/${item.id}" class="btn btn-primary w-100">Ver Produto</a>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="text-center">Nenhum produto disponível nesta categoria.</p>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<%@ include file="includes/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>