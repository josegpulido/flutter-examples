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
        body: Stack(
          children: <Widget> [
            ListView(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: 320.0
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
                        'assets/images/users/image_profile_1.jpg',
                        'Varuna Yasas',
                        '10 Ene. 2021',
                        'Maravillosa la vista en la reserva del Arcotete.',
                        2
                      ),
                      Review(
                        'assets/images/users/image_profile_2.jpg',
                        'Martín Alanis',
                        '3 Ene. 2021',
                        '¡Muy padre muy bonito todo! Volveré para el próximo año.',
                        5
                      )
                    ]
                  )
                )
              ]
            ),
            Container(
              width: double.infinity,
              height: 250.0,
              color: Color(0xFF4939c7)
            )
          ]
        )
      )
    );
  }
}