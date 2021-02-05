// Required imports
import 'package:flutter/material.dart';
// Models
import 'package:movies_app/models/movie_model.dart';
// Widgets
import 'package:movies_app/widgets/circular_loader_widget.dart';

class CardsHorizontal extends StatelessWidget {

  // Variables
  final List<Movie> movies;

  // Constructor
  CardsHorizontal({
    @required this.movies
  });

  // Widget builder
  @override
  Widget build(BuildContext context) {
    /* MediaQuery es una clase que otorga información sobre la densidad de la
     * pantalla de forma dinámica y actualizada (ancho, alto, modo de pantalla, etc).
     */
    final Size screenSize = MediaQuery.of(context).size;

    // Page view widget
    final PageView pageviewWidget = PageView(
      pageSnapping: false,
      controller: PageController(
        initialPage: 2,
        viewportFraction: 0.35
      ),
      children: _singlePageCard(context)
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

  // Método para construir dinámicamente las cards del page view
  List<Widget> _singlePageCard(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    return movies.map((Movie movie) {
      return Column(
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
    }).toList();
  }
}