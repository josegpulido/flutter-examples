# Prácticas en Flutter
Ordenadas de menor a mayor dificultad.

## Indice
* **/my_first_app**. App de Hola Mundo. Arrancando con Dart y Flutter.
  - Variables y sus tipos.
  - Funciones y sus tipos.
  - Clases e instancias de clases.
  - Estructuras de programación (condicionales, bucles, etc).
  - Introducción a Futures.

* **/dart_cli**. Ejemplo de app para CLI.

* **/cuintle_app**. App de viajes como práctica de maquetado. [Maqueta diseñada en Adobe XD](https://static.platzi.com/media/user_upload/mokups-d3409d32-1da1-4c7b-844f-fa931bd43e18.jpg). [Demostración](https://drive.google.com/file/d/1tVKDD4ffoiaYV0bunBg-8THOLQUhbihO/view?usp=sharing)
  - Utilización de fonts.
  - Introducción a Stateless y Stateful Widgets.
  - Introducción al diseño de layouts: Row, Column, Stack y Container.
  - Personalización del Material Theme.
  - Utilización de parámetros opcionales o requeridos en Widgets.
  - Implementación de Widgets varios:
    - Carrusel de imágenes con ConstrainedBox.
    - Material FAB.
    - Material Snackbars.
    - BottomNavigationBar.
    - Comportamiento al estilo Material Design con InkWell, Ink y FittedBox.

* **/firstapp**. App probando los widgets de Material. Comenzando a introducir reactividad. [Demostración](https://drive.google.com/file/d/1tPYuHhzGUhGqQ_FnuWNVefwT3svGFQf8/view?usp=sharing)
  - Utilización de assets.
  - Implementación de rutas de app.
  - Introducción al FutureBuilder.
  - Lectura de archivos del directorio del proyecto.
  - Introducción a la navegación entre páginas: .pop() y .pushedName().
  - Implementación de Widgets varios:
    - Material Dialog.
    - Imágenes de la red: FadeInImage y CircleAvatar.
    - Material Card.
    - AnimatedContainer.
    - TextField, DatePicker con TextEditingController y DropDownMenu.
    - Slider, Checkbox y Switch, interactuando con una Image.
    - Scroll de contenido infinito, Listener de un ListView con ScrollController, gesto de refresh con RefreshIndicator, lista perezosa con ListView.builder, y CircularProgressIndicator.

* **/movies_app**. App de películas que consume la API de The Movie Database, [TMDB](https://www.themoviedb.org/settings/api). [Demostración](https://drive.google.com/file/d/1tCA-aRKDCLeBX_XMl2aZfNJtRuwK5lSP/view?usp=sharing)
  - Implementación de Widgets de terceros con pubspec.
  - Introducción al diseño responsive con MediaQuery.
  - Navegación entre páginas y paso de parámetros con .pushedName() y ModalRoute.
  - Introducción a HTTP y BLoC: 
    - Módulo HTTP y llamadas a endpoint de API.
    - Casteo de respuesta del API con modelos.
    - Complementando un Future con Completer.
    - Introducción a arquitectura BLoC y ReactiveX con StreamController.
  - Introducción al StreamBuilder.
  - Implementación de Widgets varios:
    - Buscador dinámico de resultados con SearchDelegate.
    - Delimitación universal para pantallas con SafeArea.
    - Paginación de Widgets usando gesto swipe con Swiper.
    - Detección de gestos con GestureDetector.
    - Carrusel perezoso paginado y de scroll de contenido infinito con PageView.
    - Widgets redondeados con ClipRRect.
    - Vista y AppBar colapsables con Slivers.
    - Acoplamiento de Widget común a Slivers con SliverFillRemaining y SliverToBoxAdapter.
* **/qr_scanner**. App con lector de códigos QR que puede escanear direcciones web o coordinadas geográficas. [Demostración](https://drive.google.com/file/d/1ygOTZMB7PTTRf6U1_fo6zJ_6GUju_lG8/view?usp=sharing)
  - Implementación de preferencias de usuario (Shared Preferences) con patrón Singleton para cambiar el tema de la aplicación entre modo claro y modo oscuro.
  - Creación de modelos de forma fácil con (QuickType)[app.quicktype.io].
  - Implementación de SQLite y clase de operaciones CRUD.
  - Implementación de lector de códigos QR.
  - Creación de notificadores de estado para ejecutar modificaciones al UI de forma reactiva.
  - Implementación de Google Maps para Android.
  - Implementación de Widgets varios:
    - Superficie desechable por gesto swipe con Dismissible y id único del Widget generado con UniqueKey.

