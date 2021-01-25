// Required imports
import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page')
      ),
      body: Text('body'),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }
      ),
    );
  }
}