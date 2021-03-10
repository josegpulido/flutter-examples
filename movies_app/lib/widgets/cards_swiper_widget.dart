// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies_app/widgets/circular_loader_widget.dart';
// Models
import 'package:movies_app/models/movie_model.dart';

class CardsSwiper extends StatelessWidget {

  // Variables
  final List<Movie> movies;

  // Constructor
  CardsSwiper({
    @required this.movies
  });

  // Widget builder
  @override
  Widget build(BuildContext context) {

    /* MediaQuery es una clase que otorga información sobre la densidad de la
     * pantalla de forma dinámica y actualizada (ancho, alto, modo de pantalla, etc).
     */
    final Size screenSize = MediaQuery.of(context).size;

    // Swiper widget
    final Swiper swiperWidget = Swiper(
      itemWidth: screenSize.width * 0.5,
      itemHeight: double.infinity,
      itemCount: 3,
      layout: SwiperLayout.STACK,
      itemBuilder: (BuildContext context, int i) {
        // ClipRRect crea un Widget redondeado y rectangular
        return GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              image: NetworkImage(movies[i].getPosterImageUrl()),
              placeholder: AssetImage('assets/images/loading.gif'),
              fit: BoxFit.cover
            )
          ),
          onTap: () {
            /**
             * Navigator.pushNamed navega según el nombre de la ruta, definido
             * en las rutas del Widget MaterialApp. Permite pasar argumentos a la
             * ruta para luego cacharlos desde el Widget llamado.
             * 
             * Esta forma de pasar información útil al Widget es un sustituto al
             * constructor convencional que recibe parámetros.
             */
            Navigator.pushNamed(context, 'details', arguments: movies[i]);
          }
        );
      }
    );

    // Progress widget
    final Center progressWidget = Center(
      child: CircularLoader()
    );

    return Container(
      /* 'width' del container corresponderá al todo el espacio disponible,
       * mientras que 'height' al 50% de la altura disponible.
       */
      width: double.infinity,
      height: screenSize.height * 0.5,
      // color: Color(0xFFe9e9e9), <-- disabled line
      padding: EdgeInsets.symmetric(
        vertical: 30.0
      ),
      child: movies.length > 0 ? swiperWidget : progressWidget
    );
  }
}