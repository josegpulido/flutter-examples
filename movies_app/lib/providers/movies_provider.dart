// Required imports
import 'dart:convert';
import 'package:http/http.dart' as http; // <-- Renombrando el import para hacerlo más comodo de leer
import 'dart:async'; // <-- Utilidades de generar Streams en Dart
// Models
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/actors_model.dart';

class MoviesProvider {

  /**
   * Esta clase tiene métodos que operan como un Future y otros que operan
   * como un StreamController, ambos a modo de usar ambas en un proyecto como
   * parte de arquitecturas de software distintas.
   */

  // Variables
  final String _apiKey = '413e4c6dc917b83d9e29138d906ce4d9';
  final String _apiUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';
  List<Movie> topRatedMovies = [];
  int currentTopRatedPage = 0;
  bool downloadInProgress = false;

  // Future que llama al API y retorna un objeto Response
  Future<Map<String, dynamic>> _requestToApi(String path, [ Map<String, String> params ]) async {
    
    /**
     * Completer es una clase que imita el comportamiento resolve/reject de
     * un Promise. Esta es otra forma de manejar los Futures de forma más
     * precisa.
     */
    final Completer completer = new Completer<Map<String, dynamic>>();

    // Adjuntando parámetros requeridos restantes
    if (params == null) {
      params = new Map<String, String>();
    }
    params['api_key'] = _apiKey;
    params['language'] = _language;

    /* Uri es una clase que permite gestionar interacciones con URLs. Como por
     * ejemplo, interactuar con una API, un URL, etc.
     * 
     * Construyendo el url con Uri. El unencodedPath (el segundo parámetro)
     * es toda aquella ruta que se escribe luego de una url, como por
     * ejemplo /ruta/del/sitio.
     */
    final Uri url = Uri.https(_apiUrl, path, params);

    // Haciendo petición GET al url y almacenando la respuesta en el objeto Response
    final http.Response response = await http.get(url);

    // Parseando el body del objeto Response (strinfified) a un objeto JSON
    final Map<String,dynamic> body = json.decode(response.body);

    // Retornando Response del Future GET
    completer.complete(body);
    return completer.future;
  }

  // ===========================================================================
  // Descargar las películas actualmente en cines a modo de Future =============
  // ===========================================================================
  Future<List<Movie>> getNowPlaying() async {
    /**
     * Haciendo petición GET y casteando la lista de peliculas al modelo Movies,
     * que es una lista de modelos Movie.
     */
    final Map<String, dynamic> body = await _requestToApi('3/movie/now_playing');
    final Movies movies = Movies.fromJsonList(body['results']);
    // Retornando una lista de películas (modelo Movies)
    return movies.items;
  }

  // ===========================================================================
  // Descargar las películas aclamadas por la crítica a través de un ===========
  // StreamController ==========================================================
  // ===========================================================================
  void getTopRated() async {
    // Validando que se llame el método una a la vez y que no se pase del 7 páginas (140 items)
    if (!downloadInProgress && currentTopRatedPage <= 6) {
      downloadInProgress = true;
      currentTopRatedPage++;
      /**
       * Haciendo petición GET y casteando la lista de peliculas al modelo Movies,
       * que es una lista de modelos Movie.
       */
      final Map<String, dynamic> body = await _requestToApi('3/movie/top_rated', {
        'page': currentTopRatedPage.toString()
      });
      final Movies movies = Movies.fromJsonList(body['results']);
      // Guardando los resultados y uniendolos a la lista existente
      topRatedMovies = List.from(topRatedMovies)..addAll(movies.items);
      /**
       * Enviando información por la tubería para que todos los dependientes la
       * escuchen (haciendo Sink).
       */
      topRatedSink(topRatedMovies);
      downloadInProgress = false;
    }
  }

  /**
   * Definiendo StreamController, que viene a ser la tubería por donde
   * nueva información es difundida a sus dependientes o escuchas.
   */
  final _topRatedStreamController = StreamController<List<Movie>>.broadcast();

  /** 
   * Definiendo método getter para ayudar al tipado al llamar al StreamController
   * y además volver más corta la sentencia para llamár al StreamController.
   * 
   * Sink inserta información al StreamController.
   */
  Function(List<Movie>) get topRatedSink {
    return _topRatedStreamController.sink.add;
  }

  /** 
   * Definiendo método getter para ayudar al tipado al llamar al StreamController
   * y además volver más corta la sentencia para llamár al StreamController.
   * 
   * Stream escucha información del StreamController.
   */
  Stream<List<Movie>> get topRatedStream {
    return _topRatedStreamController.stream;
  }

  // Función para destruir todos los listeners del StreamController
  void disposeStreamController() {
    /**
     * El operador ? es simplemente como un if (controller) { controller.close() }
     * 
     * Destruyendo el controlador:
     */
    _topRatedStreamController?.close();
    // Reseteando variables globales del provider que gestiona las topRatedMovies
    topRatedMovies = [];
    currentTopRatedPage = 1;
  }

  // ===========================================================================
  // Descargar el cast de una pelicula en específico a modo de Future ==========
  // ===========================================================================
  Future<List<Actor>> getCast(String movieId) async {
    /**
     * Haciendo petición GET y casteando la lista de actores al modelo Cast,
     * que es una lista de modelos Actor.
     */
    final Map<String, dynamic> body = await _requestToApi('3/movie/${movieId}/credits');
    final Cast cast = Cast.fromJsonList(body['cast']);

    // Retornando una lista de actores (modelo Cast)
    return cast.items;
  }

  // ===========================================================================
  // Descargar las películas actualmente en cines a modo de Future =============
  // ===========================================================================
  Future<List<Movie>> getQueriedMovies(String query) async {
    /**
     * Haciendo petición GET y casteando la lista de peliculas al modelo Movies,
     * que es una lista de modelos Movie.
     */
    final Map<String, dynamic> body = await _requestToApi('3/search/movie', {
      'query': query
    });
    final Movies movies = Movies.fromJsonList(body['results']);
    // Retornando una lista de películas (modelo Movies)
    return movies.items;
  }
}