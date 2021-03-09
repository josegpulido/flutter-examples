// Required imports
import 'package:flutter/material.dart';
// Models
import 'package:movies_app/models/movie_model.dart';
// Widgets
import 'package:movies_app/widgets/circular_loader_widget.dart';
// Providers
import 'package:movies_app/providers/movies_provider.dart';

class CardsHorizontal extends StatelessWidget {

  // Variables
  final List<Movie> movies;
  final MoviesProvider moviesProvider = MoviesProvider();
  final Function getNextPage;

  // Constructor
  CardsHorizontal({
    @required this.movies,
    @required this.getNextPage
  });

  /**
   * Creando PageController, que sirve para manipular aspectos visuales y
   * de comportamiento de un PageView.
   */
  final PageController pageController = PageController(
    initialPage: 2,
    viewportFraction: 0.35
  );

  // Widget builder
  @override
  Widget build(BuildContext context) {
    
    /* MediaQuery es una clase que otorga información sobre la densidad de la
     * pantalla de forma dinámica y actualizada (ancho, alto, modo de pantalla, etc).
     */
    final Size screenSize = MediaQuery.of(context).size;

    /**
     * Levantando el listener del PageController para escuchar cuando suceda
     * un scroll en el PageView.
     * 
     * Cuando la distancia recorrida por el scroll sera igual a la máxima
     * longitud del PageView - 150 pixeles, entonces llamar al provider
     * para descargar más películas.
     */
    pageController.addListener(() {
      if (pageController.position.pixels >= pageController.position.maxScrollExtent - 150) {
        getNextPage();
      }
    });

    /**
     * Page view widget. La diferencia entre un PageView y un PageView.builder
     * es la siguiente:
     * - PageView renderiza todos los elementos que se sirvan sobre
     * el 'children:' de un tirón, por lo que es necesario pasarle un List<Widget>.
     * - PageView.builder renderiza los elementos bajo demanda (según aparezcan
     * en pantalla), y su propiedad 'itemBuilder:' es como un .map() al que
     * hay que retornarle un Widget.
     */
    final PageView pageviewWidget = PageView.builder(
      pageSnapping: false,
      itemCount: movies.length, // Le actualiza el lenght de items al PageView
      controller: pageController,
      itemBuilder: (BuildContext context, int i) {
        return _createTopRatedMovieCard(context, movies[i]);
      }
    );

    // Progress widget
    final Center progressWidget = Center(
      child: CircularLoader()
    );

    return Container(
      width: double.infinity,
      height: screenSize.height * 0.36,
      margin: EdgeInsets.only(
        top: 15.0
      ),
      /* PageView es un tipo de ListView horizontal que soporta paginación
       * entre elementos.
       */
      child: movies.length > 0 ? pageviewWidget : progressWidget
    );
  }

  // Método para construir una card TopRatedMovie para el PageView horizontal
  Widget _createTopRatedMovieCard(BuildContext context, Movie movie) {

    final Size screenSize = MediaQuery.of(context).size;

    // Widget de card
    final Column cardWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 9.0
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              height: screenSize.height * 0.28,
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage(movie.getPosterImageUrl()),
              fit: BoxFit.cover
            )
          )
        ),
        Container(
          padding: EdgeInsets.only(
            top: 9.0,
            right: 9.0
          ),
          child: Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1
          )
        )
      ]
    );

    /**
     * Gesture detector es un Widget que permite controlar muchos tipos de
     * gestos dentro de un área en específico.
     */
    return GestureDetector(
      child: cardWidget,
      onTap: () {
        /**
         * Navigator.pushNamed navega según el nombre de la ruta, definido
         * en las rutas del Widget MaterialApp. Permite pasar argumentos a la
         * ruta para luego cacharlos desde el Widget llamado.
         * 
         * Esta forma de pasar información útil al Widget es un sustituto al
         * constructor convencional que recibe parámetros.
         */
        Navigator.pushNamed(context, 'details', arguments: movie);
      }
    );
  }
}