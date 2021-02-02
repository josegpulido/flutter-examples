// Required imports
import 'package:flutter/services.dart' show rootBundle;
/* Del import anterior, extraer solo rootBundle de todo
 * el package importado.
 */
import 'dart:convert';

// Clase privada
class _MenuProvider {

  // Método que devuelve un Future
  Future<List<dynamic>> readMenuConfigFile() async {
    /* rootBundle proporciona acceso a todos los recursos del package que se
     * especifiquen en la sección de assets del archivo pubspec.yml.
     * 
     * .loadString devuelve un Future que en su primer .then contiene un String
     * de todo lo que leyó en el archivo especificado en el path que pide como
     * primer argumento.
     */
    final String rawJson = await rootBundle.loadString('data/menu_options.json');
    // Conviritendo el json tipo String en un json tipo Map
    Map<dynamic, dynamic> jsonMap = json.decode(rawJson);
    // Extrayendo información del Map
    return jsonMap['routes'];
  }

}

/* Exponiendo a Flutter solo la instancia de la clase y no la clase misma,
 * para evitar permitir hacer más de una instancia de MenuProvider:
 */
final _MenuProvider menuProvider = _MenuProvider();

/* Este proveedor (provider) sirve para leer un json que dentro contiene
 * la configuración de la lista del menú de la aplicación.
 */