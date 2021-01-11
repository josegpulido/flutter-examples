// Required imports
import 'package:flutter/material.dart';
// Utilities
import 'package:cuintle_app/utilities/stars-generator.dart';

class DescriptionPlace extends StatelessWidget {

  // Variables
  final String title;
  final String description;
  final int score;

  // Constructor del Main Widget
  DescriptionPlace(this.title, this.description, this.score);

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Title Widget
    final Container titleWidget = Container(
      width: 210.0,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xFF212121),
          fontSize: 29.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat'
        )
      )
    );

    // Stars Widget
    final Container starsWidget = Container(
      child: Row(
        children: StarsGenerator(score).build()
      )
    );

    // Description Widget
    final Container descriptionWidget = Container(
      margin: EdgeInsets.only(
        top: 20.0
      ),
      child: Text(
        description,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color(0xFF212121),
            fontSize: 17.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Nunito Sans'
        )
      )
    );

    // Widget
    final Column widget = Column(
      children: [
        Row(
          children: <Widget> [
            titleWidget,
            starsWidget
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        descriptionWidget
      ]
    );

    // Return
    return widget;
  }
}