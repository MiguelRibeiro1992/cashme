<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Sobre Nós</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">
</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Caminho de navegação -->
<section class="container mt-4">
    <p><a href="/mainPage" class="text-decoration-none text-dark">Home</a> / <b>Sobre Nós</b></p>
</section>

<!-- Seção Principal -->
<section class="container mt-5">
    <div class="row align-items-center">
        <div class="col-md-5">
            <h1 class="fw-bold mb-4">Sobre Nós</h1> <!-- Aumentei o espaçamento abaixo do título -->
            <p class="mb-3">
                Na <b>Cash Me If You Can</b>, acreditamos que o futuro das compras é rápido, simples e sem filas.
                Desenvolvemos soluções inovadoras que eliminam barreiras no checkout, permitindo que os clientes
                paguem de forma eficiente e segura através dos seus dispositivos móveis.
            </p>
            <p class="mb-3">
                Com tecnologia intuitiva e integração de pagamentos digitais, ajudamos lojistas a melhorar
                a experiência dos seus clientes e a otimizar as suas vendas.
            </p>
            <p>
                Transformamos a conveniência numa realidade – porque o tempo é dinheiro!
            </p>
        </div>
        <div class="col-md-6 d-flex justify-content-end"> <!-- Move a imagem mais para a direita -->
            <img src="/images/aboutus.svg" alt="Sobre Nós" class="img-fluid w-100 border rounded" style="max-width: 90%;">
        </div>
    </div>
</section>


<!-- Estatísticas - Nova Versão -->
<section class="container text-center mt-5">
    <img src="/images/pub.svg" alt="Estatísticas da CashMe" class="img-fluid w-100">
</section>


<!-- Equipa -->
<section class="container text-center mt-5">
    <div class="row">
        <div class="col-md-4 p-3">
            <img src="/images/goncalolopes.svg" alt="Gonçalo Lopes" class="img-fluid rounded-circle">
            <h4 class="fw-bold mt-3">Gonçalo Lopes</h4>
            <p>Dev</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="#"><img src="/images/x.svg" alt="X" class="social-icon"></a>
                <a href="#"><img src="/images/instagramcolor.svg" alt="Instagram" class="social-icon" style="width: 25px; height: 25px"></a>
                <a href="https://www.linkedin.com/in/goncalolopesmk/"><img src="/images/linkedincolor.svg" alt="LinkedIn" class="social-icon" style="width: 25px; height: 25px"></a>
            </div>
        </div>
        <div class="col-md-4 p-3">
            <img src="/images/dianaclemente.svg" alt="Diana Clemente" class="img-fluid rounded-circle">
            <h4 class="fw-bold mt-3">Diana Clemente</h4>
            <p>Dev</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="#"><img src="/images/x.svg" alt="X" class="social-icon"></a>
                <a href="#"><img src="/images/instagramcolor.svg" alt="Instagram" class="social-icon" style="width: 25px; height: 25px"></a>
                <a href="https://www.linkedin.com/in/diana-clemente-120abb103/"><img src="/images/linkedincolor.svg" alt="LinkedIn" class="social-icon" style="width: 25px; height: 25px"></a>
            </div>
        </div>
        <div class="col-md-4 p-3">
            <img src="/images/miguelribeiro.svg" alt="Miguel Ribeiro" class="img-fluid rounded-circle">
            <h4 class="fw-bold mt-3">Miguel Ribeiro</h4>
            <p>Dev</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="https://x.com/MiguelRibeiroPT"><img src="/images/x.svg" alt="X" class="social-icon"></a>
                <a href="#"><img src="/images/instagramcolor.svg" alt="Instagram" class="social-icon" style="width: 25px; height: 25px"></a>
                <a href="https://www.linkedin.com/in/pedro-miguel-rodrigues-ribeiro-737000206/"><img src="/images/linkedincolor.svg" alt="LinkedIn" class="social-icon" style="width: 25px; height: 25px"></a>
            </div>
        </div>
    </div>
</section>


<!-- Benefícios -->
<section class="container text-center mt-5">
    <div class="row mt-6 mb-6">
        <div class="col-md-4">
            <div class="icon-circle">
                <img src="/images/scanMini.svg" alt="Leitura fácil e rápida" class="img-fluid">
            </div>
            <h4 class="fw-bold mt-3">Leitura fácil e rápida</h4>
            <p>Leitura de produtos fácil de usar para fast-checkout</p>
        </div>
        <div class="col-md-4">
            <div>
                <img src="/images/phonesMini.svg" alt="Apoio ao cliente" class="img-fluid">
            </div>
            <h4 class="fw-bold mt-3">Apoio ao cliente</h4>
            <p>Linha de apoio ao cliente disponível 24/7</p>
        </div>
        <div class="col-md-4">
            <div>
                <img src="/images/securityMini.svg" alt="Segurança garantida" class="img-fluid">
            </div>
            <h4 class="fw-bold mt-3">Segurança garantida</h4>
            <p>Procedimentos com segurança máxima garantida</p>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>
