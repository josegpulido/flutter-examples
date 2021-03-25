// Required imports
import 'package:flutter/material.dart';
// Providers
import 'package:provider/provider.dart';
// Notifiers
import 'package:qr_scanner/notifiers/scan_records_notifier.dart';
// Utils
import 'package:qr_scanner/utils.dart';

class LinksPage extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    
    /**
     * Recuperando el estado de ScanRecordsNotifier para usar sus métodos
     * únicamente.
     * 
     * Aquí se usa listen: true porque sí se requiere que se redibuje el Widget
     * cuando el estado cambie.
     */
    final ScanRecordsNotifier scanRecordsNotifier = Provider.of<ScanRecordsNotifier>(context);

    return scanRecordsNotifier.scans.length > 0 ? ListView.builder(
      itemCount: scanRecordsNotifier.scans.length,
      itemBuilder: (_, int i) {
        /**
         * Dismissible es un Widget que permite ser destruido (dismissible).
         * En un ListView, este comportamiento se refleja en el gesto swipe left
         * para borrar un item.
         */
        return Dismissible(
          // UniqueKey genera un identificador único aleatorio, lo cual es necesario para Dismissible
          key: UniqueKey(),
          // onDismissed escucha la finalización del gesto swipe left
          onDismissed: (DismissDirection direction) {
            // Evaluando solo los swipe left y descartando los swipe right
            if (direction == DismissDirection.endToStart) {
              /**
               * Left-swiped...
               * 
               * Recuperando el estado de ScanRecordsNotifier para usar sus métodos
               * únicamente.
               * 
               * listen: false obtiene solo la instancia del notifier, pero se desuscribe
               * a escuchar los cambios en sus valores, evitando así disparar un nuevo
               * WidgetState innecesariamente.
               */
              Provider.of<ScanRecordsNotifier>(context, listen: false).removeScan(scanRecordsNotifier.scans[i].id);
            } else {
              // Right-swiped...
            }
          },
          background: Container(
            color: Colors.red,
            child: Center(
              child: Text('Borrar')
            )
          ),
          child: ListTile(
            leading: Icon(
              Icons.link_outlined
            ),
            title: Text(scanRecordsNotifier.scans[i].value),
            subtitle: Text('ID: ${scanRecordsNotifier.scans[i].id}'),
            trailing: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.grey
            ),
            onTap: () async {
              await launchScanViewer(context, scanRecordsNotifier.scans[i]);
            }
          ),
        );
      }
    ) : Center(
      child: Text('No hay contenido para mostrar.'),
    );
  }
}