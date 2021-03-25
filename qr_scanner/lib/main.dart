// Required imports
import 'package:flutter/material.dart';
// Pages
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/map_page.dart';
// Providers
import 'package:qr_scanner/providers/preferences_provider.dart';
import 'package:provider/provider.dart';
// Notifiers
import 'package:qr_scanner/notifiers/bottom_navigation_notifier.dart';
import 'package:qr_scanner/notifiers/scan_records_notifier.dart';
// Theme
import 'package:qr_scanner/theme.dart';
 
void main() async {

  /**
   * Recuperando las preferencias del usuario antes de iniciar el app. De esta
   * manera, el main al ser un nivel superior que el runApp y no fallar al
   * volverse un sync (puesto que devuelve void) entonces sí puedo llamar al 
   * await y volver a todo el proceso síncrono.
   */ 
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesProvider().initPreferences();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Instanciando provider de preferencias
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
             * ChangeNotifierProvider usa la instancia de BottomNavigationNotifier
             * para escuchar sus cambios. Cuando BottomNavigationNotifier
             * sufre un cambio, ChangeNotifierProvider le informa a MultiProvider
             * que tiene que volver a renderizar al child, manteniendo además el
             * estado de BottomNavigationNotifier intacto.
             */
            ChangeNotifierProvider(
              create: (BuildContext context) => BottomNavigationNotifier()
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) => ScanRecordsNotifier()
            )
          ],
          child: MaterialApp(
            title: 'QR Reader',
            // Definiendo ruta que se muestra por defecto
            initialRoute: 'home',
            // Definiendo rutas
            routes: {
              'home': (BuildContext context) => HomePage(),
              'map': (BuildContext context) => MapPage()
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