<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - A Minha Conta</title>

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
    <p><a href="/mainPage" class="text-decoration-none text-dark">Home</a> / <b>A minha conta</b></p>
</section>

<!-- Seção Principal -->
<section class="container mt-4">
    <div class="row aling-items center mb-6">
        <!-- Sidebar de navegação -->
        <div class="col-md-3">
            <div class="p-4 border rounded shadow-sm">
                <h5 class="fw-bold">Gestão de Conta</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/account" class="text-decoration-none text-orange">O meu perfil</a></li>
                    <li><a href="/paymentMethods" class="text-decoration-none text-muted">Opções de Pagamento</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Encomendas</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="/history" class="text-decoration-none text-muted">Histórico</a></li>
                    <li><a href="/stats" class="text-decoration-none text-muted">Estatísticas de Gastos</a></li>
                    <li><a href="/tracking" class="text-decoration-none text-muted">Tracking de Preços</a></li>
                </ul>
                <h5 class="fw-bold mt-4">Outros</h5>
                <ul class="list-unstyled mt-3">
                    <li><a href="wishlist.jsp" class="text-decoration-none text-muted">Wishlist</a></li>
                    <li><a href="/notifications" class="text-decoration-none text-muted">Notificações</a></li>
                    <li><a href="/points" class="text-decoration-none text-muted">Pontos</a></li>
                    <li><a href="/settings" class="text-decoration-none text-muted">Definições</a></li>
                </ul>
            </div>
        </div>

        <!-- Formulário de edição de perfil -->
        <div class="col-md-9 d-flex align-items-center">
            <div class="p-4 border rounded shadow-sm w-100 align-self-center">
                <h4 class="fw-bold text-orange">Edita o teu perfil</h4>
                <form>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Primeiro Nome</label>
                            <input type="text" class="form-control" name="firstName" placeholder="José">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Último Nome</label>
                            <input type="text" class="form-control" name="lastName" placeholder="Paloco">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="josepaloco@gmail.com">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Morada</label>
                            <input type="text" class="form-control" name="address" placeholder="15 Yemen Road, Yemen">
                        </div>
                        <h5 class="fw-bold mt-4">Alterar Password</h5>
                        <div class="col-md-12">
                            <label class="form-label fw-bold">Password Atual</label>
                            <input type="password" class="form-control" name="currentPassword" placeholder="********">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Nova Password</label>
                            <input type="password" class="form-control" name="newPassword" placeholder="Nova Password">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Confirmar Nova Password</label>
                            <input type="password" class="form-control" name="confirmPassword" placeholder="Confirmar Nova Password">
                        </div>
                        <div class="col-12 d-flex justify-content-between mt-3">
                            <button type="reset" class="btn btn-outline-secondary">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Guardar Alterações</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</section>

<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>





