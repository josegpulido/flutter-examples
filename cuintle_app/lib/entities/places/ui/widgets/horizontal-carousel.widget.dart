// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:cuintle_app/entities/places/ui/widgets/image-card.widget.dart';

class HorizontalCarousel extends StatelessWidget {

  // Variables
  final List<String> places;

  // Constructor del Main Widget
  HorizontalCarousel(this.places);

  // Image List Builder
  List<Widget> imageListBuilder(List<String> places) {

    // Recursive generation
    List<Widget> state = [];
    for (int i = 0; i < places.length; i++) {
      state.add(
        ImageCard(places[i])
      );
    }

    // Returning generated stars
    return state;
  }

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Widget
    final ConstrainedBox widget = ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 215.0,
        maxWidth: double.infinity
      ),
      child: ListView(
        padding: EdgeInsets.all(15.0),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: imageListBuilder(places)
      )
    );

    // Return
    return widget;
  }
}