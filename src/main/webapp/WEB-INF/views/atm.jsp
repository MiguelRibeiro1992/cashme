<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <meta charset="UTF-8">
    <title>Pagamento de Serviços</title>
    <style>
        body {
            background-color: #3366cc;
            font-family: Arial, sans-serif;
            text-align: center;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 400px;
            background-color: black;
            padding: 20px;
            border-radius: 10px;
        }
        .input-box {
            background-color: white;
            color: black;
            width: 100%;
            padding: 10px;
            text-align: center;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .buttons {
            display: flex;
            justify-content: space-between;
        }
        .button {
            width: 30%;
            padding: 10px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }

        .red { background-color: red; color: white; }
        .orange { background-color: orange; color: black; }
        .green { background-color: green; color: white; }
    </style>
</head>
<body>
<div class="content">
    <!-- Nome do Banco no topo -->
    <h1 class="logo-title">BANCO BCG</h1>
    <h5 class="logo-subtitle">Banco Cheio de Guito</h5>
    <h2>PAGAMENTO DE SERVIÇOS / COMPRAS</h2>
    <div class="container">
        <form action="processarPagamento.jsp" method="post">
            <div>
                <label>ENTIDADE</label>
                <div class="input-box">96969</div>
            </div>
            <div>
                <label>REFERÊNCIA</label>
                <input type="text" name="referencia" class="input-box" required>
            </div>
            <div>
                <label>MONTANTE</label>
                <input type="text" name="montante" class="input-box" required>
            </div>
            <p>CONFIRME NA TECLA VERDE</p>
            <div class="buttons">
                <button type="reset" class="button red">ANULAR</button>
                <button type="button" class="button orange">CORRIGIR</button>
                <button type="submit" class="button green">CONFIRMAR</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
