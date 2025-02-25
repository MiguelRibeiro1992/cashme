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
<div class="container login-container d-flex flex-column align-items-center py-5" style="max-width: 70%;">

    <div class="row w-100 d-flex justify-content-center align-items-center" style="min-height: 350px;">
        <!-- Área da câmara -->
        <div class="col-md-6 d-flex justify-content-center">
            <div class="position-relative" style="width: 100%; max-width: 450px; height: 300px;">
                <img id="scanSymbol" src="/images/scanSymbol.svg" alt="Código de Barras" class="img-fluid position-absolute top-0 start-0 w-100 h-100">
                <div id="reader" class="position-absolute top-0 start-0 w-100 h-100" style="display: none;"></div>
            </div>
        </div>

        <!-- Texto e botões -->
        <div class="col-md-6 d-flex flex-column justify-content-center align-items-center text-center" style="min-height: 300px;">
            <div class="d-flex align-items-center mb-3">
                <img src="/images/rectangleBullet.svg" alt="Rectangle Bullet" class="img-fluid me-2">
                <h4 class="mb-0">Leitura de código de barras</h4>
            </div>
            <div class="d-flex flex-column align-items-center text-center w-100">
                <p class="text-muted">Aponte a câmara para o código</p>
                <button id="startScan" class="btn btn-primary mt-3">Ligar a câmara</button>
                <p class="text-muted mt-2" id="scanResult">Nenhum produto detetado</p>
            </div>
        </div>
    </div>

    <!-- NFC Button and Actions -->
    <div class="row mt-5 w-100 d-flex justify-content-between align-items-center">
        <!-- meter o botao ligeiramente mais para o centro -->
        <div class="col-md-6 text-start d-flex justify-content-center">
            <a href="/scan/viaNFC">
                <img src="/images/button_changeToScanViaNFC.svg" alt="Mudar para Scan Via NFC" class="img-fluid">
            </a>
        </div>

        <div class="col-md-6 text-end d-flex justify-content-center">
            <button id="cancelButton" class="btn btn-outline-dark me-2 px-4">Anular</button>
            <button id="addToCart" class="btn btn-primary px-4">Adicionar Carrinho</button>
        </div>
    </div>

</div>


<script>
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
        //Lógica para ter o botão dinânico
        let startScanButton = document.getElementById("startScan");
        startScanButton.innerText = "A ler...";
        startScanButton.classList.remove("btn-primary", "btn-success");
        startScanButton.classList.add("btn-warning");
        startScanButton.disabled = true;


        document.getElementById("scanSymbol").style.display = "none";
        document.getElementById("reader").style.display = "block";

        html5QrcodeScanner.render(onScanSuccess, onScanFailure);
    });

    // Botão de cancelar
    document.getElementById("cancelButton").addEventListener("click", function () {
        let startScanButton = document.getElementById("startScan");

        document.getElementById("scanSymbol").style.display = "block";
        document.getElementById("reader").style.display = "none";

        html5QrcodeScanner.clear()
            .then(() => console.log("Leitura cancelada."))
            .catch(err => console.log("Erro ao parar a leitura:", err));

        document.getElementById("scanResult").innerText = "Nenhum produto detetado";

        document.getElementById("addToCart").style.display = "none";

        startScanButton.innerText = "Ligar a câmara";
        startScanButton.classList.remove("btn-warning", "btn-success");
        startScanButton.classList.add("btn-primary");
        startScanButton.disabled = false;
    });

    function onScanSuccess(decodedText, decodedResult) {
            let barcode = decodedText.trim();

            if (barcode === "") {
                console.warn("Código de barras vazio detectado!");
                return;
            }

            // Exibir o código lido na página (por baixo do botão da câmara)
            document.getElementById("scanResult").innerText = "Código lido: " + barcode;

            let startScanButton = document.getElementById("startScan");
            startScanButton.innerText = "Produto detetado!";
            startScanButton.classList.remove("btn-warning");
            startScanButton.classList.add("btn-success");
            startScanButton.disabled = false;

            // Mostrar o botão de adicionar ao carrinho
            document.getElementById("addToCart").style.display = "inline-block";

            // Adicionar produto ao carrinho ao clicar
            document.getElementById("addToCart").onclick = function() {
                fetch("/cart/addToCart?barcode=" + barcode, {
                    method: 'GET',
                    headers: { 'Content-Type': 'application/json' }
                })
                .then(response => {
                    console.log("response", response);
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
        }

        function onScanFailure(error) {
        }

</script>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>
