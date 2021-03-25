// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:qr_scanner/widgets/custom_navigationbar_widget.dart';
import 'package:qr_scanner/widgets/scanner_button_widget.dart';
// Pages
import 'package:qr_scanner/pages/maps_page.dart';
import 'package:qr_scanner/pages/links_page.dart';
import 'package:qr_scanner/pages/settings_page.dart';
// Providers
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/preferences_provider.dart';
// Notifiers
import 'package:qr_scanner/notifiers/bottom_navigation_notifier.dart';
import 'package:qr_scanner/notifiers/scan_records_notifier.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /**
     * Recuperando el estado de BottomNavigationBar (el cual es actualizado por el
     * evento onTap de CustomNavigationBar) para colocar el título de la página
     * en el AppBar según el index actual.
     */
    final BottomNavigationNotifier bottomNavigationNotifier = Provider.of<BottomNavigationNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(bottomNavigationNotifier.selectedIndex == 2 ? 'Configuración' : 'Historial'),
        actions: bottomNavigationNotifier.selectedIndex != 2 ? [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {

              /**
               * Recuperando el estado de ScanRecordsNotifier para usar sus métodos
               * únicamente.
               * 
               * listen: false obtiene solo la instancia del notifier, pero se desuscribe
               * a escuchar los cambios en sus valores, evitando así disparar un nuevo
               * WidgetState innecesariamente.
               */
              Provider.of<ScanRecordsNotifier>(context, listen: false).removeAllScans();

            }
          )
        ] : []
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScannerButton(),
      /** 
       * La siguiente propiedad sirve para posicionar al floatingActionButton
       * en distintos puntos en específico de la vista.
       */
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat
    );
  }
}

class _HomePageBody extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    /**
     * Recuperando el estado de BottomNavigationBar (el cual es actualizado por el
     * evento onTap de CustomNavigationBar) y renderizar una página en específico
     * según lo que el index que BottomNavigationNotifier indique.
     * 
     * ScanRecordsNotifier actualizará su estado en pro de contener o a los registros
     * de Mapas, o a los registros de Enlaces.
     * 
     * De forma simple:
     * >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
     * Al tocar una opción del BottomNavigationBar, entonces bottomNavigationNotifier
     * renderiza el Widget correspondiente, y scanRecordsNotifier hace query a
     * la base de datos con el filtro correspondiente.
     * <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
     * 
     * Aquí se usa el listen: false puesto que a pesar de ser un método build,
     * este en realidad es un Widget hijo de HomePage().
     */
    final BottomNavigationNotifier bottomNavigationNotifier = Provider.of<BottomNavigationNotifier>(context, listen: false);
    final ScanRecordsNotifier scanRecordsNotifier = Provider.of<ScanRecordsNotifier>(context, listen: false);

    // Indicador de progreso en caso de hacer query a la BD
    final Widget progressWidget = Center(
      child: CircularProgressIndicator()
    );

    switch (bottomNavigationNotifier.selectedIndex) {
      case 0:
        return FutureBuilder(
          future: scanRecordsNotifier.queryScans(filters: { 'type': 'geo' }),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            return snapshot.connectionState == ConnectionState.done ? MapsPage() : progressWidget;
          }
        );
      case 1:
        return FutureBuilder(
          future: scanRecordsNotifier.queryScans(filters: { 'type': 'link' }),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            return snapshot.connectionState == ConnectionState.done ? LinksPage() : progressWidget;
          }
        );
      case 2:
        return SettingsPage();
      default:
        return MapsPage();
    }

  }
}