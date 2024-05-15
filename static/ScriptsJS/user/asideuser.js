// Este evento se ejecuta cuando todo el HTML ha sido completamente cargado y analizado,
// sin necesidad de esperar a que se carguen las imágenes y otros recursos externos.
document.addEventListener("DOMContentLoaded", function() {

    // Esta función carga el formulario de inicio de sesión dentro del elemento con ID 'login-form'.
    function loadLoginForm() {
        // Busca el elemento 'login-form' en el documento y lo guarda en la variable 'aside'.
        const aside = document.getElementById('login-form');
        // Reemplaza el contenido del elemento 'aside' con el formulario de inicio de sesión cargado desde el archivo 'iniciosesion.html'.
        aside.innerHTML = '<object class="aside-object" type="text/html" data="./Templates/views/iniciosesion.html"></object>';

        logincharged();/* Activa esta funcion cuando ya cargo la pantalla login */
    }

    // Este evento se activa cuando se hace clic en el icono de usuario.
    // El formulario de inicio de sesión se mostrará u ocultará dependiendo de su estado actual.
    const userIcon = document.getElementById('user-icon'); // Obtiene el elemento con ID 'user-icon' y lo guarda en la variable 'userIcon'.
    userIcon.addEventListener('click', function(event) { // Agrega un evento de clic al elemento 'userIcon'.
        event.preventDefault(); // Evita que el enlace del icono de usuario cambie la página cuando se hace clic.
        const aside = document.getElementById('login-form'); // Obtiene el elemento con ID 'login-form' y lo guarda en la variable 'aside'.
        if (parseInt(getComputedStyle(aside).right) < 0) { // Comprueba si el formulario de inicio de sesión está fuera de la pantalla.
            aside.style.right = "0"; // Si está fuera de la pantalla, lo desplaza hacia la derecha para mostrarlo.
            loadLoginForm(); // Llama a la función 'loadLoginForm' para cargar el formulario de inicio de sesión.
        } else {
            aside.style.right = "-400px"; // Si el formulario de inicio de sesión está visible, lo desplaza fuera de la pantalla para ocultarlo.
        }
    });

});
