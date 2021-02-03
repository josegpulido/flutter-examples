// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:cuintle_app/entities/places/ui/widgets/description.widget.dart';
import 'package:cuintle_app/entities/places/ui/widgets/review.widget.dart';
import 'package:cuintle_app/widgets/mini-subtitle.widget.dart';
import 'package:cuintle_app/entities/places/ui/widgets/header-appbar.widget.dart';

class HomeView extends StatelessWidget {

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Widget
    final Stack widget = Stack(
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
        HeaderAppbar(
          /* Implementando named params: parámetros requeridos que además
           * están ordenados con nombre.
           */
          photoUrl: 'assets/images/users/image_profile_2.jpg',
          places: [
            'assets/images/places/san_cristobal_de_las_casas.jpg',
            'assets/images/places/atlixco_pueblo_magico.jpg',
            'assets/images/places/cenote_merida.jpg',
            'assets/images/places/playa_del_carmen.jpg'
          ]
        )
      ]
    );

    // Return
    return widget;
  }
}