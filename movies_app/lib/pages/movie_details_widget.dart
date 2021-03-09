// Required imports
import 'package:flutter/material.dart';
// Interfaces
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/actors_model.dart';
// Providers
import 'package:movies_app/providers/movies_provider.dart';
// Widgets
import 'package:movies_app/widgets/cast_swiper_widget.dart';

class MovieDetailsPage extends StatelessWidget {

  // Variables
  final MoviesProvider moviesProvider = MoviesProvider();
  Movie movie;

  // Widget builder
  @override
  Widget build(BuildContext context) {

    // Cachando argumentos pasados a la ruta de este Widget
    movie = ModalRoute.of(context).settings.arguments;

    // Retornando widget
    return Scaffold(
      body: SafeArea(
        /**
         * CustomScrollView crea un ScrollView al que se le pueden personalizar
         * los efectos.
         */
        child: CustomScrollView(
          slivers: [
            _createAppBar(),
            _createList(context),
            _createCastScrollable(movie.id.toString())
          ]
        )
      )
    );
  }

  // Método para construir el AppBar
  Widget _createAppBar() {
    // SliverAppBar es un AppBar compatible con un CustomScrollView
    return SliverAppBar(
      elevation: 2.0,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 19.0
          ),
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis
          )
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: NetworkImage(movie.getBackdropImageUrl()),
          fit: BoxFit.cover
        )
      )
    );
  }

  // Método para construir el list
  Widget _createList(BuildContext context) {
    // SliverList es un AppBar compatible con un CustomScrollView
    return SliverList(
      delegate: SliverChildListDelegate([
        _createMoviePresentationCard(context),
        _createMovieSinopsis(context)
      ])
    );
  }

  // Método para construir la carta de presentación de la película
  Widget _createMoviePresentationCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFe6e6e6),
        borderRadius: BorderRadius.circular(11.0)
      ),
      margin: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 35.0
      ),
      padding: EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              height: 100.0,
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage(movie.getPosterImageUrl()),
              fit: BoxFit.cover
            )
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 145.0,
                  child: Text(
                    movie.title,
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis
                  )
                ),
                SizedBox(height: 3.5),
                Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      size: 15.5,
                    ),
                    SizedBox(width: 5.0),
                    Text(movie.voteAverage.toString())
                  ]
                ),
                SizedBox(height: 5.0),
                Text(
                  '${movie.releaseDate} · ${movie.originalLanguage.toUpperCase()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Color(0xFF6e6e6e)
                  )
                )
              ]
            )
          )
        ]
      )
    );
  }

  // Método para construir el texto de los detalles de la película
  Widget _createMovieSinopsis(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sinopsis',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 15.0),
          Text(
            movie.overview,
            style: TextStyle(
              fontSize: 16,
              height: 1.3
            )
          )
        ]
      )
    );
  }

  // Método para construir el scrollable del cast de la película
  Widget _createCastScrollable(String movieId) {
    return FutureBuilder(
      future: moviesProvider.getCast(movieId),
      builder: (BuildContext context, AsyncSnapshot<List<Actor>> snapshot) {
        /**
         * En este caso, el Widget CustomScrollView solo admite Widgets
         * de tipo Sliver. El Widget CastSwiper está hecho de tal manera que
         * pueda ser reconocido como un Sliver.
         */
        return SliverCastSwiper(
          actors: snapshot.hasData ? snapshot.data : []
        );
      }
    );
  }
}