// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:cuintle_app/components/horizontal-carousel.widget.dart';

class HeaderAppbar extends StatelessWidget {

  // Variables
  final String photoUrl;
  final List<String> places;

  // Constructor del Main Widget
  HeaderAppbar({
    @required this.photoUrl,
    @required this.places
  });

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // User Photo Widget
    final Container userPhotoWidget = Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: Colors.white,
          width: 1.5
        )
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(photoUrl)
      )
    );

    // Title Widget
    final Container titleWidget = Container(
      margin: EdgeInsets.only(
        left: 14.0
      ),
      child: Text(
        'Para tí',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat'
        )
      )
    );

    // Widget
    final Stack widget = Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250.0,
          color: Color(0xFF4939c7),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 25.0,
            right: 25.0,
            top: 56.0
          ),
          child: Row(
            children: [
              userPhotoWidget,
              titleWidget
            ]
          )
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 100.0
          ),
          child: HorizontalCarousel(places)
        )
      ]
    );

    // Return
    return widget;
  }
}