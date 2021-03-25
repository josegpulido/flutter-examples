// Required imports
import 'package:flutter/material.dart';
// Providers
import 'package:qr_scanner/providers/sql_provider.dart';
// Models
import 'package:url_launcher/url_launcher.dart';

// Future que dispara un url en el móvil según el tipo de url que se quiera abrir
Future<void> launchScanViewer(BuildContext context, QRScan scan) async {

  // Verificando que sea un scan tipo link
  if (scan.type == 'link') {
    // Verificando si se puede abrir o no en el launcher el url provisto
    if (await canLaunch(scan.value)) {
      // Lanzando el url
      return launch(scan.value);
    } else {
      throw 'El url ${scan.value} es inválido y no puede abrirse.';
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }

}