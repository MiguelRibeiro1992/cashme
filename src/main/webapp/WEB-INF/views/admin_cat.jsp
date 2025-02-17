<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Gerir Categorias | Admin</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

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

<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<div class="container-fluid">
    <div class="row">

        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 d-md-block sidebar">
            <div class="position-sticky">
                <h4>Admin Dashboard</h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="adminDashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageStores">Lojas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageItems">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="adminDashboard/categories">Categorias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="logout">Terminar Sessão</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Área de Conteúdo -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <h2 class="mt-4">Gestão de Categorias</h2>

            <!-- Tabela de Categorias -->
            <div class="card">
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Ações</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="category" items="${categories}">
                            <tr>
                                <td>${category.id}</td>
                                <td>${category.name}</td>
                                <td>
                                    <button class="btn btn-warning" onclick="openEditModal('${category.id}', '${category.name}')">Editar</button>
                                    <a href="/adminDashboard/categories/delete/${category.id}" class="btn btn-danger">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <!-- Botão para abrir o modal de adicionar categoria -->
                    <button class="btn btn-primary" onclick="openAddModal()">Nova Categoria</button>
                </div>
            </div>

            <!-- Modal para Adicionar/Editar Categoria -->
            <div id="categoryModal" class="modal fade" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Adicionar/Editar Categoria</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <form action="/adminDashboard/categories/save" method="POST">
                                <input type="hidden" id="categoryId" name="id">
                                <label>Nome da Categoria:</label>
                                <input type="text" id="categoryName" name="name" class="form-control" required>
                                <div class="mt-3">
                                    <button type="submit" class="btn btn-success">Guardar</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

<script>
    function openAddModal() {
        document.getElementById("categoryId").value = "";
        document.getElementById("categoryName").value = "";
        new bootstrap.Modal(document.getElementById("categoryModal")).show();
    }

    function openEditModal(id, name) {
        document.getElementById("categoryId").value = id;
        document.getElementById("categoryName").value = name;
        new bootstrap.Modal(document.getElementById("categoryModal")).show();
    }
</script>

</body>
</html>