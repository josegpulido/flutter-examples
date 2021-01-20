// Required imports
import 'package:flutter/material.dart';

class ProvTemplateView extends StatelessWidget {

  // Variables
  final String title;

  // Constructor
  ProvTemplateView(this.title);

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Widget
    final Stack widget = Stack(
      fit: StackFit.expand,
      children: [
        Container(
          width: 100.0,
          height: 100.0,
          alignment: Alignment.center,
          child: Text('${title}')
        )
      ]
    );

    // Return
    return widget;
  }
}