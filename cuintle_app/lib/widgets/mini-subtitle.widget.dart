// Required imports
import 'package:flutter/material.dart';

class MiniSubtitle extends StatelessWidget {

  // Variables
  final String text;

  // Constructor del Main Widget
  MiniSubtitle(this.text);

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Return
    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color(0xFF919191),
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Nunito Sans'
      )
    );
  }
}