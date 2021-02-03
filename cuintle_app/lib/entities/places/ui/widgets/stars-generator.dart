// Required imports
import 'package:flutter/material.dart';

class StarsBuilder {

  // Variables
  final int score;
  final double size;

  // Constructor
  StarsBuilder(
    // Parameters
    this.score,
    // Optional parameters
    [this.size = 22.5]
  );

  // Star Widget
  Widget starWidget(bool fulfilled) {
    return Icon(
      fulfilled ? Icons.star : Icons.star_border,
      color: fulfilled ? Color(0xFFf0e21f) : Color(0xFFd6d6d6),
      size: size,
    );
  }

  // Stars Widget Generator
  List<Widget> build() {

    // Recursive generation
    List<Widget> state = [];
    for (int i = 0; i < 5; i++) {
      state.add(
          starWidget(i < score)
      );
    }

    // Returning generated stars
    return state;
  }
}