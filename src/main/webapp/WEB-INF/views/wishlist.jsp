<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Wishlist</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">
</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<!-- Seção Wishlist -->
<section class="container mt-5">
    <div class="d-flex align-items-center">
        <img src="/images/heart.svg" alt="Wishlist" class="img-fluid me-3" style="height: 50px;">
        <h2 class="fw-bold">Os teus Favoritos</h2>
    </div>
</section>

<!-- Lista de Favoritos -->
<section class="container mt-4">
    <div class="row">
        <c:choose>
            <c:when test="${not empty wishlist and not empty wishlist.items}">
                <c:forEach var="item" items="${wishlist.items}">
                    <div class="col-md-4 text-center">
                        <div class="product-card p-3 border rounded">
                            <a href="/item/${item.id}">
                                <img src="/images/${item.imageUrl}" alt="${item.name}" class="img-fluid">
                            </a>
                            <p class="mt-2"><b>${item.name}</b></p>
                            <h5 class="text-primary fw-bold">${item.price}€</h5>

                            <!-- Botão para remover dos favoritos -->
                            <form action="/wishlist/toggle/${item.id}" method="post">
                                <button class="btn btn-danger mt-2 w-100">Remover da Wishlist</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="col-12 text-center">
                    <p class="text-muted">Ainda não tens produtos favoritos.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</section>

<!-- Script para alternar favoritos sem recarregar a página -->
<script>
    function toggleWishlist(itemId, buttonElement) {
        console.log("A tentar remover/adicionar item:", itemId);

        fetch(`/wishlist/toggle/${itemId}`, { method: "POST" })
            .then(response => {
                if (!response.ok) throw new Error("Erro ao atualizar wishlist");
                console.log("Wishlist atualizada!");

                // Remover o item visualmente sem recarregar a página
                const card = buttonElement.closest(".product-card");
                if (card) {
                    card.remove();
                }

                // Se não houver mais produtos favoritos, mostrar a mensagem de vazio
                if (document.querySelectorAll(".product-card").length === 0) {
                    document.querySelector(".row").innerHTML = `
                        <div class="col-12 text-center">
                            <p class="text-muted">Ainda não tens produtos favoritos.</p>
                        </div>`;
                }
            })
            .catch(error => console.error("Erro ao atualizar wishlist:", error));
    }
</script>

<%@ include file="includes/footer.jsp" %> <!-- Footer -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/scripts/scripts.js" defer></script>

</body>
</html>