
# Blueprint de la Aplicación de Librería

## Visión General

Esta aplicación es una tienda de libros virtual diseñada para ofrecer una experiencia de usuario moderna y atractiva. Permite a los usuarios explorar libros, iniciar sesión, registrarse y, en futuras iteraciones, realizar compras.

## Características Implementadas

### Diseño y Estilo

*   **Tema:** Oscuro y elegante, con un color de acento amarillo vibrante (`#F1C40F`).
*   **Tipografía:** Se utiliza `Google Fonts` (familia Oswald y Roboto) para los títulos y el texto, proporcionando un aspecto moderno y legible.
*   **Efecto Hover:** Se ha implementado un sutil efecto de zoom en los elementos interactivos para mejorar la experiencia en la web.
*   **Iconografía:** Se utilizan iconos de Material Design para mejorar la navegación y la comprensión visual.
*   **Layout Responsivo:** La pantalla de inicio se ha ajustado para funcionar correctamente en dispositivos con pantallas pequeñas, manteniendo los elementos clave visibles.

### Estructura de la Aplicación

*   **Navegación:** Se utiliza un sistema de rutas con nombres para facilitar la navegación entre pantallas: `/`, `/registro`, `/login`, `/usuario`, `/ofertas`, `/confirmacion`.
*   **Pantalla de Inicio (`PantallaInicio` - pantalla1.dart):
    *   **Barra de Búsqueda:** Un campo de texto para buscar libros.
    *   **Navegación de Categorías:** Enlaces a diferentes secciones de la tienda.
    *   **Lista de Libros Destacados:** Una lista desplazable de libros con su imagen, título, precio y un botón "Ver".
    *   **Botón y Icono de "Iniciar Sesión":** El botón principal y el icono del carrito en la navegación ahora redirigen a la pantalla de inicio de sesión (`/login`).
    *   **Pie de Página:** Enlaces adicionales a "Ofertas" y "Contacto".
*   **Pantalla de Registro (`PantallaRegistro` - pantalla2.dart):
    *   Un formulario de registro básico.
*   **Pantalla de Inicio de Sesión (`Pantalla3` - pantalla3.dart):
    *   Un formulario de inicio de sesión con campos para "Correo electrónico" y "Contraseña".
    *   Una casilla de verificación "Recordarme".
    *   Un botón "INGRESAR".
    *   Un enlace para redirigir a la pantalla de registro (`/registro`).
    *   Un enlace para volver a la pantalla de inicio (`/`).
*   **Otras Pantallas:** `PantallaUsuario`, `PantallaOfertas`, `PantallaConfirmacion`.

## Plan de Cambios Actual (Implementación de Login)

**Objetivo:** Reemplazar la funcionalidad redundante de la pantalla de carrito por una pantalla de "Inicio de Sesión" funcional.

**Pasos Realizados:**

1.  **Consolidación de Pantallas:** Se identificó que `PantallaCarrito` (en `pantalla3.dart`) era redundante.
2.  **Reutilización de Archivo:** Se modificó el archivo `lib/mispantallas/pantalla3.dart` para albergar la nueva pantalla de inicio de sesión, basándose en el diseño proporcionado.
3.  **Actualización de Rutas:** Se actualizó `lib/main.dart` para cambiar la ruta `/carrito` por `/login`, la cual ahora apunta a `Pantalla3`.
4.  **Ajuste de Navegación:** Se modificó `lib/mispantallas/pantalla1.dart` para que el botón "Iniciar Sesión" y el icono del carrito de compras naveguen a la nueva ruta `/login`.
5.  **Enlace de Registro:** Se añadió un enlace en la nueva pantalla de inicio de sesión que dirige al usuario a la pantalla de registro (`/registro`).
