import 'package:flutter/material.dart';
import 'heroe.dart';
import 'vehiculo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // Tipos de variables básicos
  int entero = 4;
  double decimales = 3.1416;
  String texto = 'Hola, mundo.';
  String textoMultilinea = '''Texto
  multilinea''';
  bool booleano = false;

  // Listas
  List lista = [1, true, 3, 'adiós']; // <-- Lista no tipada, Dart puede inferir el tipo de dato
  List<int> listaTipada = [21, 28, 89]; // <-- Lista tipada
  List<int> listaTipadaConLimite = List(10); // <-- Lista con límite de items
  List<List<int>> listaDeListas = [];
  /* List es una clase que le otorga métodos
   * a la lista (.first, .add(), etc).
   */

  // Maps
  Map objeto = { // Objeto no tipado, Dart puede inferir el tipo de dato
    'nombre': 'valor',
    'número': 9,
    'booleano': false,
    21: true
  };
  Map<String, bool> objetoTipado = { // Objeto tipado
    'valor1': false,
    'valor2': true
  };
  Map<String, dynamic> objetoTipadoDinamico = { // Objeto tipado dinamico
    'valor1': 9.1,
    'valor2': [100, 9, 30],
    'valor3': () {
      // Función que retorna un texto, almacenada dentro de un Map
      return 'Hola, Mundo.';
    }
  };

  // Funciones
  void saludar() {
    // Función que regresa null (no retorna nada)
    print('¡Hola!');
  }
  int sumarUno(int numero) {
    // Función que regresa +1 al número pasado como parámetro
    return numero + 1;
  }
  String dormir({bool ahora}) {
    /* Función que regresa un texto según el parámetro 'ahora', además de
     * solicitar especificar el nombre del parámetro
     * al momento de llamar la función.
     */
    return ahora == true ? 'Durmiendo' : 'Despierto';
  }
  // Función de flecha
  int multiplicar(int num1, int num2) => num1 * num2;

  @override
  Widget build(BuildContext context) {
    // var
    var variable1 = 'Valor original';
    variable1 = 'Nuevo valor';

    // final (valor no mutable y asignado en tiempo de ejecución)
    final variable2 = 'Original';

    // const
    const variable3 = 9;
    const bool verificado = false;

    // dynamic
    dynamic variable4 = true;
    variable4 = 9.3;

    // Maps
    objeto['nombre'];
    objetoTipadoDinamico['valor3'];

    // Funciones
    dormir(ahora: true);

    // Creando instancias de la clase
    var wolverine = Heroe(nombre: 'Logan',
        poder: 'Regeneración'); // 'wolverine' después puede ser un booleano, texto, etcétera
    final ironman = Heroe(nombre: 'Tony',
        poder: 'Dinero'); // 'ironman' siempre será 'Heroe' (aunque sus propiedades sí pueden mutar)
    final scarletwitch = Heroe.convertirJson(
        '{ "nombre": "Wanda", "poder": "Magia" }'); // Instanciando pero a través de named-constructor

    // Llamando método de la instancia
    wolverine.presentar();
    ironman.presentar();
    scarletwitch.presentar();

    // Llamando propiedades de la instancia
    wolverine.nombre;
    ironman.poder;

    // Llamando setters y getters de la clase
    /*
    ironman.edad(43);
    ironman.edad;
    */

    // Usando y llamando clases que implementan abstract
    /*
    final spike = Perro();
    final tom = Gato();
    spike.sonido();
    tom.sonido();
    */

    // Control de flujo

    if (decimales > 1) {
      // code
    } else {
      // another code
    }

    for (int i = 0; i < 5; i++) {
      // code
      if (i == 3) {
        // code
        break;
      } else {
        // code
        continue;
      }
    }

    while (decimales < 9) {
      decimales = decimales + 0.5;
    }

    do {
      entero++;
    } while (entero < 10);

    switch (texto) {
      case 'Opcion 1':
      // code
        break;
      default: // antoher code
    }

    try {
      // code
    } on OutOfMemoryError {
      // code on this specifically error
    }catch(e) {
      // code on error
    }

    // Clases con extends
    final chevrolet = Camioneta();
    chevrolet.marca = 'Chevrolet';
    chevrolet.diesel = false;
    final mercedes = Camion();
    mercedes.marca = 'Mercedes Benz';
    mercedes.remolques = 2;
    mercedes.arrancar();


    const String _title = 'Flutter App :)';

    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("José Pulido"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 26
            ),
            tooltip: "Regresar",
          ),
          backgroundColor: Colors.teal,
          titleSpacing: 5
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/do_y_mizu.jpg"),
                  fit: BoxFit.fitWidth
                )
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.black.withOpacity(0.3),
                constraints: BoxConstraints.expand(
                  height: 55
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: const Text(
                    "Do y Mizu ❤️",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22
                    ),
                  ),
                ),
              )
            )
          ]
        )
      )
    );
  }
}
