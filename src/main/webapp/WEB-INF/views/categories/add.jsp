<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Adicionar Categoria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="../includes/header.jsp" %> <!-- Navbar (se tiveres um header) -->

<div class="container">
    <h2>Adicionar Nova Categoria</h2>

    <form action="/categories/add" method="POST">
        <div class="mb-3">
            <label for="name" class="form-label">Nome da Categoria</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Ativar na Página Principal?</label>
            <select class="form-select" name="isActive">
                <option value="true">Sim</option>
                <option value="false">Não</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Adicionar</button>
        <a href="/categories" class="btn btn-secondary">Voltar</a>
    </form>
</div>

</body>
</html>