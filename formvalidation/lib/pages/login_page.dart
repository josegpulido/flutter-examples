// Required imports
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  // Propiedades estáticas
  static final String routeName = 'login';

  // Widget builder
  @override
  Widget build(BuildContext context) {

    // Variables
    final Size size = MediaQuery.of(context).size;

    // Fondo de pantalla
    final Widget backgroundWidget = Container(
      width: double.infinity,
      height: 250.0,
      decoration: BoxDecoration(
        color: Colors.teal
      )
    );

    // Icono de presentación
    final Widget iconWidget = Column(
      children: [
        SizedBox( height: 70.0 ),
        Icon(
          Icons.account_circle_outlined,
          size: 60.0,
          color: Colors.white
        ),
        SizedBox(
          height: 10.0,
          /*
           * El siguiente truco permite expandir el Column por completo en lugar
           * de tener que posicionar todo el widget:
           */
          width: size.width
        ),
        Text(
          'Iniciar sesión',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 23.0
          )
        )
      ]
    );
    
    // Email del formulario
    final Widget emailWidget = TextField(
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.alternate_email_outlined,
          color: Colors.black45
        ),
        labelText: 'Correo electrónico',
        hintText: 'example@email.com'
      )
    );

    // Password del formulario
    final Widget passwordWidget = TextField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock_outline,
          color: Colors.black45
        ),
        labelText: 'Contraseña'
      )
    );

    // Submit del formulario
    final Widget submitWidget = ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 0.0),
        shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        )),
        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.teal)
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 15.0
        ),
        child: Text('Ingresar')
      )
    );

    // Formulario
    final Widget formWidget = SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200.0,
          ),
          Container(
            width: size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0)
                )
              ]
            ),
            padding: EdgeInsets.only(
              top: 30.0,
              bottom: 30.0,
              left: 13.0,
              right: 20.0
            ),
            child: Column(
              children: [
                emailWidget,
                SizedBox( height: 10.0 ),
                passwordWidget,
                SizedBox( height: 30.0 ),
                submitWidget
              ]
            )
          ),
          SizedBox( height: 25.0 ),
          Text('Recuperar contraseña'),
          SizedBox( height: 30.0 )
        ]
      )
    );

    return Scaffold(
      body: Stack(
        children: [
          backgroundWidget,
          iconWidget,
          formWidget
        ]
      )
    );
  }
}