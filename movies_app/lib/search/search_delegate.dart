// Required imports
import 'package:flutter/material.dart';
// Providers
import 'package:movies_app/providers/movies_provider.dart';
// Models
import 'package:movies_app/models/movie_model.dart';
// Widgets
import 'package:movies_app/widgets/circular_loader_widget.dart';

class DataSearch extends SearchDelegate {

  // Variables
  final MoviesProvider moviesProvider = MoviesProvider();

  /**
   * Construye el List<Widget> de las acciones del buscador. Estos Widgets
   * aparecen en forma ordenada de derecha a izquierda, ubicados al final
   * del AppBar que hacer de buscador.
   */
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          /**
           * 'query' es una variable interna del SearchDelegate, y con la siguiente
           * sentencia se limpia el query, lo que termina limpiando el buscador.
           */
          query = '';
        }
      )
    ];
  }
  
  /**
   * Construye el Widget del icono de la izquierda del AppBar, justo al inicio.
   * Se recomienda que este Widget sirva para cerrar el buscador.
   */
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        /**
         * 'progress' es el tiempo en que la animación del icono se desarrollará.
         * La misma clase SearchDelegate provee de un objeto compatible que
         * hace de transición, que es la siguiente:
         */
        progress: transitionAnimation
      ),
      onPressed: () {
        /**
         * 'close' es un método provisto por SearchDelegate que sirve para 
         * cerrar el buscador. Requiere el contexto y el valor a retornar a
         * modo de resultados de la búsqueda.
         */
        close(context, null);
      }
    );
  }
  
  /**
   * Construye el Widget del resultado a mostrar. Este Widget solo se llama
   * con el método showResults(context), provisto por SearchDelegate.
   */
  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        width: 100.0,
        height: 100.0,
        color: Colors.grey,
        child: Text("Hey there, I'm a result!"),
      )
    );
  }
  
  // Construye el Widget de la sugerencias que aparecen cuando se escribe en el buscador
  @override
  Widget buildSuggestions(BuildContext context) {
    // Validando no construir el Widget de sugerencias al tener un query en blanco
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder(
      future: moviesProvider.getQueriedMovies(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularLoader()
          );
        }
        return ListView(
          children: snapshot.data.map((Movie movie) {
            return InkWell(
              child: _buildCustomListTile(context, movie),
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
              },
            );
          }).toList()
        );
      }
    );
  }

  // Método 
  Widget _buildCustomListTile(BuildContext context, Movie movie) {

    /* MediaQuery es una clase que otorga información sobre la densidad de la
     * pantalla de forma dinámica y actualizada (ancho, alto, modo de pantalla, etc).
     */
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(7.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage(movie.getPosterImageUrl()),
              width: 50.0,
              height: 80.0,
              fit: BoxFit.cover,
            )
          ),
          SizedBox(
            width: 13.0
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width* 0.75, // <-- 90% del espacio disponible
                child: Text(
                  movie.title,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis
                )
              ),
              SizedBox(
                height: 4.0
              ),
              Text('${movie.releaseDate} · ${movie.originalLanguage.toUpperCase()}')
            ]
          )
        ]
      )
    );
  }
  
}