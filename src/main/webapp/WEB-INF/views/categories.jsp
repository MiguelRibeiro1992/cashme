<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Categorias</title>

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
</head>
<body class="login-page"> <!-- Aplica fundo branco ao login -->

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<div class="container">
    <h2>Olá ${user.getName()}</h2>
    <div class="card">
        <div class="card-header">
        </div>
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
                <c:if test="${categories.size() == 0}">
                    <tr>
                        <td colspan="3">Não foram encontradas categorias.</td>
                    </tr>
                </c:if>
                <c:forEach var="category" items="${categories}">
                    <tr>
                        <td>${category.getId()}</td>
                        <td>${category.getName()}</td>
                        <td></td>
                    </tr>
                </c:forEach>
                <tr>
                    <form action="/categories/add" method="POST">
                        <td>-</td>
                        <td><input name="name" type="text"/></td>
                        <td><button>Nova Categoria</button></td>
                    </form>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>