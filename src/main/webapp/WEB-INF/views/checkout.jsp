<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Checkout | CashMe</title>

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
    <h2 class="mb-4">Checkout</h2>

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
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cartItem" items="${cartItems}">
                    <tr>
                        <td>${cartItem.item.name}</td>
                        <td>${cartItem.item.price} €</td>
                        <td>${cartItem.quantity}</td>
                        <td>${cartItem.totalPrice} €</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <h4 class="mt-4">Total a pagar: ${totalPrice} €</h4>


</div>

<script>
     cript>
             document.addEventListener("DOMContentLoaded", function() {
                 fetch('/checkout/qrcode')
                     .then(response => {
                         if (!response.ok) {
                             throw new Error('Network response was not ok');
                         }
                         return response.blob();
                     })
                     .then(blob => {
                         const url = URL.createObjectURL(blob);
                         document.getElementById('qrcode').src = url;
                     })
                     .catch(error => console.error('Error fetching QR code:', error));
             });
</script>

<!-- QR Code para pagamento -->
    <div class="text-center mt-4">
        <h5>Apresente este QR Code para pagamento</h5>
        <img id="qrcode" alt="QR Code" />
    </div>

    <div class="text-center mt-4">
        <a href="/cart" class="btn btn-secondary">Voltar ao Carrinho</a>
    </div>

<br>
<br>
<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>
