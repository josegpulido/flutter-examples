
// Clase abstracta
abstract class Animal {

  // Propiedades obligatorias
  int patas;

  // Método obligatorio (solo inicializado, mas no hace nada)
  void sonido();

}

class Perro implements Animal {

  /* Se pueden sobreescribir las 'reglas'. Animal obliga a Perro a
   * tener las mismas propiedades y métodos.
   */

  @override
  int patas;

  @override
  void sonido() {
    print('Guau');
  }

}

class Gato implements Animal {

  /* O simplemente implementarlas. Animal obliga a Gato a
   * tener las mismas propiedades y métodos.
   */

  int patas;

  void sonido() {
    print('Miaw');
  }

}
