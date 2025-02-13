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


<div class="container mt-5">
    <h3>Carrinho de Compras</h3>

        <c:choose>
            <c:when test="${empty cartItems}">
                <p class="text-muted">O seu carrinho está vazio.</p>
            </c:when>
            <c:otherwise>
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
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>${item.name}</td>
                                <td>${item.price} €</td>
                                <td>${item.quantity}</td>
                                <td>${item.price * item.quantity} €</td>
                                <td>
                                    <a href="/removeFromCart?barcode=${item.barcode}" class="btn btn-danger btn-sm">Remover</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <h4 class="mt-4">Total: ${totalPrice} €</h4>

                <!-- Ainda não há esta view -->
                <div class="mt-3">
                    <a href="/clearCart" class="btn btn-warning">Limpar Carrinho</a>
                    <a href="/" class="btn btn-success">Finalizar Compra</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>
