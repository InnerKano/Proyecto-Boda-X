document.addEventListener("DOMContentLoaded", function() {
    console.log("Transition User x Register");
    // Agregar un controlador de eventos a todos los enlaces con la clase "page-transition"
    var pageLinks = document.querySelectorAll('.page-transition');
    pageLinks.forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // Evita la acción predeterminada del enlace
            var href = this.getAttribute('href'); // Obtiene la URL de destino del enlace
            // Realiza la animación de desvanecimiento
            document.body.style.opacity = 0; // Desvanecer el contenido
            setTimeout(function() {
                window.location.href = href; // Redirigir a la página de destino
            }, 200); // Espera 500 milisegundos (medio segundo) antes de redirigir
        });
    });
});
