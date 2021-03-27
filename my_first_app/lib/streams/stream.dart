import 'dart:async';

void main() {

  // Inicializando controller al que solo se suscribirá un dependiente
  // final StreamController<String> controller = new StreamController<String>();
  // Inicualizando controler al que podrán suscribirse múltiples dependientes
  final StreamController<String> controller = new StreamController<String>.broadcast();

  /**
   * listen define cómo se comportará el controllear cuando ingrese información
   * al controller, es decir, cuando suceda un sink.
   */
  controller.stream.listen(
    // onData
    (String data) {
      print('Despegando $data!');
    },
    // onError
    onError: (err) {
      print('Error: $err');
    },
    // La siguiente propiedad cierra el controller cuando se dispara un onError (o no)
    cancelOnError: false,
    // onDone : Se dispara cuando el controller se cierra con .close()
    onDone: () {
      print('Controller done!');
    }
  );

  // Ingresando valor al controller (haciendo sink)
  controller.sink.add('Apolo 11');

  // Ingresando un error al controller
  controller.sink.addError('Houston, tenemos un problema...');

  // Cerrando controller para desuscribir a los dependientes de los nuevos valores emitidos
  controller?.close();
  // controller.sink.add('Apolo 12'); // <-- Dispara error "Cannot add event after closing"

}