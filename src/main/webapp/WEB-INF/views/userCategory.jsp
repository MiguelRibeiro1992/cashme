<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Categorias</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">

</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Seção de Categorias -->
<section class="container mt-5">
    <h2 class="fw-bold text-center mb-4">Explora as Nossas Categorias</h2>

    <!-- Verifica se há categorias -->
    <c:choose>
        <c:when test="${not empty categorias}">
            <div class="row row-cols-2 row-cols-md-4 row-cols-lg-6 g-4 text-center">
                <c:forEach var="categoria" items="${categorias}">
                    <div class="col">
                        <div class="category-card p-3">
                            <a href="/loja?categoria=${categoria.name}" class="text-decoration-none text-dark">
                                <img src="${not empty categoria.imagemUrl ? categoria.imagemUrl : '/images/default-category.png'}"
                                     alt="${categoria.name}" class="img-fluid rounded-circle shadow-sm" style="width: 100px; height: 100px;">
                                <p class="mt-2 fw-bold">${categoria.name}</p>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <p class="text-center text-muted">Ainda não há categorias disponíveis.</p>
        </c:otherwise>
    </c:choose>
</section>

<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>