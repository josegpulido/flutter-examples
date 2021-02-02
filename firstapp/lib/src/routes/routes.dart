// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:firstapp/src/pages/home_page.dart';
import 'package:firstapp/src/pages/dialog_page.dart';
import 'package:firstapp/src/pages/avatar_page.dart';
import 'package:firstapp/src/pages/cards_pages.dart';
import 'package:firstapp/src/pages/animated_container_page.dart';
import 'package:firstapp/src/pages/inputs_page.dart';
import 'package:firstapp/src/pages/slider_page.dart';
import 'package:firstapp/src/pages/list_page.dart';

/* Esto no es más que un método que retorna las rutas para tener
 * más orden en el main.dart y no tener que hardcodearlas directamente.
 */
Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => DialogPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardsPage(),
    'animated_container': (BuildContext context) => MyAnimatedContainer(),
    'inputs': (BuildContext context) => InputsPage(),
    'sliders': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListPage()
  };
}