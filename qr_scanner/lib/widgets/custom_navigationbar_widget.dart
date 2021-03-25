// Required imports
import 'package:flutter/material.dart';
// Providers
import 'package:provider/provider.dart';
// Notifiers
import 'package:qr_scanner/notifiers/bottom_navigation_notifier.dart';

class CustomNavigationBar extends StatelessWidget {

  // Items
  final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.map,
      'label': 'Mapas'
    },
    {
      'icon': Icons.link_outlined,
      'label': 'Enlaces'
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
     * Recuperando el estado actual del index seleccionado apenas CustomNavigationBar
     * comience a renderizarse.
     * 
     * En teoría, BottomNavigationBar actualiza el estado de BottomNavigationNotifier,
     * y main.dart escucha los cambios de BottomNavigationNotifier para entonces renderizar
     * a HomePage de nuevo.
     * 
     * Aquí se usa listen: true porque sí se requiere que se redibuje el Widget
     * cuando el estado cambie.
     */
    final BottomNavigationNotifier bottomNavigationNotifier = Provider.of<BottomNavigationNotifier>(context);

    return BottomNavigationBar(
      currentIndex: bottomNavigationNotifier.selectedIndex,
      elevation: 0,
      items: items.map((Map<String, dynamic> item) {
        return BottomNavigationBarItem(
          icon: Icon(item['icon']),
          label: item['label']
        );
      }).toList(),
      onTap: (int index) {
        /**
         * Actualizar el estado de BottomNavigationNotifier solo cuando se haya seleccionado
         * un index distinto, y así evitar renderizar el mismo contenido al hacer
         * onTap sobre la página que actualmente se está viendo.
         */
        if (index != bottomNavigationNotifier.selectedIndex) {
          bottomNavigationNotifier.selectedIndex = index;
        }
      }
    );
  }
}