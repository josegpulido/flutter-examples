// Required imports
import 'package:flutter/material.dart';
import 'dart:math';

// Widget
class MyAnimatedContainer extends StatefulWidget {

  // State builder
  @override
  State<StatefulWidget> createState() {
    return _WidgetState();
  }
}

// State
class _WidgetState extends State<MyAnimatedContainer> {

  // Variables
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.purple;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container')
      ),
      body: Center(
        /* AnimatedContainer es igual a un simple Container, salvo que requiere
         * la propiedad 'duration'. Este tipo de Container es sensible a los
         * cambios en sus propiedades, de manera que transiciona estos cambios
         * a través de una animación.
         */
        child: AnimatedContainer(
          duration: Duration(
            milliseconds: 300
          ),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
          /* Curves es una clase que contiene múltiples efectos y animaciones
           * predefinidas bajo las guías de Material.
           */
          curve: Curves.fastOutSlowIn
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_outlined),
        /*
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0)
          )
        ),
        */
        onPressed: () => _changeContainerAnimation()
      )
    );
  }

  // Método para llamar una nueva animación del Container
  void _changeContainerAnimation() {

    // Esta clase de Dart genera números de manera aleatoria
    final Random random = Random();

    // Changing widget state
    setState(() {
      // .nextInt pide el número aleatorio máximo (del 0 al 300 en este caso)
      this._width = random.nextInt(300).toDouble();
      this._height = random.nextInt(300).toDouble();
      this._borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      /* En este caso, se utiliza random para generar colores distintos cada vez
       * con ayuda de .fromRGBO. El número 255 se debe a que en la escala de
       * colores de 8 bits solo existen 256 combinaciones posibles de los
       * colores primarios (rojo, verde y azul), contando también el 0.
       */
      this._color = Color.fromRGBO(
        random.nextInt(255), // red
        random.nextInt(255), // green
        random.nextInt(255), // blue
        1.0 // opacity
      );
    });
  }
}