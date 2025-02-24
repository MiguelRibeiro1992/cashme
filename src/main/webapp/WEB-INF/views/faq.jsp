<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ - CashMe</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">
</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Seção FAQ -->
<!-- Caminho de navegação -->
<section class="container mt-4">
    <p><a href="/redirectToMainPage" class="text-decoration-none text-dark">Home</a> / <b>FAQ</b></p>
</section>

<!-- Seção FAQ -->
<section class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10"> <!-- Ajusta largura para evitar que fique colado à esquerda -->
            <h2 class="fw-bold text-orange">FAQ</h2>

            <div class="accordion mt-4" id="faqAccordion">
                <!-- Conta e Registo -->
                <h4 class="fw-bold mt-3">Conta e Registo</h4>

                <div class="faq-item">
                    <h5 class="faq-question d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#faq1">
                        1. Preciso de criar uma conta para usar a aplicação?
                        <i class="fa-solid fa-chevron-down ms-auto faq-icon"></i>
                    </h5>
                    <div id="faq1" class="collapse">
                        <p>Depende da funcionalidade que deseja utilizar. Algumas funções exigem registo para personalizar a sua experiência e garantir segurança nos pagamentos.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <h5 class="faq-question d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#faq2">
                        2. Como posso recuperar a minha senha?
                        <i class="fa-solid fa-chevron-down ms-auto faq-icon"></i>
                    </h5>
                    <div id="faq2" class="collapse">
                        <p>Pode redefinir a sua senha através da opção "Esqueci-me da password" na página de login. Um email será enviado com as instruções.</p>
                    </div>
                </div>

                <!-- Compras e Produtos -->
                <h4 class="fw-bold mt-4">Compras e Produtos</h4>

                <div class="faq-item">
                    <h5 class="faq-question d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#faq3">
                        3. Como posso pesquisar um produto?
                        <i class="fa-solid fa-chevron-down ms-auto faq-icon"></i>
                    </h5>
                    <div id="faq3" class="collapse">
                        <p>Pode utilizar a pesquisa textual, navegar por categorias ou usar filtros avançados para encontrar o que procura.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <h5 class="faq-question d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#faq4">
                        4. Posso ler produtos na loja?
                        <i class="fa-solid fa-chevron-down ms-auto faq-icon"></i>
                    </h5>
                    <div id="faq4" class="collapse">
                        <p>Sim! Utilize a funcionalidade de leitura de código de barras ou RFID/NFC para adicionar os produtos ao seu carrinho.</p>
                    </div>
                </div>

                <!-- Pagamentos e Métodos de Compra -->
                <h4 class="fw-bold mt-4">Pagamentos e Métodos de Compra</h4>
                <div class="faq-item">
                    <h5 class="faq-question d-flex align-items-center" data-bs-toggle="collapse" data-bs-target="#faq5">
                        5. Quais são os métodos de pagamento aceites?
                        <i class="fa-solid fa-chevron-down ms-auto faq-icon"></i>
                    </h5>
                    <div id="faq5" class="collapse">
                        <p>Os pagamentos podem ser feitos via MB Way, cartões de crédito/débito, PayPal e Apple Pay.</p>
                    </div>
                </div>
            </div>

            <!-- Botão -->
            <div class="d-flex mt-5 mb-5">
                <a href="/redirectToMainPage" class="btn btn-primary px-4 py-2 fw-bold">Voltar à página inicial</a>
            </div>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var faqQuestions = document.querySelectorAll(".faq-question");

        faqQuestions.forEach(function(question) {
            question.addEventListener("click", function() {
                var icon = this.querySelector(".faq-icon");

                if (icon.classList.contains("fa-chevron-down")) {
                    icon.classList.remove("fa-chevron-down");
                    icon.classList.add("fa-chevron-up");
                } else {
                    icon.classList.remove("fa-chevron-up");
                    icon.classList.add("fa-chevron-down");
                }
            });
        });
    });
</script>

</body>
</html>