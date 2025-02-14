
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
    const partners = document.querySelectorAll(".partner-carousel .col-md-3");
    const partnerWidth = partners[0].offsetWidth + 20; // Largura + margem
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

});







