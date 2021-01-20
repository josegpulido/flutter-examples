// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:cuintle_app/components/bottom-nav-bar.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Return
    return MaterialApp(
      title: 'Travels App',
      theme: ThemeData(
        // Theme
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Fonts
        fontFamily: 'Nunito Sans'
      ),
      home: NavigationPager()
    );
  }
}