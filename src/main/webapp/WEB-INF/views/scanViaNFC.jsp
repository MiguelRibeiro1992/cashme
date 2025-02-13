<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Scan NFC | CashMe</title>

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

    <!-- <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script> -->

</head>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Scan Container -->
<div class="container mt-5">
    <div class="row align-items-center">
        <!-- Símbolo do sensor -->
        <div class="col-md-6 text-center" style="position: relative; width: 100%; max-width: 400px; height: 300px;">
            <img id="nfcSymbol" src="/images/nfcSymbol.svg" alt="Leitor NFC" class="img-fluid" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
            <div id="reader" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; display: none;">
                <!-- div para símbolo do NFC? -->
            </div>
        </div>

        <!-- Texto e botões -->
        <div class="col-md-6 d-flex flex-column justify-content-center">
            <h4 class="mb-3">Leitura de código de barras</h4>
            <div class="col-md-6 d-flex flex-column align-items-center">
                <p class="bg-orange rounded me-2" style="width: 10px; height: 20px;"></p>
                <p class="mb-0">Ler um código:</p>
                <button id="startScan" class="btn btn-primary mt-3">A ler...</button>
                <p class="text-muted mt-2" id="scanResult">Nenhum produto detetado</p>
            </div>

            <div id="productDetails" class="mt-4 text-center" style="display: none;">
                <h5>Produto Detetado Com Sucesso</h5>
                <p id="productName"></p>
            </div>
        </div>
    </div>

    <!-- NFC Button and Actions -->
    <div class="row mt-5 align-items-center">
        <div class="col-md-6 text-start">
            <a href="/scanViaBarcode">
                <img src="/images/button_changeToScanViaBarcode.svg" alt="Mudar para Scan Via Barcode" class="img-fluid">
            </a>
        </div>

        <div class="col-md-6 text-end">
            <button class="btn btn-outline-dark me-2">Cancelar</button>
            <button class="btn btn-primary btn-login">Adicionar ao carrinho</button>
        </div>
    </div>

</div>

<!--
<script>
</script>
-->

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>