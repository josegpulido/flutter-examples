
// Clase abstracta padre

abstract class Animal {
  int edad;
}

// Clases intermedias que heredan de la clase Animal (no instanciables)

abstract class Mamifero extends Animal {
  void gestar() => print('Puedo gestar en mi vientre!');
}

abstract class Ave extends Animal {
  void empollar() => print('Puedo empollar un huevo!');
}

abstract class Pez extends Animal {
  void fecundar() => print('Puedo poner muchos huevos!');
}

// Clases intermedias extras (no instanciables)

abstract class Volador {
  void volar() => print('Volando...');
}

abstract class Caminante {
  void caminar() => print('Caminando...');
}

abstract class Nadador {
  void nadar() => print('Nadando...');
}

// Clases instanciables (with es la forma de usar mixins)

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Mamifero with Caminante, Volador {}

class Pato extends Ave with Caminante {}

class Tiburon extends Pez with Nadador {}

/*
void main() {

  final pato = Pato();
  pato.caminar();
  pato.edad = 5;
  pato.empollar();

  final murcielago = Murcielago();
  murcielago.edad = 3;
  murcielago.volar();
  murcielago.gestar();

}
*/
