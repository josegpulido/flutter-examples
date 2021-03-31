// Required imports
import 'dart:async';

class LoginValidators {

  // StreamTransformer que recibe un String y emite un String...
  final myEmailValidator = StreamTransformer<String, String>.fromHandlers(
    /* handleData recibe el valor que entra por el transformer (el password
     * en este caso) y el evento sink, con el que se decidirá qué tipo de evento
     * se disparará (add, addError, etc).
     */
    handleData: (String email, EventSink<String> sink) {
      // Definiendo expresión regular que valida un email
      const Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      final RegExp regExp = new RegExp(pattern);
      // Dejando fluir el email solo si hace match con la expresión regular definida
      if (regExp.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Escribe una dirección válida.');
      }
    }
  );
  
  final myPasswordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, EventSink<String> sink) {
      // Dejando fluir el password en caso de que su longitud sea mayor a 6
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Mínimo 6 caracteres.');
      }
    }
  );
}