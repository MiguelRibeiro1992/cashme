<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Gerir Categorias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<div class="container">
    <h2>Gestão de Categorias</h2>

    <!-- Tabela com Categorias -->
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
                    <!-- Botão Editar -->
                    <button class="btn btn-warning" onclick="openEditModal('${category.id}', '${category.name}')">Editar</button>

                    <!-- Botão Eliminar -->
                    <a href="/categories/delete/${category.id}" class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Botão para abrir modal de Adicionar Categoria -->
    <button class="btn btn-primary" onclick="openAddModal()">Nova Categoria</button>

    <!-- Modal para Adicionar/Editar Categoria -->
    <div id="categoryModal" style="display:none;">
        <form action="/categories/save" method="POST">
            <input type="hidden" id="categoryId" name="id">
            <label>Nome da Categoria:</label>
            <input type="text" id="categoryName" name="name" required>
            <button type="submit" class="btn btn-success">Guardar</button>
        </form>
    </div>
</div>

<script>
    function openAddModal() {
        document.getElementById("categoryId").value = "";
        document.getElementById("categoryName").value = "";
        document.getElementById("categoryModal").style.display = "block";
    }

    function openEditModal(id, name) {
        document.getElementById("categoryId").value = id;
        document.getElementById("categoryName").value = name;
        document.getElementById("categoryModal").style.display = "block";
    }
</script>

</body>
</html>