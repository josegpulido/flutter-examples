// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:movies_app/widgets/cards_swiper_widget.dart';
import 'package:movies_app/widgets/cards_horizontal_widget.dart';
// Providers
import 'package:movies_app/providers/movies_provider.dart';
// Models
import 'package:movies_app/models/movie_model.dart';
// Delegates
import 'package:movies_app/search/search_delegate.dart';

class HomePage extends StatelessWidget {

  // Variables
  final MoviesProvider moviesProvider = MoviesProvider();

  // Widget builder
  @override
  Widget build(BuildContext context) {
    // Retornando widget
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              /**
               * showSearch es una clase provista por Flutter que facilita la
               * implementación de una pantalla con lista en base a una
               * búsqueda.
               * 
               * Requiere un context y un delegate, el cual es una clase provista
               * también por Flutter que provee los métodos necesarios para
               * manipular el comportamiento del buscador.
               */
              showSearch(context: context, delegate: DataSearch());
            }
          )
        ]
      ),
      /* SafeArea es un Widget que reconoce los dispositivos con notch (como el
       * iPhone) y otras variantes de las pantallas, y añade un padding a un
       * "área" segura de forma que los Widgets no queden cortados o mal presentados
       * debido a las características de estos dispositivos.
       */
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  _swipedCardsBuilder(context),
                  _infiniteScrollBuilder(context)
                ]
              )
            )
          ]
        )
      )
    );
  }

  // Método que construye las cards de películas
  Widget _swipedCardsBuilder(BuildContext context) {
    // Constuyendo el widget de forma asíncrona con el FutureBuilder
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        return CardsSwiper(
          movies: snapshot.hasData ? snapshot.data : []
        );
      }
    );
  }

  // Método que construye el inifinite scroll
  Widget _infiniteScrollBuilder(context) {
    // Llamando al provider para descargar las películas aclamadas por la crítica
    moviesProvider.getTopRated();
    // Retornando widget
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0
            ),
            child: Text(
              'Aclamadas por la crítica',
              style: Theme.of(context).textTheme.headline6
            )
          ),
          StreamBuilder(
            /**
             * StreamBuilder funciona como un FutureBuilder, pero en lugar de
             * solicitar un 'future:', solicita un 'stream:'
             */
            stream: moviesProvider.topRatedStream,
            builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              return CardsHorizontal(
                movies: snapshot.hasData ? snapshot.data : [],
                getNextPage: moviesProvider.getTopRated,
              );
            }
          )
        ]
      )
    );
  }
}