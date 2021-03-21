// Required imports
import 'package:flutter/material.dart';

/*
 * En este ejemplo, se utilizan los themes .light() y .dark(), pero también
 * es una buena opción utilizar un propio ThemeData directamente y jugar
 * con las propiedades de distinta forma.
 */

// Light theme
final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.orangeAccent,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.orangeAccent
  ),
  brightness: Brightness.light
);

// Dark theme
final ThemeData darkTheme = ThemeData.dark().copyWith(
  accentColor: Colors.teal,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.teal
  ),
  brightness: Brightness.dark
);