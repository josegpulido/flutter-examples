// Required imports
import 'package:flutter/material.dart';
// Pages
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/map_page.dart';
import 'package:qr_scanner/pages/settings_page.dart';
// Providers
import 'package:qr_scanner/providers/preferences_provider.dart';
import 'package:qr_scanner/providers/menu_provider.dart';
import 'package:provider/provider.dart';
// Theme
import 'package:qr_scanner/theme.dart';
 
void main() async {

  // Inicializando provider de preferencias del usuario
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesProvider().initPreferences();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Providers
  final PreferencesProvider preferences = PreferencesProvider();

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: preferences.themeStream,
      builder: (_, AsyncSnapshot<bool> snapshot) {
        /**
         * MultiProvider es una utilidad del provider "provider" que renderiza
         * al child (o al builder, depende de cual quiera usarse) cada que existe
         * actividad en alguno de los múltiples providers que se le pueden
         * adjuntar.
         */
        return MultiProvider(
          providers: [
            /**
             * ChangeNotifierProvider crea una instancia de MenuProvider, el cual
             * tiene que extender de ChangeNotifier forzosamente. Cuando MenuProvider
             * sufre un cambio, ChangeNotifierProvider le informa a MultiProvider
             * que tiene que volver a renderizar al child, además manteniendo el
             * estado de MenuProvider intacto.
             */
            ChangeNotifierProvider(
              create: (BuildContext context) => new MenuProvider()
            )
          ],
          child: MaterialApp(
            title: 'QR Reader',
            // Definiendo ruta que se muestra por defecto
            initialRoute: 'home',
            // Definiendo rutas
            routes: {
              'home': (BuildContext context) => HomePage(),
              'map': (BuildContext context) => MapPage(),
              'settings': (BuildContext context) => SettingsPage()
            },
            /** 
             * Theme light y dark dinámico manejado por preferencias
             * del usuario. Si cuando se dispare el builder no se ha interactuado
             * aún con la interfaz de Configuración (snapshot.hasData), entonces
             * utilizar el theme configurado en el SharedPreferences.
             */
            theme: snapshot.hasData ? (snapshot.data ? darkTheme : lightTheme) : preferences.theme == 'dark' ? darkTheme : lightTheme
          ),
        );
      }
    );
  }
}

/**
 * Novedades del ejercicio:
 * - Shared Preferences para cambiar el theme de la aplicación a modo oscuro
 * - Implementación de BottomNavigationBar con provider de estado
 */