// Required imports
import 'package:meta/meta.dart' show required; // <-- Funcionalidad @required
// Models
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

/*
 * Modelo hecho con QuickType (app.quicktype.io), el cual permite generar
 * modelos válidos a partir de un JSON en muchos tipos de lenguajes diferentes,
 * como Dart que es el caso.
 */
class QRScan {

  // Variables
  final String value;
  int id;
  String type;

  // Construcuctor
  QRScan({
    this.id,
    @required this.value
  }) {
    // Construyendo el tipo del modelo a partir del valor recibido...
    if (this.value.contains('http')) {
      this.type = 'link';
    } else {
      this.type = 'geo';
    }
  }

  // Named-constructor
  factory QRScan.fromJson(Map<String, dynamic> json) => QRScan(
    id: json['id'],
    value: json['value']
  );

  // Método para construir al modelo a partir de un objeto JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "value": value
  };

  // Método para obtener el LatLng de un modelo tipo geo
  LatLng getLatLng() {
    if (type == 'geo') {
      final List<String> latlng = this.value.substring(4).split(',');
      final double lat = double.parse(latlng[0]);
      final double lng = double.parse(latlng[1]);
      return LatLng(lat, lng);
    } else {
      throw "Solo se puede obtener LatLng de un scan tipo geo.";
    }
  }
}