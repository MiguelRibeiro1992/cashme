<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Scan Código de Barras | CashMe</title>

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

    <script src="https://unpkg.com/html5-qrcode@latest"></script>

</head>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Scan Container -->
<div class="container mt-5">
    <div class="row align-items-center">
        <!-- Área da câmara -->
        <div class="col-md-6 text-center" style="position: relative; width: 100%; max-width: 400px; height: 300px;">
            <img id="scanSymbol" src="/images/scanSymbol.svg" alt="Código de Barras" class="img-fluid" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
            <div id="reader" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; display: none;">
                <!-- div para carregar a camera -->
            </div>
        </div>

        <!-- Texto e botões -->
        <div class="col-md-6 d-flex flex-column justify-content-center">
            <h4 class="mb-3">Leitura de código de barras</h4>
            <div class="col-md-6 d-flex flex-column align-items-center">
                 <p class="bg-orange rounded me-2" style="width: 10px; height: 20px;"></p>
                 <p class="mb-0">Ler um código:</p>
                 <button id="startScan" class="btn btn-primary mt-3">Ligar a câmara</button>
                 <p class="text-muted mt-2" id="scanResult">Nenhum produto detetado</p>
            </div>

            <div id="productDetails" class="mt-4 text-center" style="display: none;">
                <h5>Produto Lido</h5>
                <p id="barcodeNumber"></p>
            </div>
        </div>
    </div>

    <!-- NFC Button and Actions -->
    <div class="row mt-5 align-items-center">
        <div class="col-md-6 text-start">
            <a href="/scanViaNFC">
                <img src="/images/button_changeToScanViaNFC.svg" alt="Mudar para Scan Via NFC" class="img-fluid">
            </a>
        </div>

        <div class="col-md-6 text-end">
            <button id="cancelButton" class="btn btn-outline-dark me-2">Anular</button>
            <a id="addToCart" href="/cart" class="btn btn-primary btn-login">Adicionar Carrinho</a>
        </div>
    </div>

</div>

<script>
    function onScanSuccess(decodedText, decodedResult) {
        let barcode = decodedText.trim();
        console.log(`Código capturado: "${barcode}"`); // Log para depuração

            if (barcode === "") {
                console.warn("Código de barras vazio detectado!");
                return;
            }

        // Exibir o código lido na página
        document.getElementById("scanResult").innerText = "Código lido: " + barcode;
            document.getElementById("barcodeNumber").innerText = barcode;

        // Mostrar o botão de adicionar ao carrinho
        document.getElementById("productDetails").style.display = "block";
        document.getElementById("addToCart").style.display = "inline-block";

        // Adicionar produto ao carrinho ao clicar
        document.getElementById("addToCart").onclick = function() {
            fetch("/addToCart?barcode=" + barcode, {
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
    }

    function onScanFailure(error) {
    }

    // Inicializa o scanner
    let html5QrcodeScanner = new Html5QrcodeScanner(
        "reader",
        {
                fps: 10,
                qrbox: { width: 250, height: 250 },
                formatsToSupport: [ Html5QrcodeSupportedFormats.EAN_13, Html5QrcodeSupportedFormats.UPC_A, Html5QrcodeSupportedFormats.CODE_128 ]
            },
            false
    );

    document.getElementById("startScan").addEventListener("click", function () {
        document.getElementById("scanSymbol").style.display = "none";
        document.getElementById("reader").style.display = "block";

        html5QrcodeScanner.render(onScanSuccess, onScanFailure);
    });

    // Botão de cancelar
    document.getElementById("cancelButton").addEventListener("click", function () {
        document.getElementById("scanSymbol").style.display = "block";
        document.getElementById("reader").style.display = "none";

        html5QrcodeScanner.clear()
            .then(() => console.log("Leitura cancelada."))
            .catch(err => console.log("Erro ao parar a leitura:", err));

        document.getElementById("scanResult").innerText = "Nenhum produto detetado";
        document.getElementById("barcodeNumber").innerText = "";
        document.getElementById("productDetails").style.display = "none";
    });
</script>


<br>
<br>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>
