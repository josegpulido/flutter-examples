// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:cuintle_app/components/description.widget.dart';
import 'package:cuintle_app/components/review.widget.dart';
import 'package:cuintle_app/components/mini-subtitle.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Return
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
        body: Container(
          margin: EdgeInsets.only(
            left: 26.0,
            right: 26.0
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 300.0
                ),
                child: DescriptionPlace(
                  'San Cristóbal de las Casas',
                  'Es una de las ciudades más románticas del mundo, reconocida como Pueblo'
                      'Mágico. Ciudad cuya riqueza radica en su diversidad étnica y tradición'
                      'colonial, que muestra...',
                  4
                )
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20.0
                ),
                child: Row(
                  children: [
                    MiniSubtitle('Reseñas')
                  ]
                )
              ),
              Review(
                  'https://lh3.googleusercontent.com/ogw/ADGmqu8Hb4ACV7Fz206-PHtYP3s5xTUJBFBw8gpkfcdYKg=s192-c-mo',
                  'José Guillermo',
                  '10 Ene. 2021',
                  'Maravillosa la vista en la reserva del Arcotete.',
                  2
              ),

            ],
          ),
        )
      )
    );
  }
}