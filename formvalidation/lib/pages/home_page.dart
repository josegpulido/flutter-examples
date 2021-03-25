// Required imports
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  // Propiedades estáticas
  static final String routeName = 'home';

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Text('Home page')
      )
    );
  }
}