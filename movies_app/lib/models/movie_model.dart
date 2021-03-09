/* Interface generada por la extensión Paste JSON as Code.
 *
 * Solo hay que tener copiado en el portapapeles un objeto JSON completo,
 * luego abrir el Command Palette (cmnd + alt + P) y buscar Paste JSON as Code.
 * Preguntará el nombre de la clase top-level y al dar Enter creará la interface.
 */

class Movies {
  
  // Variables
  List<Movie> items = List();

  /* Named-constructor para construir una lista de modelos Movie en base a una
   * lista de objetos JSON.
   */
  Movies.fromJsonList(List<dynamic> jsonList) {
    // Validando poder recorrer el bucle for
    if (jsonList == null) {
      return;
    }
    for (var json in jsonList) {
     final item = Movie.fromJsonMap(json);
     items.add(item);
    }
  }
}

class Movie {

  // Variables
  String posterPath;
  bool adult;
  String overview;
  String releaseDate;
  List<int> genreIds;
  int id;
  String originalTitle;
  String originalLanguage;
  String title;
  String backdropPath;
  double popularity;
  int voteCount;
  bool video;
  double voteAverage;

  // Constructor
  Movie({
    this.posterPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.id,
    this.originalTitle,
    this.originalLanguage,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.video,
    this.voteAverage,
  });

  // Named-constructor para construir un modelo Movie en base a un objeto JSON
  Movie.fromJsonMap(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    genreIds = json['genre_ids'].cast<int>(); // <-- Truco para obligar a castear a int
    id = json['id'];
    originalTitle = json['original_title'];
    originalLanguage = json['original_language'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    popularity = json['popularity'].cast<double>();  // <-- Truco para obligar a castear a double
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1; // <-- Truco para obligar a castear a double
  }

  // Método para completar el url del póster de la película
  String getPosterImageUrl() {
    if (posterPath == null) {
      return 'https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png';
    }
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  // Método para completar el url del backdrop de la película
  String getBackdropImageUrl() {
    if (backdropPath == null) {
      return 'https://westsiderc.org/wp-content/uploads/2019/08/Image-Not-Available.png';
    }
    return 'https://image.tmdb.org/t/p/w500$backdropPath';
  }
}
