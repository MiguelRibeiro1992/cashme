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
                                            <td>${item.formattedPrice}</td>
                                            <td>${item.store.name}</td>
                                            <td>${item.imageUrl}</td>
                                            <td>
                                                <!-- Botão de Editar -->
                                                <button class="btn btn-warning btn-sm" onclick="openEditModal('${item.id}', '${item.barcode}', '${item.name}', '${item.price}', '${item.brand}', '${item.description}', '${item.imageUrl}', '${item.store.id}', '${item.category[0].id}', '${item.category[0].name}')">
                                                    Editar
                                                </button>

                                                <!-- Botão de Eliminar -->
                                                <!-- Formulário para eliminar -->
                                                <form action="/admin/dashboard/items/${item.id}" method="POST" style="display:inline;">
                                                    <input type="hidden" name="_method" value="DELETE"> <!-- Simula um DELETE no Spring -->
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- Token CSRF -->
                                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza que deseja eliminar este item?');">
                                                        Eliminar
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
            </div>
        </main>

        <!-- Modal de Edição -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Editar Produto</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <!-- Formulário de edição -->
                    <form action="" method="post">
                        <div class="modal-body">
                            <input type="hidden" id="editItemId" name="id">
                            <input type="hidden" id="editStoreId" name="storeId">

                            <div class="mb-3">
                                <label class="form-label">Código de barras</label>
                                <input type="text" class="form-control" id="editBarcode" name="barcode" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Nome do Produto</label>
                                <input type="text" class="form-control" id="editName" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Preço (€)</label>
                                <input type="number" class="form-control" id="editPrice" name="price" step="0.01" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Marca</label>
                                <input type="text" class="form-control" id="editBrand" name="brand">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Descrição</label>
                                <textarea class="form-control" id="editDescription" name="description"></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Imagem URL</label>
                                <input type="text" class="form-control" id="editImageUrl" name="imageUrl">
                            </div>

                            <!-- Seleção de categoria -->
                            <div class="mb-3">
                                <label for="editCategoryId" class="form-label">Categoria</label>
                                <select class="form-select" id="editCategoryId" name="categoryId" required onchange="updateEditCategoryName()">
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                                <input type="hidden" id="editCategoryName" name="categoryName">
                            </div>

                            <script>
                                function updateEditCategoryName() {
                                    const select = document.getElementById("editCategoryId");
                                    const selectedOption = select.options[select.selectedIndex];
                                    document.getElementById("editCategoryName").value = selectedOption.getAttribute("data-name");
                                }
                            </script>
                        </div>

                        <div class="modal-footer">

                            <!-- O botão submete o formulário e faz refresh automático -->
                            <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function openEditModal(id, barcode, name, price, brand, description, imageUrl, storeId, categoryId, categoryName) {
                document.getElementById('editItemId').value = id;
                document.getElementById('editBarcode').value = barcode;
                document.getElementById('editName').value = name;
                document.getElementById('editPrice').value = price;
                document.getElementById('editBrand').value = brand;
                document.getElementById('editDescription').value = description;
                document.getElementById('editImageUrl').value = imageUrl;
                if (storeId && storeId !== "undefined") {
                    document.getElementById('editStoreId').value = storeId;
                } else {
                    console.warn("storeId está indefinido!");
                }
                let categorySelect = document.getElementById('editCategoryId');
                for (let option of categorySelect.options) {
                    if (option.value == categoryId) {
                        option.selected = true;
                        break;
                    }
                }

                // Definir o nome da categoria no input hidden
                document.getElementById('editCategoryName').value = categoryName;
                new bootstrap.Modal(document.getElementById('editModal')).show();
            }
        </script>

<br>
<br>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

</body>
</html>