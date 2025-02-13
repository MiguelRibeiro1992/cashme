<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Carrinho | CashMe</title>
    <link rel="stylesheet" href="/styles/custom.css">
</head>
<body>

<%@ include file="includes/header.jsp" %>

<div class="container mt-5">
    <h2>Carrinho de Compras</h2>

    <c:if test="${empty cartItems}">
        <p>O carrinho está vazio!</p>
    </c:if>

    <c:if test="${not empty cartItems}">
        <table class="table">
            <thead>
                <tr>
                    <th>Produto</th>
                    <th>Preço</th>
                    <th>Quantidade</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td>${item.name}</td>
                        <td>${item.price}€</td>
                        <td>${item.quantity}</td>
                        <td>
                            <a href="/removeFromCart?barcode=${item.barcode}" class="btn btn-danger">Remover</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h4>Total: ${totalPrice}€</h4>
        <a href="/clearCart" class="btn btn-warning">Esvaziar Carrinho</a>
    </c:if>
</div>

<%@ include file="includes/footer.jsp" %>

</body>
</html>
