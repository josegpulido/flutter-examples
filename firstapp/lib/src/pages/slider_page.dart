// Required imports
import 'package:flutter/material.dart';

// Widget
class SliderPage extends StatefulWidget {

  // State builder
  @override
  State<StatefulWidget> createState() {
    return _WidgetState();
  }
}

// State
class _WidgetState extends State<SliderPage> {

  // Variables
  double sliderValue = 200.0;
  bool disableSlider = false;
  bool switchValue = false;

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders + Checks + Switches')
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 30.0
            ),
            child: _sliderBuilder()
          ),
          _imageBuilder(),
          _checkboxBuilder(),
          _switchBuilder()
        ]
      )
    );
  }

  // Método para construir slider
  Widget _sliderBuilder() {
    return Slider(
      activeColor: Colors.pinkAccent,
      inactiveColor: Colors.lightGreenAccent,
      label: '${sliderValue.floor()}',
      divisions: 5,
      min: 100.0,
      max: 400.0,
      value: sliderValue,
      /* En todos los Widgets de Material, si el método onChanged retorna
       * un null, el Widget se bloquea.
       */
      onChanged: disableSlider ? null : (value) {
        setState(() {
          this.sliderValue = value;
        });
      }
    );
  }

  // Método para construir Widget de imagen
  Widget _imageBuilder() {
    return Image(
      image: NetworkImage('https://images.indianexpress.com/2020/07/tenet-release-759.jpg'),
      width: sliderValue,
      fit: BoxFit.contain,
    );
  }

  // Método para construir checkbox
  Widget _checkboxBuilder() {
    return CheckboxListTile(
      title: Text('Bloquear slider'),
      subtitle: Text('Desactiva la interacción con el widget'),
      contentPadding: EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 17.0
      ),
      value: disableSlider,
      onChanged: (value) {
        setState(() {
          disableSlider = value;
        });
      }
    );
  }

  // Método para construir switch
  Widget _switchBuilder() {
    return SwitchListTile(
      title: Text('Switch'),
      subtitle: Text('Este switch no sirve para nada'),
      value: switchValue,
      onChanged: (value) {
        setState(() {
          this.switchValue = value;
        });
      }
    );
  }
}