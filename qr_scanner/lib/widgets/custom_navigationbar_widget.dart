// Required imports
import 'package:flutter/material.dart';
// Providers
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/menu_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  // Items
  final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.map,
      'label': 'Mapa'
    },
    {
      'icon': Icons.compass_calibration_outlined,
      'label': 'Direcciones'
    },
    {
      'icon': Icons.settings_outlined,
      'label': 'Configuración'
    }
  ];

  // Widget builder
  @override
  Widget build(BuildContext context) {

    /**
     * Recuperando el estado actual del index seleccionado al momento de
     * renderizarse el CustomNavigationBar.
     * 
     * En teoría, BottomNavigationBar actualiza el estado de MenuProvider,
     * y main.dart escucha los cambios de MenuProvider para entonces renderizar
     * en contenido de HomePage.
     */
    final MenuProvider menuProvider = Provider.of<MenuProvider>(context);

    return BottomNavigationBar(
      currentIndex: menuProvider.selectedNavigationIndex,
      elevation: 0,
      items: items.map((Map<String, dynamic> item) {
        return BottomNavigationBarItem(
          icon: Icon(item['icon']),
          label: item['label']
        );
      }).toList(),
      onTap: (int index) {
        /**
         * Actualizar el estado de MenuProvider solo cuando se haya seleccionado
         * un index distinto, y así evitar renderizar el mismo contenido al hacer
         * onTap sobre la página que actualmente se está viendo.
         */
        if (index != menuProvider.selectedNavigationIndex) {
          menuProvider.selectedNavigationIndex = index;
        }
      }
    );
  }
}