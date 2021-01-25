// Required imports
import 'package:flutter/material.dart';
// Routes
import 'package:mySecondApp/src/routes/routes.dart';
// Widgets
import 'package:mySecondApp/src/pages/alert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // Widget builder
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes Material',
      debugShowCheckedModeBanner: false, // <-- Borra el label 'debug' del appBar
      initialRoute: '/',
      /* 'routes' es el directorio de rutas de navegación de la aplicación.
       */
      routes: getAppRoutes(),
      /* 'onGeneratedRoute' es un callback que se dispara cuando se viaja a una
       * ruta que no se encuentra definida en 'routes'.
       */
      onGenerateRoute: (RouteSettings settings) {
        /* MaterialPageRoute requiere un builder que dibuje el Widget
         * destinado a ser la página que se muestre dado un destino de navegación.
         */
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      }
    );
  }
}