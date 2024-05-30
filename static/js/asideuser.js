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
                                const logina = document.getElementById('login-a');

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

                /* Documentacion de la Función para Manejar el Registro de Usuario
                Función para Manejar el Inicio de Sesión del Usuario

                Propósito:
                - Esta función maneja la interacción del usuario al intentar iniciar sesión en el sistema.
                - Se activa cuando se hace clic en el botón con ID 'user-button' en la página.

                Comportamiento:
                - Cuando el usuario hace clic en el botón de inicio de sesión, se envían los datos del formulario al servidor para su validación.
                - Si la validación es exitosa (es decir, si el servidor devuelve un mensaje de éxito), se carga dinámicamente el contenido de la página 'usuario.html' dentro del elemento 'aside' en la página actual.
                - Si la validación falla, se muestra un mensaje de error en la consola del navegador.

                Flujo de Ejecución:
                1. Se obtiene el botón con ID 'user-button' y el formulario de inicio de sesión con ID 'login-formulario'.
                2. Se agrega un evento de clic al botón 'user-button' para manejar la acción del usuario.
                3. Cuando se hace clic en el botón, se evita el comportamiento predeterminado del navegador.
                4. Se recopilan los datos del formulario utilizando un objeto FormData.
                5. Se realiza una solicitud POST al servidor con los datos del formulario utilizando Fetch API.
                6. Se procesa la respuesta del servidor:
                - Si la respuesta indica éxito (data.success es verdadero), se carga la página 'usuario.html' dentro del elemento 'aside'.
                - Si la respuesta indica un fallo, se muestra un mensaje de error en la consola.
                7. En caso de error durante la solicitud o procesamiento de la respuesta, se maneja adecuadamente mostrando el error en la consola del navegador.

                Uso:
                - Esta función es esencial para permitir que los usuarios inicien sesión y accedan al contenido de la página de usuario de manera dinámica.

                */
                // Selecciona el botón de inicio de sesión y el formulario de inicio de sesión en el DOM
                const userButton = document.getElementById('user-button');
                const loginForm = document.getElementById('login-formulario');

                // Verifica si el botón de inicio de sesión existe en la página
                if (userButton) {
                    // Agrega un evento de clic al botón de inicio de sesión
                    userButton.addEventListener('click', function(event) {
                        // Evita que el navegador ejecute la acción predeterminada del botón
                        event.preventDefault();

                        // Recopila los datos del formulario de inicio de sesión
                        const formData = new FormData(loginForm);

                        // Realiza una solicitud POST al servidor con los datos del formulario
                        fetch('/login', {
                            method: 'POST',
                            body: formData
                        })
                        // Procesa la respuesta del servidor
                        .then(response => response.json())
                        .then(data => {
                            // Verifica si la solicitud fue exitosa
                            if (data.success) {
                                // Si es exitosa, carga la página 'usuario.html' dentro del elemento 'aside' en la página actual
                                fetch('/usuario')
                                    .then(response => response.text())
                                    .then(html => {
                                        const aside = document.getElementById('login-form-asideindex');
                                        aside.innerHTML = html;
                                    })
                                    .catch(error => console.log(error));
                            } else {
                                // Si la solicitud falla, muestra un mensaje de error en la consola
                                console.log(data.message);
                            }
                        })
                        // Maneja cualquier error durante la solicitud o el procesamiento de la respuesta
                        .catch(error => console.log(error));
                    });
                }

            })
            .catch(error => console.log(error));
    }
    
    function loadUserInfo() {
        // Hace una solicitud GET a la ruta '/usuario' en el servidor.
        fetch('/usuario')
            .then(response => response.text())
            .then(html => {
                // Obtiene el elemento con ID 'login-form-asideindex' y establece su contenido HTML al usuario.
                const aside = document.getElementById('login-form-asideindex');
                aside.innerHTML = html;
            })
            .catch(error => console.log(error));
    }

    // Verifica si el usuario está autenticado y carga el contenido apropiado.
    function checkLoginStatusAndLoadContent() {
        fetch('/check_login_status')
            .then(response => response.json())
            .then(data => {
                if (data.loggedin) {
                    loadUserInfo();
                } else {
                    loadLoginForm();
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
            /* loadLoginForm(); // Llama a la función 'loadLoginForm' para cargar el formulario de inicio de sesión. */
            checkLoginStatusAndLoadContent(); // Llama a la función 'checkLoginStatusAndLoadContent' para cargar el contenido apropiado.
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