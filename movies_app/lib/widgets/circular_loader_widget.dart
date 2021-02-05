// Required imports
import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0
      ),
      child: CircularProgressIndicator(
        strokeWidth: 4.5
      )
    );
  }
}