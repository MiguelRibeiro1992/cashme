
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

    // Adiciona eventos de clique para Google Play e App Store
    document.querySelectorAll(".app-link").forEach(button => {
        button.addEventListener("click", function () {
            window.open(this.getAttribute("data-url"), "_blank");
        });
    });

});







