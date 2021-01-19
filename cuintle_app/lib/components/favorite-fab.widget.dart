// Required imports
import 'package:flutter/material.dart';

class FavoriteFab extends StatefulWidget {

  // Widget State : método que devuelve el estado del widget
  @override
  State<StatefulWidget> createState() {

    // Return
    return _FavoriteFab();
  }
}

class _FavoriteFab extends State<FavoriteFab> {

  // Variables
  bool favorite = false;

  // Método que se ejecuta al disparar el evento 'onPressed'
  void onPressedFab() {

    // Modificando el widget cambiando su estado
    setState(() {
      favorite = !this.favorite;
    });

    // Abriendo Snackbar y ocultando cualquier snackbar abierto actualmente
    final contextScaffold = Scaffold.of(context);
    contextScaffold.hideCurrentSnackBar();
    contextScaffold.showSnackBar(
      SnackBar(
        content: Text(
          this.favorite ? 'Agregaste a favoritos' : 'Quitaste de favoritos'
        )
      )
    );
  }

  // Main Widget : método que devuelve el widget renderizado
  @override
  Widget build(BuildContext context) {

    // Widget
    final FloatingActionButton widget = FloatingActionButton(
      backgroundColor: Color(0xFFed204d),
      mini: true,
      tooltip: 'Favoritos',
      onPressed: onPressedFab,
      child: Icon(
        this.favorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
        size: 20.0
      )
    );

    // Return
    return widget;
  }
}