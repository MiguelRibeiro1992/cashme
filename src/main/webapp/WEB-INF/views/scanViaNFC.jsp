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
            <h4 class="mb-3">Leitura de NFC</h4>
            <div class="col-md-6 d-flex flex-column align-items-center">
                <p class="bg-orange rounded me-2" style="width: 10px; height: 20px;"></p>
                <p class="mb-0">Detetar um código:</p>
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
            <button id="cancelButton" class="btn btn-outline-dark me-2">Anular</button>
            <a id="addToCart" href="/cart" class="btn btn-primary btn-login">Adicionar Carrinho</a>
        </div>
    </div>

</div>

<!-- Script para usar sensor NFC no computador (não funciona neste computador) -->
<!-- DESATIVADO PARA TESTAR
<script>
document.getElementById("startScan").addEventListener("click", async () => {
    if ("NDEFReader" in window) {
        try {
            const nfcReader = new NDEFReader();
            await nfcReader.scan();

            console.log("NFC ativo! Aproxima uma tag...");

            nfcReader.onreading = event => {
                const decoder = new TextDecoder();
                for (const record of event.message.records) {
                    const text = decoder.decode(record.data);
                    console.log("Código lido:", text);

                    document.getElementById("scanResult").innerText = "Produto identificado!";
                    document.getElementById("productDetails").style.display = "block";
                    document.getElementById("productName").innerText = text;
                }
            };
        } catch (error) {
            console.error("Erro ao ler NFC:", error);
            alert("Erro ao ativar o NFC. Verifica se o teu dispositivo suporta esta funcionalidade.");
        }
    } else {
        alert("O teu navegador não suporta NFC.");
    }
});

document.getElementById("cancelButton").addEventListener("click", function() {
    document.getElementById("nfcSymbol").style.display = "block";
    document.getElementById("reader").style.display = "none";

    document.getElementById("scanResult").innerText = "";
    document.getElementById("productName").innerText = "";
    document.getElementById("productDetails").style.display = "none";

    setTimeout(() => {
        document.getElementById("scanResult").innerText = "Nenhum produto detetado";
    }, 10);
});

</script>
-->

<!-- Para teste: Dá um produto fictício -->
<script>
document.addEventListener("DOMContentLoaded", () => {
    const startScanButton = document.getElementById("startScan");
    const addToCartButton = document.getElementById("addToCart");
    const cancelButton = document.getElementById("cancelButton");

    if (!startScanButton) {
        console.error("startScan button not found");
        return;
    }

    if (!addToCartButton) {
        console.error("addToCart button not found");
        return;
    }

    if (!cancelButton) {
        console.error("cancelButton not found");
        return;
    }

    startScanButton.addEventListener("click", async () => {
        console.log("Simulação: NFC ativado! Aproxima uma tag...");

        setTimeout(() => {
            const decodedText = "9780241458747"; // Código simulado
            console.log("Código lido (simulado):", decodedText);

            // Atualizar UI como se tivesse lido um código real
            document.getElementById("scanResult").innerText = "Produto identificado!";
            document.getElementById("productDetails").style.display = "block";
            document.getElementById("productName").innerText = decodedText;

            // Adicionar evento ao botão "Adicionar ao Carrinho"
            addToCartButton.onclick = function() {
                console.log("Adicionar ao Carrinho clicked");
                fetch("/addToCart?barcode=" + decodedText, {
                    method: 'GET',
                    headers: { 'Content-Type': 'application/json' }
                })
                .then(response => {
                    if (response.ok) {
                        window.location.href = '/cart';
                    } else {
                        alert("Produto não encontrado.");
                    }
                })
                .catch(error => {
                    console.error("Erro ao adicionar ao carrinho:", error);
                    alert("Erro ao adicionar ao carrinho.");
                });
            };
        }, 2000); // Simula um atraso de 2 segundos para parecer real
    });

    cancelButton.addEventListener("click", function() {
        document.getElementById("nfcSymbol").style.display = "block";
        document.getElementById("reader").style.display = "none";

        document.getElementById("scanResult").innerText = "";
        document.getElementById("productName").innerText = "";
        document.getElementById("productDetails").style.display = "none";

        setTimeout(() => {
            document.getElementById("scanResult").innerText = "Nenhum produto detetado";
        }, 10);
    });
});
</script>

<br>
<br>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>