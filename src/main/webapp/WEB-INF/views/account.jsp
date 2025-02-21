<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Minha Conta</title>

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

<section class="container mt-4">
    <div class="row">
        <!-- Menu Lateral -->
        <div class="col-md-3">
            <h5 class="fw-bold">Gestão de Conta</h5>
            <ul class="list-unstyled">
                <li><a href="#" class="fw-bold text-primary">O meu perfil</a></li>
                <li><a href="#">Opções de Pagamento</a></li>
            </ul>

            <h5 class="fw-bold mt-3">Encomendas</h5>
            <ul class="list-unstyled">
                <li><a href="#">Histórico</a></li>
                <li><a href="#">Estatísticas de Gastos</a></li>
                <li><a href="#">Tracking de Preços</a></li>
            </ul>

            <h5 class="fw-bold mt-3">Wishlist</h5>
            <h5 class="fw-bold mt-3">Notificações</h5>
            <h5 class="fw-bold mt-3">Pontos</h5>

            <h5 class="fw-bold mt-3">Definições</h5>
            <ul class="list-unstyled">
                <li><a href="#">Segurança</a></li>
            </ul>
        </div>

        <!-- Área de Edição de Perfil -->
        <div class="col-md-9">
            <h5 class="text-end">Bem-vindo! <span class="text-primary">José Paloco</span></h5>

            <div class="p-4 border rounded shadow-sm mt-3">
                <h4 class="fw-bold">Edita o teu perfil</h4>
                <form action="#" method="POST">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Primeiro Nome</label>
                            <input type="text" class="form-control" value="José">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Último Nome</label>
                            <input type="text" class="form-control" value="Paloco">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Email</label>
                            <input type="email" class="form-control" value="josepaloco@gmail.com" disabled>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Morada</label>
                            <input type="text" class="form-control" value="15 Yemen Road, Yemen">
                        </div>

                        <!-- Alteração de Password -->
                        <h5 class="fw-bold mt-3">Alterar Password</h5>
                        <div class="col-md-12">
                            <input type="password" class="form-control" placeholder="Password Atual">
                        </div>
                        <div class="col-md-6">
                            <input type="password" class="form-control" placeholder="Nova Password">
                        </div>
                        <div class="col-md-6">
                            <input type="password" class="form-control" placeholder="Confirmar Nova Password">
                        </div>

                        <!-- Botões -->
                        <div class="col-md-12 d-flex justify-content-between mt-4">
                            <button type="button" class="btn btn-outline-secondary">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Guardar Alterações</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
