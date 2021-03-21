// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:qr_scanner/widgets/custom_navigationbar_widget.dart';
import 'package:qr_scanner/widgets/scanner_button_widget.dart';
import 'package:qr_scanner/providers/menu_provider.dart';
// Pages
import 'package:qr_scanner/pages/maps_page.dart';
import 'package:qr_scanner/pages/directions_page.dart';
import 'package:qr_scanner/pages/settings_page.dart';
// Providers
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {}
          )
        ]
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
     * Obtener el estado del BottomNavigationBar (el cual es actualizado por el
     * evento onTap de CustomNavigationBar) y colocar el index que MenuProvider
     * indique.
     * 
     * Si menuProvider se instanciara desde dentro de una función cualquiera (como
     * por ejemplo, onTap), entonces hay que hacer:
     * ...<MenuProvider>(context, listen: false);
     * Lo cual evitará que dicha función padre se vuelva a renderizar, solventando
     * errores de implementación de este sistema de estados.
     */
    final MenuProvider menuProvider = Provider.of<MenuProvider>(context);
    
    switch (menuProvider.selectedNavigationIndex) {
      case 0:
        return MapsPage();
      case 1:
        return DirectionsPage();
      case 2:
        return SettingsPage();
      default:
        return MapsPage();
    }

  }
}