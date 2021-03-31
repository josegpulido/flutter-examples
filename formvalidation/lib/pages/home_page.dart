// Required imports
import 'package:flutter/material.dart';
// Blocs
import 'package:formvalidation/bloc/login_bloc.dart';
// Providers
import 'package:formvalidation/bloc/my_bloc_provider.dart';

class HomePage extends StatelessWidget {

  // Propiedades estáticas
  static final String routeName = 'home';

  // Widget builder
  @override
  Widget build(BuildContext context) {

    // Jalando al build la instancia del LoginBloc buscandolo en el árbol de widgets
    final LoginBloc bloc = MyBlocProvider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Email: ${bloc.email}'),
            Text('Password: ${bloc.password}')
          ]
        )
      )
    );
  }
}