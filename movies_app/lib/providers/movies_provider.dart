// Required imports
import 'dart:convert';
import 'package:http/http.dart' as http; // <-- Renombrando el import para hacerlo más comodo de leer
// Models
import 'package:movies_app/models/movie_model.dart';

class MoviesProvider {

  // Variables
  String apiKey = '413e4c6dc917b83d9e29138d906ce4d9';
  final String apiUrl = 'api.themoviedb.org';
  final String language = 'es-ES';

  // Método para descargar las películas actualmente en cines
  Future<List<Movie>> getMoviesRequest(String path) async {
    /* Uri es una clase que permite gestionar interacciones con URLs. Como por
     * ejemplo, interactuar con una API, un URL, etc.
     * 
     * Construyendo el url con Uri. El encodedPath es lo que va luego del apiUrl,
     * mismo que es extraída de la ruta a la que se llama para consumir la API..
     */
    final Uri url = Uri.https(apiUrl, path, {
      'api_key': apiKey,
      'language': language
    });

    // Haciendo un get al url y almacenando la respuesta en el objeto Response
    final http.Response response = await http.get(url);
    // Tomando el body del objeto response y convirtiendolo a un JSON
    final Map<String,dynamic> body = json.decode(response.body);
    /* Extrayendo campo 'results' de todo el contenido contenido en el 'body' de
     * la respuesta, ya que 'results' contiene las lista de películas (Movie model)
     */
    final Movies movies = Movies.fromJsonList(body['results']);
    // Retornando una lista de películas (List<Movie>)
    return movies.items;
  }
}