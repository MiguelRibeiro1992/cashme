<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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

<!-- Título da Página -->
<section class="container mt-5">
    <h2 class="fw-bold text-orange">Todas as Lojas</h2>
    <p>Explore as nossas lojas disponíveis e descubra os melhores produtos.</p>
</section>

<!-- Lista de Lojas -->
<section class="container mt-5">
    <div class="row d-flex justify-content-center">
        <c:choose>
            <c:when test="${not empty stores}">
                <c:forEach var="store" items="${stores}">
                    <div class="col-md-4 text-center">
                        <div class="store-card p-3 border rounded mb-4">
                            <a href="/storeView/${store.id}">
                                <img src="/images/${store.imageUrl}" alt="${store.name}" class="img-fluid" style="max-height: 150px;">
                            </a>
                            <h4 class="mt-2 fw-bold">${store.name}</h4>
                            <p>Descubra os produtos disponíveis nesta loja.</p>
                            <a href="/storeView/${store.id}" class="btn btn-primary w-100">Ver Loja</a>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="text-center">Nenhuma loja disponível no momento.</p>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<%@ include file="includes/footer.jsp"%> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>