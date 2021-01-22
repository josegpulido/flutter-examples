
abstract class Vehiculo {

  // Propiedades y métodos que podrá extender a otras clases
  String marca;
  bool diesel;

  void arrancar() {
    print('Arrancando');
  }

}

class Camion extends Vehiculo {

  int remolques;

}

class Camioneta extends Vehiculo {

  int cabinas;

}

