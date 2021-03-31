// Required imports
import 'package:flutter/material.dart';
// Pages
import 'package:formvalidation/pages/home_page.dart';
import 'package:formvalidation/pages/login_page.dart';
// Providers
import 'package:formvalidation/bloc/my_bloc_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* MyBlocProvider distribuye a lo largo de toda la aplicación (a través del
     * árbol de widgets) al LoginBloc (aunque pudiera distribuir cualquier
     * cantidad de blocs) y así poder utilizarlo.
     * 
     * MyBlocProvider también se encarga de renderizar la aplicación en caso de
     * que el/los bloc(s) se lo indique(n).
     */
    return MyBlocProvider(
      child: MaterialApp(
        title: 'Form Validation',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.teal
        ),
        initialRoute: LoginPage.routeName,
        routes: {
          HomePage.routeName: (_) => HomePage(),
          LoginPage.routeName: (_) => LoginPage()
        }
      )
    );
  }
}

/**
 * Novedades del ejercicio:
 * - Implementación de bloc para validación de formulario usando InheritedWidget,
 * StreamsTransformer, patrón Singleton y combinación de Streams con rxdart.
 */