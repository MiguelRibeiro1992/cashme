<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>CashMe - Scan NFC</title>

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

<!-- Scan Container -->
<div class="container login-container d-flex flex-column align-items-center py-5" style="max-width: 70%;">

    <div class="row w-100 d-flex justify-content-center align-items-center" style="min-height: 350px;">
        <!-- Área do sensor NFC -->
        <div class="col-md-6 d-flex justify-content-center">
            <div class="position-relative" style="width: 100%; max-width: 450px; height: 300px;">
                <img id="nfcSymbol" src="/images/nfcSymbol.svg" alt="Leitor NFC"
                     class="img-fluid position-absolute top-0 start-0 w-100 h-100">
                <div id="reader" class="position-absolute top-0 start-0 w-100 h-100" style="display: none;"></div>
            </div>
        </div>

        <!-- Texto e botões -->
        <div class="col-md-6 d-flex flex-column justify-content-center align-items-center text-center"
             style="min-height: 300px;">
            <div class="d-flex align-items-center mb-3">
                <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid me-2">
                <h4 class="mb-0">Leitura de NFC</h4>
            </div>
            <div class="d-flex flex-column align-items-center text-center w-100">
                <p class="text-muted">Aproxime a tag NFC do sensor</p>
                <button id="startScan" class="btn btn-primary mt-3">Ligar NFC</button>
                <p class="text-muted mt-2" id="scanResult">Nenhum produto detetado</p>
            </div>
        </div>
    </div>

    <!-- NFC Button and Actions -->
    <div class="row mt-5 w-100 d-flex justify-content-between align-items-center">
        <div class="col-md-6 text-start d-flex justify-content-center">
            <a href="/scan/viaBarcode">
                <img src="/images/button_changeToScanViaBarcode.svg" alt="Mudar para Scan Via Barcode"
                     class="img-fluid">
            </a>
        </div>

        <div class="col-md-6 text-end d-flex justify-content-center">
            <button id="cancelButton" class="btn btn-outline-dark me-2 px-4">Anular</button>
            <button id="addToCart" class="btn btn-primary px-4">Adicionar ao Carrinho</button>
        </div>
    </div>
</div>

<!-- Para teste: Dá com um produto fictício -->
<script>
    document.getElementById("startScan").addEventListener("click", async () => {
        let startScanButton = document.getElementById("startScan");
        startScanButton.innerText = "A ler...";
        startScanButton.classList.remove("btn-primary", "btn-success");
        startScanButton.classList.add("btn-warning");
        startScanButton.disabled = true;

        document.getElementById("nfcSymbol").style.display = "none";
        document.getElementById("reader").style.display = "block";

        setTimeout(() => {
            let fakeCode = "9780241458747"; // Código simulado
            document.getElementById("scanResult").innerText = "Código lido: " + fakeCode;
            startScanButton.innerText = "Produto detetado!";
            startScanButton.classList.remove("btn-warning");
            startScanButton.classList.add("btn-success");
            startScanButton.disabled = false;

            document.getElementById("addToCart").style.display = "inline-block";
            document.getElementById("addToCart").onclick = function () {
                fetch("/cart/addToCart?barcode=" + fakeCode, {
                    method: 'GET',
                    headers: {'Content-Type': 'application/json'}
                })
                    .then(response => {
                        if (response.ok) {
                            window.location.href = "/cart";
                        } else {
                            console.error("Produto não encontrado.");
                        }
                    })
                    .catch(error => {
                        console.error("Erro ao adicionar ao carrinho:", error);
                    });
            };
        }, 2000);
    });

    document.getElementById("cancelButton").addEventListener("click", function () {
        let startScanButton = document.getElementById("startScan");

        document.getElementById("nfcSymbol").style.display = "block";
        document.getElementById("reader").style.display = "none";

        document.getElementById("scanResult").innerText = "Nenhum produto detetado";
        document.getElementById("addToCart").style.display = "inline-block";

        startScanButton.innerText = "Ligar NFC";
        startScanButton.classList.remove("btn-warning", "btn-success");
        startScanButton.classList.add("btn-primary");
        startScanButton.disabled = false;
    });
</script>

<!-- Footer -->
<%@ include file="includes/footer.jsp" %>

</body>
</html>