// Required imports
import 'package:flutter/material.dart' show ChangeNotifier;

class BottomNavigationNotifier extends ChangeNotifier {

  /* 
   * Esta clase trata de imitar una arquitectura Singleton, y simplemente
   * alberga una propiedad privada que se puede modificar a través de
   * getters y setters.
   * 
   * La clase extiende de ChangeNotifier, lo cual le permite llamar a notifyListeners(),
   * función que informará a ChangeNotifierProvider (ubicado en main.dart) que
   * un cambio sucedió.
   */

  // Variables del estado
  int _selectedIndex = 0;

  // Getters y setters de las variables del estado

  int get selectedIndex => this._selectedIndex;

  set selectedIndex(int i) {
    this._selectedIndex = i;
    // Notificando a los dependientes que la propiedad privada cambió
    notifyListeners();
  }
}