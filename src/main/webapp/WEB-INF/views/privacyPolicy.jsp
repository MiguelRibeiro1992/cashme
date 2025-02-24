<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Política de Privacidade - CashMe</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">
</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Caminho de navegação -->
<!-- Caminho de navegação -->
<section class="container mt-4">
    <p><a href="/redirectToMainPage" class="text-decoration-none text-dark">Home</a> / <b>Política de Privacidade</b></p>
</section>

<!-- Conteúdo Principal -->
<section class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10"> <!-- Ajusta largura para evitar que fique colado à esquerda -->
            <h2 class="fw-bold text-orange">Política de Privacidade</h2>

            <p>A sua privacidade é importante para nós. Esta Política de Privacidade explica como recolhemos, utilizamos e protegemos os seus dados ao utilizar a nossa aplicação.</p>

            <h4 class="fw-bold mt-4">1. Informações Recolhidas</h4>
            <p>Podemos recolher os seguintes dados quando utiliza os nossos serviços:</p>
            <ul>
                <li>Informações de registo (nome, email, telefone);</li>
                <li>Dados de pagamento (cartão de crédito/débito, MB Way, Apple Pay, Google Pay);</li>
                <li>Dados de utilização (pesquisas, compras, preferências de produtos);</li>
                <li>Informações de dispositivo (IP, tipo de navegador, sistema operativo).</li>
            </ul>

            <h4 class="fw-bold mt-4">2. Como Utilizamos os Seus Dados</h4>
            <p>Os seus dados são utilizados para:</p>
            <ul>
                <li>Fornecer e melhorar os nossos serviços;</li>
                <li>Processar pagamentos e transações seguras;</li>
                <li>Personalizar a sua experiência (recomendações e promoções);</li>
                <li>Enviar notificações relevantes (promoções, atualizações de preços).</li>
            </ul>

            <!-- Secção oculta com mais texto -->
            <div id="moreText" class="d-none">
                <h4 class="fw-bold mt-4">3. Segurança dos Dados</h4>
                <p>Tomamos medidas rigorosas para proteger os seus dados contra acessos não autorizados, perdas ou alterações indevidas. As nossas práticas incluem:</p>
                <ul>
                    <li>Criptografia de dados sensíveis;</li>
                    <li>Monitorização contínua da segurança;</li>
                    <li>Restrições de acesso a informações confidenciais.</li>
                </ul>

                <h4 class="fw-bold mt-4">4. Partilha de Dados</h4>
                <p>Os seus dados não serão vendidos ou partilhados com terceiros sem o seu consentimento, exceto em situações legais ou para garantir a segurança dos nossos serviços.</p>
            </div>

            <!-- Botões -->
            <div class="d-flex mt-5 mb-5">
                <button id="readMoreBtn" class="btn btn-light text-muted me-3">
                    <span id="btnText">↓ Continuar a ler</span>
                </button>
                <a href="/redirectToMainPage" class="btn btn-primary px-4 py-2 fw-bold">Voltar à página inicial</a>
            </div>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<!-- Scripts -->
<script>
    document.getElementById("readMoreBtn").addEventListener("click", function() {
        var moreText = document.getElementById("moreText");
        var btnText = document.getElementById("btnText");

        if (moreText.classList.contains("d-none")) {
            moreText.classList.remove("d-none");
            btnText.textContent = "↑ Mostrar menos";
        } else {
            moreText.classList.add("d-none");
            btnText.textContent = "↓ Continuar a ler";
        }
    });
</script>

</body>
</html>