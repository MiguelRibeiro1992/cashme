<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Scan NFC | CashMe</title>

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

 <style>
                    body {
                        background-color: #f8f9fa;
                    }

                    .sidebar {
                        height: 100vh;
                        background-color: #fff;
                        border-right: 2px solid #ddd;
                    }

                    .sidebar h4 {
                        color: #ff6600;
                        padding: 20px;
                        font-weight: bold;
                    }

                    .sidebar .nav-link {
                        color: #333;
                        font-weight: 500;
                        padding: 10px 20px;
                        border-radius: 5px;
                        display: block;
                    }

                    .sidebar .nav-link:hover,
                    .sidebar .nav-link.active {
                        background-color: #ff6600;
                        color: white;
                    }

                    .card {
                        border-radius: 10px;
                        padding: 20px;
                        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                    }
                </style>


</head>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- AddItem Container -->
<div class="container-fluid">
    <div class="row">

        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 d-md-block sidebar">
            <div class="position-sticky">
                <h4>Admin Dashboard</h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="adminDashboard">Dashboard</a>
                    </li>
                    <!--PARA UPDATE: ADICIONAR/EDITAR/EXCLUIR LOJAS -->
                    <li class="nav-item">
                        <a class="nav-link" href="manageStores">Lojas</a>
                    </li>
                    <!--PARA UPDATE: ADICIONAR/EDITAR/EXCLUIR PRODUTOS -->
                    <li class="nav-item">
                        <a class="nav-link" href="manageItems">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="logout">Terminar Sessão</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Área de Conteúdo -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <h2 class="mt-4">Bem-vindo ao Painel de Administração</h2>
            <p>Selecione uma opção no menu à esquerda.</p>
            <!-- Exemplo de um Formulário para Adicionar Loja -->
                        <div class="card mt-3">

                        <div>
                            <h3>Adicionar Nova Loja</h3>
                            <form action="manageStores" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Nome da Loja</label>
                                    <input type="text" class="form-control" name="name" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Localização</label>
                                    <input type="text" class="form-control" name="location" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Adicionar Loja</button>
                            </form>
                            </div>
                        </div>

            </div>
        </main>


<br>
<br>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>