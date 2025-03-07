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
    <h1>BANCO BCG</h1>
    <h2>PAGAMENTO DE SERVIÇOS / COMPRAS</h2>
    <div class="container">
        <form id="paymentForm">
            <div>
                <label>ENTIDADE</label>
                <input type="text" id="entity" class="input-box" required>
            </div>
            <div>
                <label>REFERÊNCIA</label>
                <input type="text" id="reference" class="input-box" required>
            </div>
            <div>
                <label>MONTANTE</label>
                <input type="text" id="amount" class="input-box" required>
            </div>
            <p id="message">CONFIRME NA TECLA VERDE</p>
            <div class="buttons">
                <button type="reset" class="button red">ANULAR</button>
                <button type="button" class="button orange">CORRIGIR</button>
                <button type="button" class="button green" id="confirmPayment">CONFIRMAR</button>
            </div>
        </form>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", (e) => {
        document.getElementById("confirmPayment").addEventListener("click", function (e) {
            e.preventDefault();
            let entity_input = document.getElementById("entity");
            let reference_input = document.getElementById("reference");
            let amount_input = document.getElementById("amount");
            let message_el = document.getElementById("message");

            let entity = entity_input.value;
            let reference = reference_input.value;
            let amount = amount_input.value;

            if(amount.includes(",")) {
                amount = amount.split(",").join(".");
            }

            let form_data = new FormData();
            form_data.append("entity", entity);
            form_data.append("reference", reference);
            form_data.append("amount", amount);

            fetch("/atm/pay", {
                method: "POST",
                body: form_data
            }).then(e => {
                console.log(e);
                if(e.status === 200) {
                    e.json().then(cart => {
                        if (window.opener) {
                            window.opener.paymentSuccessful(cart.id);
                        }
                        window.close();
                    })
                } else {
                    message_el.textContent = "Dados incorretos";
                    message_el.style.color = "red";
                }
            }).catch(e => {
                //
                console.error(e);
            });
            return false;
        });
    });
</script>

</body>
</html>
