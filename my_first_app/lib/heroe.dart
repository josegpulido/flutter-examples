// Imports
import 'package:flutter/foundation.dart'; // <-- Funciones del lenguaje
import 'dart:convert';

// Clase
class Heroe {

  // Propiedades públicas de clase
  String nombre;
  String poder;

  // Propiedades privadas de la clase (solo visible dentro de Heroe)
  int _edad;

  // Constructor (aquel que jala los argumentos de la instancia hacia la clase)
  Heroe(
  /* Argumentos con nombre (name arguments),
   * además de solicitar obligatoriamente el argumento 'poder':
   */
    {
      this.nombre,
      @required this.poder
    }
  );

  // Método de clase
  String presentar() {
    return 'Soy $nombre, y tengo $poder';
  }

  // Constructor con nombre (named-constructor)
  Heroe.convertirJson(rawJson) {
    // Utilizando .decode (método del paquete json) para extraer un raw-json
    final Map<dynamic, dynamic> parsedJson = json.decode(rawJson);
    nombre = parsedJson['nombre'];
    poder = parsedJson['poder'];
  }

  // Setters
  set edad(int valor) {
    // Validación antes de asignar un valor externo a la propiedad privada '_edad'
    if (valor < 18) {
      throw('La edad no puede ser menor a 18.');
    }
    _edad = valor;
  }

  // Getters
  get edad {
    // Validación antes de obtener valor almacenado en _edad
    if (_edad == null) {
      throw('Edad aún no ha sido asignada.');
    }
    return _edad;
  }
}