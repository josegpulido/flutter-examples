// Required imports
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Routes
import 'package:firstapp/src/routes/routes.dart';
// Widgets
import 'package:firstapp/src/pages/dialog_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  // Widget builder
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes Material',
      debugShowCheckedModeBanner: false, // <-- Borra el label 'debug' del appBar
      // 'initialRoute' define la ruta inicial de la app
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
          builder: (BuildContext context) => DialogPage()
        );
      },
      /* 'localizationsDelegates' y 'supportedLocales' forman parte de la
       * configuración para la internacionalización de los Widgets.
       */
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES')
      ]
    );
  }
}