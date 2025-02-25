<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CashMe - Lojas</title>

    <!-- Importação do Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Importação dos estilos personalizados -->
    <link rel="stylesheet" href="/styles/fonts.css">
    <link rel="stylesheet" href="/styles/buttons.css">
    <link rel="stylesheet" href="/styles/forms.css">
    <link rel="stylesheet" href="/styles/custom.css">
    <link rel="stylesheet" href="/styles/footer.css">
    <link rel="stylesheet" href="/styles/header.css">
</head>
<body>

<%@ include file="includes/header.jsp" %> <!-- Navbar -->

<section class="container mt-4">
    <h2 class="fw-bold">Encontre uma loja</h2>
    <div class="row mt-3">
        <!-- Barra de pesquisa e lista de lojas -->
        <div class="col-md-4">
            <input type="text" id="searchBox" class="form-control mb-3" placeholder="Procure por Região">
            <p class="text-muted" id="totalStores">15 lojas perto de si</p>
            <button class="btn btn-outline-secondary mb-3" onclick="filterStores()">Filtro</button>

            <!-- Lista de Lojas (Gerada Dinamicamente) -->
            <div class="list-group" id="storeList">
                <!-- Lojas serão carregadas aqui via JS -->
            </div>
        </div>

        <!-- Mapa do Google Maps -->
        <div class="col-md-8 mb-6">
            <div id="map" class="rounded shadow-sm w-100" style="height: 500px;"></div>
        </div>
    </div>
</section>

<!-- Footer -->
<%@ include file="includes/footer.jsp"%>

<script>
    let map;
    let markers = [];

    function initMap() {
        // Define a posição inicial (Lisboa)
        const initialLocation = { lat: 38.7169, lng: -9.1399 };

        // Cria o mapa
        map = new google.maps.Map(document.getElementById("map"), {
            center: initialLocation,
            zoom: 12,
        });

        // Chama a API para buscar as lojas
        fetchStores();
    }

    function fetchStores() {
        fetch('/api/stores')
            .then(response => response.json())
            .then(stores => {
                const storeList = document.getElementById("storeList");
                storeList.innerHTML = ""; // Limpa lista anterior

                stores.forEach(store => {
                    addStoreMarker(store);

                    const storeItem = document.createElement("div");
                    storeItem.classList.add("list-group-item", "border-0");
                    storeItem.innerHTML = `
                        <h5 class="fw-bold">${store.name}</h5>
                        <p class="mb-1">${store.address}</p>
                        <p class="${store.status.includes('Aberto') ? 'text-success' : 'text-danger'} fw-bold">${store.status}</p>
                    `;
                    storeList.appendChild(storeItem);
                });

                document.getElementById("totalStores").innerText = `${stores.length} lojas perto de si`;
            })
            .catch(error => console.error("Erro ao carregar lojas:", error));
    }

    function addStoreMarker(store) {
        const marker = new google.maps.Marker({
            position: { lat: store.latitude, lng: store.longitude },
            map: map,
            title: store.name,
        });

        // Adiciona InfoWindow
        const infoWindow = new google.maps.InfoWindow({
            content: `<h6>${store.name}</h6><p>${store.address}</p><p><strong>${store.status}</strong></p>`,
        });

        marker.addListener("click", () => {
            infoWindow.open(map, marker);
        });

        markers.push(marker);
    }
</script>

<!-- Google Maps API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiyT7HENygnLrulQYlbcQHT5lx4vj4a34&callback=initMap" async defer></script>

</body>
</html>


