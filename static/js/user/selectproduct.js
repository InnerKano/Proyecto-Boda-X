function toggleCard(button) {
    // Obtener el ID del producto desde el botón
    const productId = button.getAttribute('data-product-id');
    
    // Obtener la sección que contiene el botón
    const sectionElement = button.closest('.section');
    const section = sectionElement.getAttribute('data-section');
    
    // Obtener todas las tarjetas en la sección específica
    const cards = sectionElement.querySelectorAll('.card-vertical');
    
    // Recorrer todas las tarjetas para actualizar su estado
    cards.forEach(card => {
        // Verificar si la tarjeta actual es la seleccionada
        const isCurrentCard = card.querySelector(`#nombre-producto-${productId}`) !== null;
        
        // Actualizar el estado de la tarjeta
        card.setAttribute('data-selected', isCurrentCard ? 'true' : 'false');
        
        // Cambiar la clase para reflejar el estado visualmente (opcional)
        if (isCurrentCard) {
            card.classList.add('selected');
        } else {
            card.classList.remove('selected');
        }
    });
}
/*
    Este archivo JavaScript contiene la lógica para manejar la selección de productos en el catálogo.

    Función: toggleCard(button)
    -----------------------------------
    Esta función se invoca cuando se hace clic en el botón "Seleccionar" de cualquier tarjeta de producto.

    Parámetros:
    - button: el botón HTML que fue clicado.

    Descripción:
    La función realiza las siguientes acciones:
    1. Obtiene el ID del producto desde el atributo 'data-product-id' del botón.
    2. Encuentra la sección que contiene el botón utilizando 'closest('.section')'.
    3. Obtiene todas las tarjetas de productos dentro de la sección específica.
    4. Itera sobre las tarjetas y actualiza el atributo 'data-selected' para reflejar si la tarjeta está seleccionada o no.
    5. Actualiza la clase de la tarjeta para mostrar visualmente su estado de selección.

    Esto permite que, al seleccionar un producto, el resto de productos en la misma sección se desmarquen.
*/