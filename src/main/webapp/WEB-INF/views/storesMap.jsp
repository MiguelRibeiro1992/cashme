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
            <input type="text" id="searchBox" class="form-control mb-3" placeholder="Procure por Nome ou Região" onkeyup="filterStores()">
            <p class="text-muted" id="totalStores">Carregando lojas...</p>

            <!-- Lista de Lojas (Gerada Dinamicamente) -->
            <div class="list-group" id="storeList"></div>
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
        const initialLocation = { lat: 38.7169, lng: -9.1399 }; // Lisboa

        map = new google.maps.Map(document.getElementById("map"), {
            center: initialLocation,
            zoom: 12,
        });

        fetchStoresWithStatus();
    }

    function fetchStoresWithStatus() {
        fetch('/api/status')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Acesso negado à API');
                }
                return response.json();
            })
            .then(stores => {
                const storeList = document.getElementById("storeList");
                storeList.innerHTML = "";

                stores.forEach(store => {
                    addStoreMarker(store);

                    const storeItem = document.createElement("div");
                    storeItem.classList.add("list-group-item", "border-0", "store-item");
                    storeItem.setAttribute("data-name", store.name.toLowerCase());
                    storeItem.setAttribute("data-location", store.location.toLowerCase());

                    // Formata a hora antes de exibir
                    const formattedOpening = store.openingTime ? formatTime(store.openingTime) : "N/A";
                    const formattedClosing = store.closingTime ? formatTime(store.closingTime) : "N/A";

                    storeItem.innerHTML = `
                        <div class="d-flex align-items-center">
                            <img src="/images/${store.imageUrl}" alt="${store.name}" class="me-2" style="width: 50px; height: 50px; border-radius: 5px;">
                            <div>
                                <h5 class="fw-bold">${store.name}</h5>
                                <p class="mb-1">${store.location}</p>
                                <p class="${store.status == 'Aberto' ? 'text-success' : 'text-danger'} fw-bold">${store.status}</p>
                                <p class="text-muted">Horário: ${formattedOpening} - ${formattedClosing}</p>
                            </div>
                        </div>
                    `;
                    storeList.appendChild(storeItem);
                });

                document.getElementById("totalStores").innerText = `${stores.length} lojas encontradas`;
            })
            .catch(error => {
                console.error("Erro ao carregar lojas:", error);
                alert("Erro ao carregar lojas. Verifique se a API está acessível.");
            });
    }

    function addStoreMarker(store) {
        if (store.latitude !== 0.0 && store.longitude !== 0.0) {
            const marker = new google.maps.Marker({
                position: { lat: store.latitude, lng: store.longitude },
                map: map,
                title: store.name,
            });

            const formattedOpening = store.openingTime ? formatTime(store.openingTime) : "N/A";
            const formattedClosing = store.closingTime ? formatTime(store.closingTime) : "N/A";

            const infoWindow = new google.maps.InfoWindow({
                content: `
                    <div class="d-flex align-items-center">
                        <img src="/images/${store.imageUrl}" alt="${store.name}" style="width: 50px; height: 50px; margin-right: 10px;">
                        <div>
                            <h6>${store.name}</h6>
                            <p>${store.location}</p>
                            <p><strong>${store.status}</strong></p>
                            <p class="text-muted">Horário: ${formattedOpening} - ${formattedClosing}</p>
                        </div>
                    </div>
                `
            });

            marker.addListener("mouseover", () => {
                infoWindow.open(map, marker);
            });

            marker.addListener("mouseout", () => {
                infoWindow.close();
            });

            markers.push(marker);
        }
    }

    function formatTime(time) {
        return time.substring(0, 5); // Transforma "08:30:00" em "08:30"
    }
</script>

<!-- Google Maps API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiyT7HENygnLrulQYlbcQHT5lx4vj4a34&callback=initMap&libraries=places" defer></script>

</body>
</html>



