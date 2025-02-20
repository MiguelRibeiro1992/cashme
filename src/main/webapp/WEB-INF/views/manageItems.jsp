<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Menu Produtos | CashMe</title>

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
                        <a class="nav-link active" href="/admin/dashboard">Dashboard</a>
                    </li>
                    <!--PARA UPDATE: ADICIONAR/EDITAR/EXCLUIR LOJAS -->
                    <li class="nav-item">
                        <a class="nav-link" href="manageStores">Lojas</a>
                    </li>
                    <!--PARA UPDATE: ADICIONAR/EDITAR/EXCLUIR PRODUTOS -->
                    <li class="nav-item">
                        <a class="nav-link" href="manageItems">Produtos</a>
                    </li>
                    <!-- ADICIONAR/EDITAR/EXCLUIR CATEGORIAS -->
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
            <h2 class="mt-4">Bem-vindo ao Painel de Administração</h2>
            <p>Selecione uma opção no menu à esquerda.</p>
            <!-- Exemplo de um Formulário para Adicionar Item -->
                        <div class="card mt-3">
            <div>
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
                <!--
                <div class="mb-3">
                     <label class="form-label">Imagem</label>
                     <img class="form-control" name="imageURL" required></img>
                </div>
                -->
                <!-- Seleção de categoria -->
                <div class="mb-3">
                    <label for="categoryId" class="form-label">Categoria</label>
                    <select class="form-select" id="categoryId" name="categoryId" required onchange="updateCategoryName()">
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.id}" data-name="${category.name}">${category.name}</option>
                        </c:forEach>
                    </select>
                    <input type="hidden" id="categoryName" name="categoryName">
                </div>

                <script>
                    function updateCategoryName() {
                        const select = document.getElementById("categoryId");
                        const selectedOption = select.options[select.selectedIndex];
                        document.getElementById("categoryName").value = selectedOption.getAttribute("data-name");
                    }
                </script>
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
                <input type="text" class="form-control" name="name" required>
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
                <button type="submit" class="btn btn-primary">Adicionar Produto</button>
            </form>
                            <div class="card mt-3">
                                <h3>Lista de Produtos</h3>
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th scope="col">Código de barras</th>
                                        <th scope="col">Nome do produto</th>
                                        <th scope="col">Marca</th>
                                        <th scope="col">Descrição</th>
                                        <th scope="col">Categoria</th>
                                        <th scope="col">Preço</th>
                                        <th scope="col">Loja</th>
                                        <th scope="col">Url da imagem</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${items}">
                                        <tr>
                                            <td>${item.barcode}</td>
                                            <td>${item.name}</td>
                                            <td>${item.brand}</td>
                                            <td>${item.description}</td>
                                            <td>
                                                <c:forEach var="category" items="${item.category}">
                                                    ${category.name}<br>
                                                </c:forEach>
                                            </td>
                                            <td>${item.price}</td>
                                            <td>${item.store.name}</td>
                                            <td>${item.imageUrl}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
            </div>
        </main>


<br>
<br>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>