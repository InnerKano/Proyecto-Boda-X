/*
    Este archivo JavaScript contiene la lógica para manejar la selección de productos en el catálogo.

    Función: toggleCard(button)
    -----------------------------------
    Esta función se invoca cuando se hace clic en el botón "Ver más info" de cualquier tarjeta de producto.

    Parámetros:
    - button: el botón HTML que fue clicado.

    Descripción:
    La función realiza las siguientes acciones:
    1. Obtiene el ID del producto desde el atributo 'data-product-id' del botón.
    2. Encuentra la sección que contiene el botón utilizando 'closest('.section')'.
    3. Obtiene todas las tarjetas de productos dentro de la sección específica.
    4. Si el servicio es "luna de miel", deselecciona todas las tarjetas de todas las secciones de luna de miel.
    5. Itera sobre las tarjetas y actualiza el atributo 'data-selected' para reflejar si la tarjeta está seleccionada o no.
    6. Actualiza la clase de la tarjeta para mostrar visualmente su estado de selección.
    7. Almacena o elimina el producto seleccionado en localStorage.
*/

function toggleCard(button) {
    // Obtener el ID del producto del botón que fue clicado.
    const productId = button.getAttribute('data-product-id');

    // Obtener el elemento de la sección a la que pertenece el botón.
    const sectionElement = button.closest('.section');

    // Obtener el nombre de la sección.
    const section = sectionElement.getAttribute('data-section');

    // Obtener todas las tarjetas de la sección actual.
    const cards = sectionElement.querySelectorAll('.card-vertical');

    // Verificar si el servicio es "luna de miel".
    const isHoneymoonService = sectionElement.closest('.service').id === 'luna-de-miel';

    // Si es el servicio de luna de miel, deseleccionar todas las tarjetas de todas las secciones de luna de miel.
    if (isHoneymoonService) {
        // Obtener todas las secciones dentro del servicio de luna de miel.
        const honeymoonSections = document.querySelectorAll('#luna-de-miel .section');

        // Iterar a través de cada sección de luna de miel.
        honeymoonSections.forEach(honeymoonSection => {
            // Obtener todas las tarjetas dentro de la sección actual de luna de miel.
            const honeymoonCards = honeymoonSection.querySelectorAll('.card-vertical');

            // Deseleccionar todas las tarjetas dentro de la sección actual.
            honeymoonCards.forEach(honeymoonCard => {
                honeymoonCard.setAttribute('data-selected', 'false');
                honeymoonCard.classList.remove('selected');
            });
        });
    }

    // Seleccionar o deseleccionar la tarjeta actual.
    cards.forEach(card => {
        // Verificar si la tarjeta actual es la tarjeta clicada.
        const isCurrentCard = card.querySelector(`#nombre-producto-${productId}`) !== null;

        // Si es la tarjeta clicada y ya está seleccionada, deseleccionarla.
        if (isCurrentCard && card.classList.contains('selected')) {
            card.setAttribute('data-selected', 'false');
            card.classList.remove('selected');
        } else if (isCurrentCard) {
            // Si es la tarjeta clicada y no está seleccionada, seleccionarla.
            card.setAttribute('data-selected', 'true');
            card.classList.add('selected');
        } else {
            // Deseleccionar todas las demás tarjetas.
            card.setAttribute('data-selected', 'false');
            card.classList.remove('selected');
        }
    });

    // Obtener el producto seleccionado
    const selectedProduct = {
        section: section,
        productId: productId,
        image: sectionElement.querySelector(`#imagen-producto-${productId}`).src,
        name: sectionElement.querySelector(`#nombre-producto-${productId}`).textContent,
        description: sectionElement.querySelector(`#descripcion-producto-${productId}`).textContent,
        price: sectionElement.querySelector(`#precio-producto-${productId}`).textContent,
    };

    // Guardar o actualizar el producto seleccionado en localStorage
    let selectedProducts = JSON.parse(localStorage.getItem('selectedProducts')) || {};

    // Eliminar productos previos de la misma sección o de cualquier sección de luna de miel
    /* console.log('antes',selectedProducts); */
    if (isHoneymoonService) {
        Object.keys(selectedProducts).forEach(key => {//itera sobre las claves de los productos seleccionados
            if (key.includes('luna-de-miel')) {//si la clave contiene 'luna-de-miel'
                delete selectedProducts[key];//elimina el producto seleccionado
            }
        });
    } else {
        Object.keys(selectedProducts).forEach(key => {//itera sobre las claves de los productos seleccionados
            if (key.startsWith(`${section}-`)) {//si la clave comienza con la sección actual
                delete selectedProducts[key];//elimina el producto seleccionado
            }
        });
    }
    /* console.log('despues',selectedProducts); */

    // Agregar el nuevo producto seleccionado
    selectedProducts[`${section}-${productId}`] = selectedProduct;

    // Actualizar localStorage con los productos seleccionados
    localStorage.setItem('selectedProducts', JSON.stringify(selectedProducts));
}

/*
    Función: moveToCart()
    -----------------------------------
    Esta función se invoca cuando el usuario hace clic en el enlace "Ir al Carrito".
    Transfiere los productos seleccionados desde localStorage a una nueva página de carrito,
    asegurándose de que no haya productos duplicados de la misma sección en el carrito.
*/
function moveToCart() {
    // Obtener los productos seleccionados desde localStorage
    const selectedProducts = JSON.parse(localStorage.getItem('selectedProducts'));
    if (selectedProducts) {
        // Almacenar los productos seleccionados en una lista de carrito
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
/*         console.log('cart antes: ', cart); */

        // Crear un conjunto para rastrear secciones ya agregadas al carrito
        const sectionsInCart = new Set(cart.map(product => product.section));//crea un conjunto con las secciones de los productos en el carrito

        Object.values(selectedProducts).forEach(product => {
            // Si la sección del producto ya está en el carrito
            if (sectionsInCart.has(product.section)) {
                // Reemplazar el producto existente de esa sección
                cart = cart.map(cartProduct => //map crea un nuevo array con los resultados de la función
                    cartProduct.section === product.section ? product : cartProduct//si la sección del producto en el carrito es igual a la sección del producto seleccionado, reemplaza el producto en el carrito por el producto seleccionado
                );
            } else {
                // Si la sección no está en el carrito, agregar el producto
                cart.push(product);//agrega el producto al carrito
                sectionsInCart.add(product.section);//agrega la sección al conjunto
            }
        });

/*         console.log('cart despues: ', cart); */
        // Guardar la lista de carrito actualizada en localStorage
        localStorage.setItem('cart', JSON.stringify(cart));

        // Limpiar las selecciones actuales
        localStorage.removeItem('selectedProducts');
    }
}

