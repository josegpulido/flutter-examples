// Required imports
import 'package:flutter/material.dart';
// Utilities
import 'package:cuintle_app/entities/places/ui/widgets/stars-generator.dart';

class Review extends StatelessWidget {

  // Variables
  final String photoUrl;
  final String displayName;
  final String timestamp;
  final String description;
  final int score;

  // Constructor del Main Widget
  Review(this.photoUrl, this.displayName, this.timestamp, this.description, this.score);

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // User Photo Widget
    final Container userPhotoWidget = Container(
      width: 62.0,
      height: 62.0,
      child: CircleAvatar(
        backgroundImage: AssetImage(photoUrl)
      )
    );

    // User Details Widget
    final Container userDetailsWidget = Container(
      margin: EdgeInsets.only(
        left: 15.0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          SizedBox(
            width: 230.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Text(
                  displayName,
                  style: TextStyle(
                      color: Color(0xFF212121),
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito Sans'
                  )
                ),
                Row(
                  children: StarsBuilder(score, 15.0).build()
                )
              ]
            )
          ),
          Text(
            timestamp,
            style: TextStyle(
              color: Color(0xFF212121),
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
              fontFamily: 'Nunito Sans'
            )
          ),
          SizedBox(
            width: 230.0,
            child: Container(
              margin: EdgeInsets.only(
                top: 8.0
              ),
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 17.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Nunito Sans'
                )
              )
            )
          )
        ],
      )
    );

    // Widget
    final Container widget = Container(
      decoration: BoxDecoration(
        color: Color(0xFFededed),
        borderRadius: BorderRadius.circular(12.0)
      ),
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 5.0
      ),
      padding: EdgeInsets.only(
        left: 13.0,
        top: 15.0,
        right: 13.0,
        bottom: 15.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          userPhotoWidget,
          userDetailsWidget
        ]
      )
    );

    // Return
    return widget;
  }
}

// children: StarsGenerator(score, 15.0).build(),