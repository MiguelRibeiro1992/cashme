<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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

    <style>
        .atm-button {
            background: none;
            border: none;
            cursor: pointer;
        }

        .atm-button img {
            width: 50px;
            height: 50px;
        }
    </style>

</head>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<div class="container mt-5">
    <h2 class="mb-4">Checkout</h2>

    <c:if test="${empty cartItems}">
        <p>O seu carrinho está vazio.</p>
    </c:if>

    <c:if test="${not empty cartItems}">
        <table class="table" style="text-align: center;">
            <thead>
                <tr>
                    <th>Produto</th>
                    <th>Preço</th>
                    <th>Quantidade</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="entry" items="${cartItems}">
                    <tr id="row-${entry.key.barcode}">
                        <td>${entry.key.name}</td>
                        <td><fmt:formatNumber value="${entry.key.price}" type="number" pattern="0.00"/> €</td>
                        <td>${entry.value}</td>
                        <td><fmt:formatNumber value="${entry.key.price * entry.value}" type="number" pattern="0.00"/> €</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <h4 class="mt-4">Total a pagar: <fmt:formatNumber value="${totalPrice}" type="number" pattern="0.00"/> €</h4>
</div>

<!-- Referencia Multibanco e QR Code para sair-->
<div class="container login-container d-flex flex-column align-items-center py-5" style="max-width: 70%;">
    <!-- Mostrar dados de pagamento se paid for false -->
    <div id="paymentReferenceSection">
        <h5>Dados para pagamento Multibanco</h5>
        <p><strong>Entidade:</strong> ${paymentReference.entity}</p>
        <p><strong>Referência:</strong> ${paymentReference.reference}</p>
        <p><strong>Valor:</strong> <fmt:formatNumber value="${paymentReference.amount}" type="number" pattern="0.00"/> €</p>
        <br>
        <button onclick="openAtmWindow()" class="atm-button">
            <img src="/images/atm.svg" alt="Pagar via Multibanco">
        </button>
    </div>

    <!-- QR Code -->
    <div id="qrcodeSection" style="display: none;">
        <h5>Apresente este QR Code na saída</h5>
        <img id="qrcode_cash_black" src="/images/qrcode_cash_black.svg" alt="QR Code"
             style="width: 150px; height: 150px"/>
    </div>
</div>

    <div class="d-flex justify-content-center">
        <a href="/cart" class="btn btn-secondary mt-3 d-flex align-items-center me-2">Voltar ao Carrinho</a>
        <button id="finalizePurchase" class="btn btn-primary mt-3 d-flex align-items-center ms-2">Compra Finalizada</button>
    </div>

<script>
    //Lógica para o botão "Compra Finalizada"
    document.getElementById("finalizePurchase").addEventListener("click", function () {
        fetch('/cart/clear', {
            method: 'GET'
        })
            .then(response => {
                if (response.ok) {
                    window.location.href = "/mainPage";
                } else {
                    console.error("Erro ao finalizar a compra.");
                }
            })
            .catch(error => console.error("Erro ao finalizar a compra:", error));
    });

    function openAtmWindow() {
        window.open('/atm', 'AtmWindow', 'width=400,height=500');
    }

    // // Verifica o pagamento a cada segundo
    // setInterval(checkPaymentStatus, 1000);

    function paymentSuccessful(cart_id) {
        document.getElementById("paymentReferenceSection").style.display = 'none'; // Esconde os dados de Multibanco
        document.getElementById("qrcodeSection").style.display = 'block'; // Mostra o QR Code
        document.getElementById("qrcode_cash_black").src = "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=/cart/finish/" + cart_id;
    }
</script>

<br>
<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>