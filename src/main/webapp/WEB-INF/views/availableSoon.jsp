<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Em Breve | Fast Checkout</title>

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

<!-- Breadcrumb -->
<section class="container mt-4">
    <p><a href="/mainPage" class="text-decoration-none text-dark">Home</a> / <b>Em Breve</b></p>
</section>

<!-- Seção Principal -->
<section class="container mt-4">
    <div class="row align-items-center downloadHeader">
        <div class="col-md-6 d-flex justify-content-center">
            <img src="/images/mobileApp.svg" alt="Fast Checkout" class="img-fluid w-50">
        </div>
        <div class="col-md-6 text-align-center">
            <div class="p-4 border rounded shadow-sm">
                <h2> 🚀 O futuro das compras está a chegar!</h2>
                <p class="mt-3">Diga adeus às filas e aos processos demorados! Com o <b>Fast Checkout</b>, pagar as suas compras nunca foi tão rápido e simples.
                    Um único toque e está pronto para seguir viagem.</p>
                <p>Fique entre os primeiros a experimentar esta revolução no checkout. Simples, seguro e sem complicações!</p>
                <p><b>Prepare-se para uma nova experiência de compras! 📲</b></p>
                <span class="btn-like mt-3 align-items-center">Disponível em breve</span>
            </div>
        </div>
    </div>
</section>


<%@ include file="includes/footer.jsp"%> <!-- Footer -->

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>