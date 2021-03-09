// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:movies_app/pages/home_page.dart';
import 'package:movies_app/pages/movie_details_widget.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (BuildContext context) => HomePage(),
    'details': (BuildContext context) => MovieDetailsPage()
  };
}