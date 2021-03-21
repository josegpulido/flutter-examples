// Required imports
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {

  /* 
   * Esta clase trata de imitar una arquitectura Singleton, y simplemente
   * alberga una propiedad privada que se puede modificar a través de
   * getters y setters.
   * 
   * La clase extiende de ChangeNotifier, lo cual le permite llamar a notifyListeners(),
   * función que informará a ChangeNotifierProvider (ubicado en main.dart) que
   * un cambio sucedió.
   */

  int _selectedNavigationIndex = 0;

  int get selectedNavigationIndex => this._selectedNavigationIndex;

  set selectedNavigationIndex(int i) {
    this._selectedNavigationIndex = i;
    // Notificando a los dependientes que la propiedad privada cambió
    notifyListeners();
  }
}