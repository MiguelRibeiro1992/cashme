<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Termos de Utilização - CashMe</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">
</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Seção Termos de Utilização -->
<!-- Caminho de navegação -->
<section class="container mt-4">
    <p><a href="/redirectToMainPage" class="text-decoration-none text-dark">Home</a> / <b>Termos de Utilização</b></p>
</section>

<!-- Seção Termos de Utilização -->
<section class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10"> <!-- Ajusta largura para evitar que fique colado à esquerda -->
            <h2 class="fw-bold text-orange">Termos de Utilização</h2>

            <p>Bem-vindo à nossa aplicação! Ao utilizar os nossos serviços, concorda com os seguintes termos:</p>

            <h4 class="fw-bold mt-4">1. Utilização da Aplicação</h4>
            <ul>
                <li>O utilizador deve fornecer informações corretas no registo e manter a conta segura.</li>
                <li>O uso indevido ou fraudulento resultará no bloqueio da conta.</li>
            </ul>

            <h4 class="fw-bold mt-4">2. Pagamentos e Transações</h4>
            <ul>
                <li>Os pagamentos são processados de forma segura através de métodos suportados.</li>
                <li>Não nos responsabilizamos por falhas em serviços de terceiros.</li>
            </ul>

            <h4 class="fw-bold mt-4">3. Privacidade e Dados</h4>
            <ul>
                <li>Respeitamos a sua privacidade e protegemos os seus dados conforme a nossa <a href="/privacy-policy" class="text-primary fw-bold">Política de Privacidade</a>.</li>
            </ul>

            <h4 class="fw-bold mt-4">4. Alterações e Encerramento</h4>
            <ul>
                <li>Podemos atualizar estes termos a qualquer momento, notificando os utilizadores.</li>
            </ul>

            <!-- Botão para voltar à página inicial -->
            <div class="d-flex mt-5 mb-5">
                <a href="/redirectToMainPage" class="btn btn-primary px-4 py-2 fw-bold">Voltar à página inicial</a>
            </div>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>