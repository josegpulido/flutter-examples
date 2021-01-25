// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:mySecondApp/src/pages/alert_page.dart';
import 'package:mySecondApp/src/pages/avatar_page.dart';
import 'package:mySecondApp/src/pages/home_page.dart';

/* Esto no es más que un método que retorna las rutas para tener
 * más orden en el main.dart y no tener que hardcodearlas directamente.
 */
Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage()
  };
}