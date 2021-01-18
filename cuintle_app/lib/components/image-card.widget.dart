// Required imports
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {

  // Variables
  final String imageUrl;

  // Constructor
  ImageCard(this.imageUrl);

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Widget
    final Container widget = Container(
      width: 160.0,
      height: 160.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15.0,
            offset: Offset(4.0, 10.0) // <-- offset define la posición de la sombra en 'x' y en 'y'
          )
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl)
        )
      )
    );

    // Return
    return widget;
  }
}