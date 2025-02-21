<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Contacto</title>

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

<!-- Breadcrumb -->
<section class="container mt-4">
    <p><a href="/mainPage" class="text-decoration-none text-dark">Home</a> / <b>Contacto</b></p>
</section>

<!-- Seção Principal -->
<section class="container mt-4">
    <div class="row align-items-center">
        <!-- Contacto Telefónico -->
        <div class="col-md-4">
            <div class="p-4 border rounded shadow-sm">
                <div class="d-flex align-items-center mb-3">
                    <img src="/images/phone.svg" alt="Telefone" class="me-2">
                    <h5 class="fw-bold">Contacto Telefónico</h5>
                </div>
                <p>Estamos disponíveis 24 horas por dia, 7 dias por semana.</p>
                <p class="fw-bold">Contacto: +351 919293949</p>
            </div>

            <!-- Contacto por Email -->
            <div class="p-4 border rounded shadow-sm mt-3 mb-6">
                <div class="d-flex align-items-center mb-3">
                    <img src="/images/mail.svg" alt="Email" class="me-2">
                    <h5 class="fw-bold">Escreva-nos</h5>
                </div>
                <p>Preencha o nosso formulário e entraremos em contacto consigo em 24 horas.</p>
                <p><b>Email:</b> customer@cashme.com</p>
                <p><b>Emails:</b> support@cashme.com</p>
            </div>
        </div>

        <!-- Formulário de Contacto -->
        <div class="col-md-8 d-flex align-items-center">
            <div class="p-4 border rounded shadow-sm w-100 align-self-center"> <!-- Centraliza o formulário -->
                <form onsubmit="redirectToSuccess(event)">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label fw-bold">Nome *</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-bold">Email *</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label fw-bold">Telefone *</label>
                            <input type="text" class="form-control" name="phone" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-bold">A sua mensagem</label>
                            <textarea class="form-control" rows="5" name="message" required></textarea>
                        </div>
                        <div class="col-12 text-end">
                            <button type="submit" class="btn btn-primary">Submeter</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function redirectToSuccess(event) {
                event.preventDefault(); // Evita o envio real do formulário
                window.location.href = "/messageSubmit"; // Redireciona para a página de sucesso
            }
        </script>

    </div>
</section>


<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>
