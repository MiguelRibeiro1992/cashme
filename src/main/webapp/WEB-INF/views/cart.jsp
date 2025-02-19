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

<c:if test="${empty cartItems}">
    <p>Seu carrinho está vazio.</p>
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
            <c:forEach var="cartItem" items="${cartItems}">
                <tr>
                    <td>${cartItem.item.name}</td>
                    <td>${cartItem.item.price} €</td>
                    <td>${cartItem.quantity}</td>
                    <td>${cartItem.totalPrice} €</td>
                    <td>
                        <a href="/removeFromCart?barcode=${cartItem.item.barcode}" class="btn btn-danger btn-sm">Remover</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<h4 class="mt-4">Total: ${totalPrice} €</h4>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>
