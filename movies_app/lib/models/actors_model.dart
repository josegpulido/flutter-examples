
class Cast {
  
  // Variables
  List<Actor> items = List();

  /**
   * Named-constructor para construir una lista de modelos Actor (Cast)
   * en base a una lista de objetos JSON.
   */
  Cast.fromJsonList(List<dynamic> jsonList) {
    // Validando poder recorrer el bucle for
    if (jsonList == null) {
      return;
    }
    for (var json in jsonList) {
      final item = Actor.fromJsonMap(json);
      items.add(item);
    }
  }
}

class Actor {
  
  // Variables
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  // Constructor
  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath
  });

  // Named-constructor para construir un modelo Movie en base a un objeto JSON
  Actor.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
  }

  // Método para completar el url de la foto del actor
  String getProfileImageUrl() {
    if (profilePath == null) {
      return 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fkgm.rw%2Fwp-content%2Fuploads%2F2015%2F11%2Fnoprofile.png&f=1&nofb=1';
    }
    return 'https://image.tmdb.org/t/p/w500$profilePath';
  }
}