// Required imports
import 'dart:async';
// Validators
import 'package:formvalidation/bloc/login_validators.dart';
// Providers
import 'package:rxdart/rxdart.dart';

/*
 * Esta clase es un Singleton que contiene los stream controllers que se usarán
 * para manipular los eventos de datos de los TextFields.
 */
class LoginBloc with LoginValidators {

  /*
  // Creando los controladores en modo broadcast
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  */

  /* La forma en la que se va a habilitar/deshabilitar el botón de login
   * de acuerdo a la validación del formulario es combinando ambos streams.
   * Dart no tiene esta capacidad, por lo que es conveniente implementar el
   * paquete rxdart.
   * 
   * rxdart permite combinar ambos streams, pero para ello hay que reemplazar
   * los antiguos controllers por dos BehaviorSubject, los cuales además son por
   * defecto del tipo broadcast:
   */
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Getter que para insertar un nuevo valor en el email controller
  Function(String) get changeEmail => _emailController.sink.add;

  // Getter que para insertar un nuevo valor en el password controller
  Function(String) get changePassword => _passwordController.sink.add;

  // Getter para suscribirse a los datos del email controller
  Stream<String> get emailStream => _emailController.stream.transform(myEmailValidator);

  // Getter para suscribirse a los datos del email controller
  Stream<String> get passwordStream => _passwordController.stream.transform(myPasswordValidator);

  /* Getter para combinar el stream email y el stream password usando rxdart, método
   * que pide dos streams (pasando los streams que ya tienen al transform incluido)
   * y el método que se encargara de trabajar el valor de retorno del stream (en
   * este caso, un booleano).
   */
  Stream<bool> get validationStream => Rx.combineLatest2(emailStream, passwordStream, (String email, String password) {
    /* Retornando un bool para habilitar/deshabilitar al dependiente (solo si
     * ambos streams no tienen erorres).
     */
    return email.isNotEmpty && password.isNotEmpty;
  });

  // Getters para obtener los últimos valores del controller en un momento determinado
  String get email => _emailController.value;
  String get password => _passwordController.value;

  // Método que desecha los controllers
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}