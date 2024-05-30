document.addEventListener("DOMContentLoaded", function() {
    const carousel = document.querySelector(".carousel");
    let currentIndex = 0;

    function showImage(index) {
        carousel.style.transform = `translateX(-${index * 100}%)`;
    }

    // Cambiar de imagen cada 3 segundos (3000 milisegundos)
    setInterval(() => {
        currentIndex = (currentIndex + 1) % carousel.children.length;
        showImage(currentIndex);
    }, 5000);
});
