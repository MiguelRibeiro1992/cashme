
//Certifica que o script é executado após o HTML

document.addEventListener("DOMContentLoaded", function () {

// Volta ao topo da página (Seta cima)

    document.getElementById("scrollTopBtn").addEventListener("click", function () {
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    });

// Carrossel para as setas direita e esquerda

    const carousel = document.getElementById("partnerCarousel");
    const partners = document.querySelectorAll(".partner-carousel .partner-carousel-item");
    const partnerWidth = 320; // Largura + margem
    let currentIndex = 0;

    function updateCarousel() {
        carousel.style.transform = `translateX(${-currentIndex * partnerWidth}px)`;
    }

    document.getElementById("prevBtn").addEventListener("click", function () {
        if (currentIndex > 0) {
            currentIndex--;
        } else {
            currentIndex = partners.length - 4;
        }
        updateCarousel();
    });

    document.getElementById("nextBtn").addEventListener("click", function () {
        if (currentIndex < partners.length - 4) {
            currentIndex++;
        } else {
            currentIndex = 0;
        }
        updateCarousel();
    });

    // Carrossel para categorias
    const categoryCarousel = document.getElementById("categoryCarousel");
    const categoryContainer = document.querySelector(".category-container");
    const categories = document.querySelectorAll(".category-container .col-md-3");
    const categoryWidth = categories[0].offsetWidth + 20;
    let categoryIndex = 0;
    const visibleItems = 4;

    function updateCategoryCarousel() {
        categoryContainer.style.transition = 'transform 0.5s ease-in-out';
        categoryContainer.style.transform = `translateX(${-categoryIndex * categoryWidth}px)`;
    }

    document.getElementById("prevCategoryBtn").addEventListener("click", function () {
        if (categoryIndex > 0) {
            categoryIndex--;
        } else {
            categoryIndex = categories.length - visibleItems;
        }
        updateCategoryCarousel();
    });

    document.getElementById("nextCategoryBtn").addEventListener("click", function () {
        if (categoryIndex < categories.length - visibleItems) {
            categoryIndex++;
        } else {
            categoryIndex = 0;
        }
        updateCategoryCarousel();
    });

    // Carrossel para produtos mais vendidos
    const productCarousel = document.getElementById("productCarousel");
    const productContainer = document.querySelector(".product-container");
    const products = document.querySelectorAll(".product-container .col-md-3");
    const productWidth = products[0].offsetWidth + 20;
    let productIndex = 0;
    const visibleProducts = 4;

    function updateProductCarousel() {
        productContainer.style.transition = 'transform 0.5s ease-in-out';
        productContainer.style.transform = `translateX(${-productIndex * productWidth}px)`;
    }

    document.getElementById("prevProductBtn").addEventListener("click", function () {
        if (productIndex > 0) {
            productIndex--;
        } else {
            productIndex = products.length - visibleProducts;
        }
        updateProductCarousel();
    });

    document.getElementById("nextProductBtn").addEventListener("click", function () {
        if (productIndex < products.length - visibleProducts) {
            productIndex++;
        } else {
            productIndex = 0;
        }
        updateProductCarousel();
    });

    // Adiciona eventos de clique para Google Play e App Store
    document.querySelectorAll(".app-link").forEach(button => {
        button.addEventListener("click", function () {
            window.open(this.getAttribute("data-url"), "_blank");
        });
    });

    //Adiciona eventos de classificação
    document.querySelectorAll(".rating").forEach(rating => {
        const stars = Array.from(rating.querySelectorAll(".star")).reverse(); // Inverte a ordem das estrelas
        const ratingValue = rating.querySelector(".rating-value");

        stars.forEach(star => {
            star.addEventListener("mouseover", function() {
                highlightStars(this);
            });

            star.addEventListener("click", function() {
                toggleRating(this, ratingValue);
            });

            rating.addEventListener("mouseleave", function() {
                resetStars(rating);
            });
        });

        function highlightStars(star) {
            const value = parseInt(star.getAttribute("data-value"));
            resetStars(star.parentNode);
            star.parentNode.querySelectorAll(".star").forEach(s => {
                if (parseInt(s.getAttribute("data-value")) >= value) { // Da direita para a esquerda
                    s.classList.add("active");
                }
            });
        }

        function toggleRating(star, ratingValue) {
            const value = parseInt(star.getAttribute("data-value"));
            const ratingContainer = star.parentNode;
            const selectedValue = ratingContainer.getAttribute("data-selected");

            if (selectedValue === value.toString()) {
                // Se a mesma estrela for clicada novamente, desselecionar e decrementar votos
                ratingContainer.removeAttribute("data-selected");
                resetStars(ratingContainer);
                decrementVotes(ratingValue);
            } else {
                // Senão, atribuir a classificação e incrementar votos
                ratingContainer.setAttribute("data-selected", value);
                highlightStars(star);
                incrementVotes(ratingValue);
            }
        }

        function resetStars(rating) {
            const selectedValue = rating.getAttribute("data-selected");
            rating.querySelectorAll(".star").forEach(s => {
                s.classList.remove("active");
            });
            if (selectedValue) {
                rating.querySelectorAll(".star").forEach(s => {
                    if (parseInt(s.getAttribute("data-value")) >= selectedValue) { // Mantém lógica invertida
                        s.classList.add("active");
                    }
                });
            }
        }

        function incrementVotes(ratingValue) {
            let currentVotes = parseInt(ratingValue.textContent.replace(/\D/g, ""), 10);
            ratingValue.textContent = `(${currentVotes + 1})`;
        }

        function decrementVotes(ratingValue) {
            let currentVotes = parseInt(ratingValue.textContent.replace(/\D/g, ""), 10);
            ratingValue.textContent = `(${Math.max(currentVotes - 1, 0)})`; // Garante que não fica negativo
        }
    });


});







