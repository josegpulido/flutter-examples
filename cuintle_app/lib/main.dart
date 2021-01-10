// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:cuintle_app/components/description.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travels App',
      theme: ThemeData(
        // Theme
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Fonts
        fontFamily: 'Nunito Sans'
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Travels App")
        ),
        body: DescriptionPlace(
          'San Cristóbal de las Casas',
          'Es una de las ciudades más románticas del mundo, reconocida como Pueblo'
          'Mágico. Ciudad cuya riqueza radica en su diversidad étnica y tradición'
          'colonial, que muestra...',
          3
        ),
      )
    );
  }
}