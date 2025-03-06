
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
    // Carrossel para as setas direita e esquerda - Produtos
    const productCarousel = document.getElementById("productCarousel");
    const products = document.querySelectorAll(".product-carousel .product-carousel-item");
    const productWidth = products[0].offsetWidth + 20; // Largura + margem
    let productIndex = 0;

    function updateProductCarousel() {
        productCarousel.style.transform = `translateX(${-productIndex * productWidth}px)`;
    }

    document.getElementById("prevProductBtn").addEventListener("click", function () {
        if (productIndex > 0) {
            productIndex--;
        } else {
            productIndex = products.length - 4;
        }
        updateProductCarousel();
    });

    document.getElementById("nextProductBtn").addEventListener("click", function () {
        if (productIndex < products.length - 4) {
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
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".rating").forEach(rating => {
            const itemId = rating.id.replace("rating-", ""); // Pega o ID do item
            const storedRating = localStorage.getItem(`rating-${itemId}`);
            const ratingValue = rating.querySelector(".rating-value");

            // Se houver uma avaliação armazenada, aplica na interface
            if (storedRating) {
                rating.setAttribute("data-selected", storedRating);
                highlightStars(rating, parseInt(storedRating));
                updateVotes(ratingValue, true); // Incrementa visualmente os votos
            }

            // Adiciona os eventos aos botões de estrela
            rating.querySelectorAll(".star").forEach(star => {
                star.addEventListener("click", function (event) {
                    event.stopPropagation(); // Impede que clique acione outros elementos
                    const value = parseInt(this.getAttribute("data-value"));
                    rateItem(itemId, value, rating, ratingValue);
                });

                star.addEventListener("mouseover", function () {
                    highlightStars(rating, parseInt(this.getAttribute("data-value")));
                });

                rating.addEventListener("mouseleave", function () {
                    resetStars(rating);
                });
            });
        });
    });


});

function highlightStars(rating, value) {
    //update rating to use black stars for the values (&#9733;) and white stars for the rest (&#9734;)
    rating.querySelectorAll(".star").forEach(star => {
        const starValue = parseInt(star.getAttribute("data-value"));
        star.innerHTML = starValue <= value ? "&#9733;" : "&#9734;";
        star.style.color = "#FFD700";
    });
}

function updateVotes(ratingValue, isAdding) {
    let currentVotes = parseInt(ratingValue.textContent.replace(/\D/g, ""), 10) || 0;
    ratingValue.textContent = `(${isAdding ? currentVotes + 1 : Math.max(currentVotes - 1, 0)})`;
}

function rateItem(itemId, value) {
    //if it already exists on localStorage, ignore
    if (localStorage.getItem(`rating-${itemId}`) !== null) {
        return;
    }

    let rating = document.getElementById(`rating-${itemId}`);
    let ratingValue = rating.querySelector(".rating-value");

    rating.setAttribute("data-selected", value);
    highlightStars(rating, value);
    localStorage.setItem(`rating-${itemId}`, value);
    updateVotes(ratingValue, true);

    //send the rating to the server
    fetch(`/item/${itemId}/rate/${value}`, {
        method: "POST"
    });
}

//update stars from localStorage when the page is loaded
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".rating").forEach(rating => {
        const itemId = rating.id.replace("rating-", ""); // Pega o ID do item
        const storedRating = localStorage.getItem(`rating-${itemId}`);

        // Se houver uma avaliação armazenada, aplica na interface
        if (storedRating) {
            rating.setAttribute("data-selected", storedRating);
            highlightStars(rating, parseInt(storedRating));
        }
    });
});

