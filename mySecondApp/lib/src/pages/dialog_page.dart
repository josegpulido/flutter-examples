// Required imports
import 'package:flutter/material.dart';

class DialogPage extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Page')
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          /* Navigator.pop utiliza el contexto para resolver hacia donde tiene
           * que regresa el app, es decir, en qué vista se encontraba
           * anteriormente.
           */
          Navigator.pop(context);
        }
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.deepPurple,
          textColor: Colors.white,
          shape: StadiumBorder(),
          child: Text('Abrir dialog'),
          onPressed: () => _openDialog(context)
        )
      )
    );
  }

  // Open alert event
  void _openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // <-- Evita que el dialog se cierre al hacer touch afuera
      /* builder es la función encargada de dibujar el Widget que compondrá el
       * dialog en sí.
       */
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
          ),
          title: Text('Dialog alert'),
          content: Column(
            /* 'mainAxisSize' configura cuánto se debe de estirar el Column
             * respecto al contenedor padre.
             */
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem ipsum dolor sit amet consectetur'),
              FlutterLogo(
                size: 40.0
              )
            ]
          ),
          actions: [
            FlatButton(
              child: Text('Cerrar'),
              /* Navigator.of(context).pop() toma la vista del Dialog y la
               * desecha, finalizando así la navegación.
               */
              onPressed: () => Navigator.of(context).pop()
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                // code
              }
            )
          ]
        );
      }
    );
  }
}