// Required imports
import 'package:flutter/material.dart';
// Routes
import 'package:movies_app/routes/routes.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getAppRoutes()
    );
  }
}