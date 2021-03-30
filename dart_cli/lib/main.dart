/*
 * Este es el punto de entrada (entry point) de la aplicación. La función
 * main() siempre es la responsable de arrancar todo el programa.
 */

// Required imports
import 'dart:convert';
import 'package:http/http.dart' as http;

main() {
  
  final String url = 'https://reqres.in/api/users?page=2';
  http.get(Uri.parse(url))
  .then((response) {

    final Map<dynamic, dynamic> body = jsonDecode(response.body);

    print(body['data'][0]['first_name']);

  });
}