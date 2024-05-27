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
    4. Itera sobre las tarjetas y actualiza el atributo 'data-selected' para reflejar si la tarjeta está seleccionada o no.
    5. Actualiza la clase de la tarjeta para mostrar visualmente su estado de selección.
    6. Almacena el producto seleccionado en localStorage.
*/

function toggleCard(button) {
    const productId = button.getAttribute('data-product-id');
    const sectionElement = button.closest('.section');
    const section = sectionElement.getAttribute('data-section');
    const cards = sectionElement.querySelectorAll('.card-vertical');

    cards.forEach(card => {
        const isCurrentCard = card.querySelector(`#nombre-producto-${productId}`) !== null;
        card.setAttribute('data-selected', isCurrentCard ? 'true' : 'false');
        if (isCurrentCard) {
            card.classList.add('selected');
        } else {
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
        price: sectionElement.querySelector(`#precio-producto-${productId}`).textContent
    };

    // Guardar o actualizar el producto seleccionado en localStorage
    let selectedProducts = JSON.parse(localStorage.getItem('selectedProducts')) || {};
    selectedProducts[`${section}-${productId}`] = selectedProduct;
    localStorage.setItem('selectedProducts', JSON.stringify(selectedProducts));
}

/*
    Función: moveToCart()
    -----------------------------------
    Esta función se invoca cuando el usuario hace clic en el enlace "Ir al Carrito".
    Transfiere los productos seleccionados desde localStorage a una nueva página de carrito.
*/
function moveToCart() {
    // Obtener los productos seleccionados desde localStorage
    const selectedProducts = JSON.parse(localStorage.getItem('selectedProducts'));
    if (selectedProducts) {
        // Almacenar los productos seleccionados en una lista de carrito
        let cart = JSON.parse(localStorage.getItem('cart')) || [];
        Object.values(selectedProducts).forEach(product => {
            cart.push(product);
        });
        localStorage.setItem('cart', JSON.stringify(cart));
        // Limpiar las selecciones actuales
        localStorage.removeItem('selectedProducts');
    }
}
