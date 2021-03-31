// Required imports
import 'package:flutter/material.dart';
// Controllers
import 'package:formvalidation/bloc/login_bloc.dart';

/*
 * InheritedWidget es un tipo de widget (como Stateless o Stateful) que permite
 * mandar información desde el padre hacia sus hijos, y viceversa.
 * 
 * Creando un InheritedWidget personalizado. Esta clase MyBlocProvider puede manejar
 * múltiples instancias de blocs, blocs de diferentes partes de la aplicación,
 * etcétera.
 * 
 * En general, se establece en la aplicación un punto central al cual pedirle
 * la instancia de algún bloc en específico, en este caso, de LoginBloc.
 */
class MyBlocProvider extends InheritedWidget {

  // Instanciando Singleton que contiene los broadcast stream controllers del login
  final LoginBloc loginBloc = LoginBloc();

  /* Constructor simple para pasarle parámetros con nombre a la clase de la
   * que MyBlocProvider extiende (InheritedWidget) a través de super.
   */
  MyBlocProvider({ Key key, Widget child }) : super(key: key, child: child) {
    // empty...
  }

  /*
   * Este método hereda de InheritedWidget y decide si notificar o no a los
   * widgets hijos sobre un cambio o actualización que amerite volver a
   * renderizarlos. En la mayoría de los casos, este comportamiento
   * se mantiene en true, a menos que se quiera controlar la lógica del
   * renderizado de los widgets.
   */
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  /* El método of() recibe el context del widget del que fue llamado para ir
   * barriendo el ábrol de widgets desde ahí en búsqueda de la instancia
   * MyBlocProvider.
   */
  static LoginBloc of(BuildContext context) {
    /* Buscando entre todo el árbol de widgets donde se encuentre una instancia
     * de MyBlocProvider.
     */
    return context.dependOnInheritedWidgetOfExactType<MyBlocProvider>().loginBloc;
  }
}