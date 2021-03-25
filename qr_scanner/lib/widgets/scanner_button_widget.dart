// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// Providers
import 'package:provider/provider.dart';
// Notifiers
import 'package:qr_scanner/notifiers/scan_records_notifier.dart';

class ScannerButton extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.qr_code_scanner_outlined),
      onPressed: () async {

        // Abriendo el lector de códigos QR y recuperando el resultado generado
        final String result = await FlutterBarcodeScanner.scanBarcode('#c2c2c2', 'Cancelar', false, ScanMode.QR);

        /**
         * Identificar si el lector se abortó o sí contiene un valor válido para
         * procesar, ya que .scanBarcode() retorna un -1 si el se canceló la
         * operación.
         */
        if (result != '-1') {

          /**
           * Recuperando el estado de ScanRecordsNotifier para usar sus métodos
           * únicamente.
           * 
           * listen: false obtiene solo la instancia del notifier, pero se desuscribe
           * a escuchar los cambios en sus valores, evitando así disparar un nuevo
           * WidgetState innecesariamente.
           */
          final ScanRecordsNotifier scanRecordsNotifier = Provider.of<ScanRecordsNotifier>(context, listen: false);

          /**
           * Insertar nueva lectura en la base de datos y notificar a los
           * dependientes que necesiten renderizarse.
           */
          scanRecordsNotifier.insertScan(result);

        }
      }
    );
  }
}