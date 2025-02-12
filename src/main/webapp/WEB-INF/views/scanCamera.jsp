<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Scan Código de Barras | CashMe</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">

    <!-- Importação do script para leitura de código de barras -->
    <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script>
</head>
<body class="login-page">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="/images/Logo_Cash.svg" alt="CashMe" height="40">
        </a>
    </div>
</nav>

<!-- Scan Container -->
<div class="container mt-5">
    <div class="row align-items-center">
        <!-- Área da câmara -->
        <div class="col-md-6 text-center">
            <div id="reader" class="border p-3" style="width: 100%; max-width: 400px; height: 300px;">
                <!-- A câmara será carregada aqui -->
            </div>
        </div>

        <!-- Texto e botões -->
        <div class="col-md-6 d-flex flex-column justify-content-center">
            <h4 class="mb-3">Leitura de código de barras</h4>
            <div class="d-flex align-items-center">
                <div class="bg-orange rounded me-2" style="width: 10px; height: 20px;"></div>
                <p class="mb-0">Ler um código:</p>
            </div>

            <button id="startScan" class="btn btn-primary mt-3">Ligar a câmara</button>
            <p class="text-muted mt-2" id="scanResult">Nenhum produto detetado</p>
        </div>
    </div>

    <!-- Linha com botões NFC e ações -->
    <div class="row mt-4">
        <!-- Botão para NFC -->
        <div class="col-md-6 text-start">
            <a href="/scanViaNFC">
                <img src="/static/images/button_changeToScanViaNFC.svg" alt="Mudar para Scan Via NFC" class="img-fluid">
            </a>
        </div>

        <!-- Botões de ação -->
        <div class="col-md-6 text-end">
            <button class="btn btn-outline-dark me-2">Cancelar</button>
            <button class="btn btn-primary">Adicionar ao carrinho</button>
        </div>
    </div>
</div>

<!-- Script para ativar a câmara e ler o código de barras -->
<script>
    document.getElementById("startScan").addEventListener("click", function () {
        const html5QrCode = new Html5Qrcode("reader");

        html5QrCode.start(
            { facingMode: "environment" }, // Usa a câmara traseira
            {
                fps: 10,
                qrbox: { width: 250, height: 250 }
            },
            (decodedText) => {
                document.getElementById("scanResult").innerText = "Código lido: " + decodedText;
                html5QrCode.stop();
            },
            (errorMessage) => {
                console.log("Erro na leitura: ", errorMessage);
            }
        ).catch((err) => {
            console.log("Erro ao iniciar a câmara: ", err);
        });
    });

    <!--document.getElementById("addToCartBtn").addEventListener("click", function () {
                const barcode = document.getElementById("scanResult").innerText.replace("Código lido: ", "");
                // Chama o serviço para adicionar o produto ao carrinho (de acordo com o código)
                fetch(`/addToCart?barcode=${barcode}`, { method: "POST" })
                    .then(response => {
                        if (response.ok) {
                            alert("Produto adicionado ao carrinho!");
                        }
                    })
                    .catch(err => console.error("Erro ao adicionar ao carrinho:", err));
            }); -->
</script>

</body>
</html>