// Required imports
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {

  // Variables
  final String title;
  final IconData icon;

  // Constructor
  NavButton(this.title, this.icon);

  // Main Widget
  @override
  Widget build(BuildContext context) {

    // Widget
    final InkWell widget = InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Cargando...')
          )
        );
      },
      /*
      splashColor: Colors.amber,
      highlightColor: Colors.lightGreen,
      focusColor: Colors.green,
      hoverColor: Colors.blue,
      */
      borderRadius: BorderRadius.circular(100.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Ink(
          decoration: BoxDecoration(
            color: Color(0xFFed204d),
            borderRadius: BorderRadius.circular(100.0)
          ),
          padding: EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 15.0,
            bottom: 15.0
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito Sans',
                  letterSpacing: 0.4
                )
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10.0
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 21.6
                )
              )
            ]
          )
        )
      )
    );

    // Return
    return widget;
  }
}