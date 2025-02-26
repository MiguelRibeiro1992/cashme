<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Menu Produtos | CashMe</title>

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

<!-- AddItem Container -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 d-md-block sidebar">
            <div class="position-sticky">
                <h4>Admin Dashboard</h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="/admin/dashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageStores">Lojas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="manageItems">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/dashboard/categories">Categorias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="logout">Terminar Sessão</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Área de Conteúdo -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <h2 class="mt-4">Gestão de Produtos</h2>
            <p>Gerencie os produtos disponíveis no site.</p>

            <!-- Botão para abrir o formulário -->
            <div class="mt-3">
                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#addItemForm" aria-expanded="false" aria-controls="addItemForm">
                    + Adicionar Novo Produto
                </button>
            </div>

            <!-- Formulário colapsável -->
            <div class="collapse mt-3" id="addItemForm">
                <div class="card card-body">
                    <h3>Adicionar Novo Produto</h3>
                    <form action="manageItems" method="post">
                        <div class="mb-3">
                            <label class="form-label">Código de Barras</label>
                            <input type="text" class="form-control" name="barcode" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Nome do Produto</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Marca</label>
                            <input type="text" class="form-control" name="brand" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Descrição</label>
                            <textarea class="form-control" name="description" required></textarea>
                        </div>

                        <!-- Seleção de categoria -->
                        <div class="mb-3">
                            <label for="categoryId" class="form-label">Categoria</label>
                            <select class="form-select" id="categoryId" name="categoryId" required>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Preço (€)</label>
                            <input type="number" class="form-control" name="price" step="0.01" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Quantidade</label>
                            <input type="number" class="form-control" name="quantity" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Url da imagem</label>
                            <input type="text" class="form-control" name="imageUrl" required>
                        </div>

                        <!-- Seleção de loja -->
                        <div class="mb-3">
                            <label for="storeId" class="form-label">Loja</label>
                            <select class="form-select" id="storeId" name="storeId" required>
                                <c:forEach var="store" items="${stores}">
                                    <option value="${store.id}">${store.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-success">Adicionar Produto</button>
                    </form>
                </div>
            </div>

            <!-- Lista de Produtos -->
            <div class="card mt-3">
                <h3>Lista de Produtos</h3>
                <table class="table">
                    <thead>
                    <tr>
                        <th>Código de barras</th>
                        <th>Nome</th>
                        <th>Marca</th>
                        <th>Descrição</th>
                        <th>Categoria</th>
                        <th>Preço</th>
                        <th>Loja</th>
                        <th>Imagem</th>
                        <th>Ações</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td>${item.barcode}</td>
                            <td>${item.name}</td>
                            <td>${item.brand}</td>
                            <td>${item.description}</td>
                            <td>${item.category.name}</td>
                            <td>${item.formattedPrice}</td>
                            <td>${item.store.name}</td>
                            <td><img src="/images/${item.imageUrl}" alt="Imagem do Produto" class="img-thumbnail" style="max-width: 80px;"></td>
                            <td>
                                <button class="btn btn-warning btn-sm">Editar</button>
                                <button class="btn btn-danger btn-sm">Eliminar</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </main>
    </div>
</div>

<br><br>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>