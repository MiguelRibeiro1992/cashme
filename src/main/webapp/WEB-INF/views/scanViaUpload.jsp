<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Scan Código de Barras | CashMe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container">
    <a class="navbar-brand" href="#">
      <img src="/images/logo.png" alt="CashMe" height="40">
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Contacto</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Sobre nós</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Lojas</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Login Container -->
<div class="container">
  <div class="barcode-scanner">
    <h3>Leitor de Código de Barras</h3>
    <img src="/static/images/scanSymbol.svg" alt="Código de Barras" class="img-fluid">
    <div class="mt-4">
      <h5>Leitura de código de barras através de imagem</h5>
      <input type="file" class="form-control">
      <button class="btn btn-orange mt-2">Escolher ficheiro</button>
    </div>

    <div class="mt-4">
      <h5>Leitura de código de barras através da câmara</h5>
      <button class="btn btn-orange">Ligar a câmara</button>
      <p>Nenhum produto detectado</p>
    </div>

    <button class="btn btn-secondary mt-3">Mudar para Scan Via NFC</button>
    <button class="btn btn-orange mt-3">Adicionar ao carrinho</button>
  </div>
</div>

<!-- Footer -->
<footer class="footer text-center">
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <h5>CashMe</h5>
        <p>Compre com a nossa app!</p>
      </div>
      <div class="col-md-3">
        <h5>Suporte</h5>
        <p>Av. do Brasil, 53, 1700-083 Lisboa</p>
        <p>cashme@gmail.com</p>
        <p>+351-555-999999</p>
      </div>
      <div class="col-md-3">
        <h5>Conta</h5>
        <a href="#">A minha conta</a><br>
        <a href="#">Login / Registar</a><br>
        <a href="#">Histórico</a><br>
        <a href="#">Wishlist</a><br>
        <a href="#">Definições</a>
      </div>
      <div class="col-md-3">
        <h5>Links Úteis</h5>
        <a href="#">Política de Privacidade</a><br>
        <a href="#">Termos de Utilização</a><br>
        <a href="#">FAQ</a><br>
        <a href="#">Contacto</a>
      </div>
    </div>
    <hr class="my-3">
    <p>&copy; 2025 CashMe. Todos os direitos reservados.</p>
  </div>
</footer>

</body>
</html>