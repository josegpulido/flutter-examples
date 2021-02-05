// Required imports
import 'package:flutter/material.dart';
// Widgets
import 'package:movies_app/pages/home_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    '/': (BuildContext context) => HomePage()
  };
}