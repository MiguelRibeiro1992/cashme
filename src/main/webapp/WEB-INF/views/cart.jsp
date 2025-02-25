<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Carrinho | CashMe</title>

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

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Cart Container -->
<div class="container mt-5">
    <h2 class="mb-4">Carrinho</h2>

    <c:if test="${empty cartItems}">
        <p>O seu carrinho está vazio.</p>
    </c:if>

    <c:if test="${not empty cartItems}">
        <table class="table">
            <thead>
            <tr>
                <th>Produto</th>
                <th>Preço</th>
                <th>Quantidade</th>
                <th>Total</th>
                <th>Ação</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="entry" items="${cartItems}">
                <tr id="row-${entry.key.barcode}">
                    <td>${entry.key.name}</td>
                    <td>${entry.key.price} €</td>
                    <td>${entry.value}</td>
                    <td>${entry.key.price * entry.value} €</td>
                    <td>
                        <form action="/cart/removeFromCart" method="GET">
                            <input type="hidden" name="barcode" value="${entry.key.barcode}">
                            <button type="submit" class="btn btn-danger">Eliminar</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <h4 class="mt-4">Total: <span id="totalPrice">${totalPrice}</span> €</h4>

    <br>

    <c:if test="${empty cartItems}">
        <div class="d-flex justify-content-end">
            <a href="/mainPage" class="btn btn-secondary mt-3 d-flex align-items-center me-2">Voltar à página principal</a>
            <a href="/scan/viaBarcode" class="btn btn-primary mt-3 d-flex align-items-center ms-2">Voltar ao Scan</a>
        </div>
    </c:if>

    <c:if test="${not empty cartItems}">
        <div class="d-flex justify-content-end">
            <a href="/cart/checkout" class="btn btn-secondary mt-3 d-flex align-items-center me-2">Finalizar Compra</a>
            <a href="/scan/viaBarcode" class="btn btn-primary mt-3 d-flex align-items-center ms-2">Voltar ao Scan</a>
        </div>
    </c:if>

    <br>
</div>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>
