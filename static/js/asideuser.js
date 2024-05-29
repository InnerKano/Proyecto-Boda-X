// Este evento se ejecuta cuando todo el HTML ha sido completamente cargado y analizado,
// sin necesidad de esperar a que se carguen las imágenes y otros recursos externos.
document.addEventListener("DOMContentLoaded", function() {

    // Esta función carga el formulario de inicio de sesión dentro del elemento con ID 'login-form-asideindex'.
    function loadLoginForm() {
        // Hace una solicitud GET a la ruta '/iniciosesion' en el servidor.
        fetch('/iniciosesion')
            .then(response => response.text())
            .then(html => {
                // Obtiene el elemento con ID 'login-form-asideindex' y establece su contenido HTML al formulario de inicio de sesión.
                const aside = document.getElementById('login-form-asideindex');
                aside.innerHTML = html;
                

                // Obtiene el botón con ID 'register-button'.
                const registerButton = document.getElementById('register-button');
                if (registerButton) {
                    // Agrega un evento de clic al botón 'register-button'.
                    registerButton.addEventListener('click', function(event) {
                        event.preventDefault();

                        // Cuando se hace clic en el botón 'register-button', hace una solicitud GET a la ruta '/registrarusuario' en el servidor.
                        fetch('/registrarusuario')
                            .then(response => response.text())
                            .then(html => {
                                // Establece el contenido HTML del elemento 'aside' al formulario de registro.
                                aside.innerHTML = html;

                                // Obtiene el botón con ID 'login-button' o 'logina'.
                                const loginButton = document.getElementById('login-button');
                                const logina = document.getElementById('login-a');

                                if (loginButton) {
                                    // Agrega un evento de clic al botón 'login-button'.
                                    loginButton.addEventListener('click', function(event) {
                                        event.preventDefault();

                                        // Cuando se hace clic en el botón 'login-button', vuelve a cargar el formulario de inicio de sesión.
                                        loadLoginForm();
                                    });
                                }
                                if (logina) {
                                    // Agrega un evento de clic al botón 'login-button'.
                                    logina.addEventListener('click', function(event) {
                                        event.preventDefault();

                                        // Cuando se hace clic en el botón 'login-button', vuelve a cargar el formulario de inicio de sesión.
                                        loadLoginForm();
                                    });
                                }

                            })
                            .catch(error => console.log(error));
                    });
                }

                // Obtiene el botón con ID 'user-botton'.
                const userButton = document.getElementById('user-button');
                const loginForm = document.getElementById('login-formulario');
                if (userButton) {
                    
                    // Agrega un evento de clic al botón 'user-button'.
                    userButton.addEventListener('click', function(event) {
                        event.preventDefault();
                        // activa el boton sudmit de iniciosesion.html para mandar los datos a la funcion login en app.py
                        // Activar el envío del formulario
                        loginForm.submit();
                        // Cuando se hace clic en el botón 'user-button', hace una solicitud GET a la ruta '/usuario' en el servidor.
                        fetch('/usuario')
                            .then(response => response.text())
                            .then(html => {
                                // Establece el contenido HTML del elemento 'aside' al formulario de usuario.
                                aside.innerHTML = html;

                            })
                            .catch(error => console.log(error));
                    });
                }

            })
            .catch(error => console.log(error));
    }
    
    // Este evento se activa cuando se hace clic en el icono de usuario.
    // El formulario de inicio de sesión se mostrará u ocultará dependiendo de su estado actual.
    const userIcon = document.getElementById('user-icon'); // Obtiene el elemento con ID 'user-icon' y lo guarda en la variable 'userIcon'.
    userIcon.addEventListener('click', function(event) { // Agrega un evento de clic al elemento 'userIcon'.
        event.preventDefault(); // Evita que el enlace del icono de usuario cambie la página cuando se hace clic.
        const aside = document.getElementById('login-form-asideindex'); // Obtiene el elemento con ID 'login-form' y lo guarda en la variable 'aside'.
        if (parseInt(getComputedStyle(aside).right) < 0) { // Comprueba si el formulario de inicio de sesión está fuera de la pantalla.
            aside.style.right = "0"; // Si está fuera de la pantalla, lo desplaza hacia la derecha para mostrarlo.
            loadLoginForm(); // Llama a la función 'loadLoginForm' para cargar el formulario de inicio de sesión.
        } else {
            aside.style.right = "-400px"; // Si el formulario de inicio de sesión está visible, lo desplaza fuera de la pantalla para ocultarlo.
        }
    });

});

/* Este script permite a los usuarios interactuar con el icono de usuario para mostrar y
    ocultar el formulario de inicio de sesión. Cuando el formulario de inicio de sesión está oculto,
    se carga el formulario de inicio de sesión. 
    Cuando el formulario de inicio de sesión está visible, se oculta. 
    Además, los usuarios pueden cambiar entre el formulario de inicio de sesión y el formulario de registro sin tener que recargar la página. 
    Esto se logra utilizando AJAX para hacer solicitudes al servidor y obtener los formularios,
    y luego insertando el contenido HTML de los formularios en el elemento aside en la página.
    Los eventos de clic se agregan a los botones después de que los formularios se hayan cargado para asegurarse de que
    los botones existan en el DOM cuando se intenta agregar los eventos. */