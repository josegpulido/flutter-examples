// Required imports
import 'dart:async';
import 'package:flutter/material.dart';
// Models
import 'package:qr_scanner/models/qr_scan_model.dart';
// Providers
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Widget
class MapPage extends StatefulWidget {

  // State builder
  @override
  _MapPageState createState() => _MapPageState();
}

// State
class _MapPageState extends State<MapPage> {

  // Variables
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  MapType mapType;

  // Arranque del state
  @override
  void initState() {
    mapType = MapType.normal;
    super.initState();
  }

  // Widget builder
  @override
  Widget build(BuildContext context) {

    // Cachando argumento enviado por .pushedName()
    final QRScan scan = ModalRoute.of(context).settings.arguments;

    // Configurando punto inicial para pasarlo a Google Maps
    final CameraPosition initialGeopoint = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17
    );

    // Configurando marcador del punto inicial en el mapa
    final Set<Marker> markers = Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('my-unique-id'),
      position: scan.getLatLng()
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching_outlined),
            onPressed: () async {
              // Moviendo el mapa a la posición original
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(initialGeopoint));
            }
          )
        ]
      ),
      body: GoogleMap(
        mapType: mapType,
        myLocationButtonEnabled: false,
        initialCameraPosition: initialGeopoint,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers_outlined),
        onPressed: () {
          // Cambiando tipo de mapa
          setState(() {
            if (mapType == MapType.normal) {
              mapType = MapType.satellite;
            } else {
              mapType = MapType.normal;
            }
          });
        }
      ),
    );
  }
}