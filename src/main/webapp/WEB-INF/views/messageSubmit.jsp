<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Mensagem Enviada | CashMe</title>

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

<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<br>
<div class="container text-center mt-5">
    <h2 class="mb-4 text-success">✔ Mensagem Submetida com Sucesso!</h2>
    <p>Agradecemos o seu contacto. A nossa equipa entrará em contacto consigo o mais brevemente possível. 😊</p>
    <p>Se precisar de mais informações, pode enviar-nos um email para: <b>support@cashme.com</b></p>
    <p><b>Atenciosamente, <i>a equipa CashMe</i>.</b></p>

    <a href="/mainPage" class="btn btn-primary mt-3">Voltar à Página Inicial</a>
</div>
<br>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>
