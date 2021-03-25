// Required imports
import 'package:flutter/material.dart' show ChangeNotifier;
// Providers
import 'package:qr_scanner/providers/sql_provider.dart';

class ScanRecordsNotifier extends ChangeNotifier {

  /*
   * Esta clase es lo mismo que el BottomNavigationNotifier: básicamente una clase que se
   * encarga de notificar a la interfaz de usuario cuando sucede un cambio en el
   * estado actual de sus variables, como por ejemplo, scans.
   * 
   * También contiene el estado actual de las variables que se están mostrando
   * al usuario, por lo que no siempre se llama a esta clase para escuchar al
   * estado, si no también para simplemente obtener los valores de dicho
   * estado (listen: false).
   * 
   * Por lo regular, el listen: true se utiiza dentro de los métodos build,
   * ya que este redibujará al Widget padre (es decir, el Stateless Widget) cuando
   * el estado sufra un cambio hasta ese punto. Si se coloca dentro un método
   * cualquiera en el que su padre sea un Widget X, entonces se podrucirá un
   * funcionamiento incorrecto, renderizando así solo a dicho Widget y no a toda
   * la clase (que es para lo que está diseñado).
   */

  // Variables del estado
  List<QRScan> scans = [];
  String typeNowDisplaying = 'uri';

  // Notificador de la inserción de un registro a la tabla records
  Future<void> insertScan(String value) async {
    // Recuperando instancia del provider
    final SQLiteProvider sqlite = SQLiteProvider.instance;

    // Creando objeto QRScan
    final QRScan newScan = QRScan(value: value);

    // Insertando registro en la base de datos
    final int id = await sqlite.insertScan(newScan);
    newScan.id = id;

    /**
     * Actualizar la interfaz de usuarios en caso de se haya insertado a la DB
     * un registro del mismo tipo de los que se están mostrando listados en
     * pantalla.
     */
    if (newScan.type == typeNowDisplaying) {
      // Insertando el nuevo registro en la variable de estado scans
      scans.add(newScan);
      // Notificando a los dependientes para volver a renderizar widgets
      notifyListeners();
    }
  }

  // Notificador de consulta de registros de la tabla records
  Future<void> queryScans({ Map<String, dynamic> filters }) async {
    // Recuperando instancia del provider
    final SQLiteProvider sqlite = SQLiteProvider.instance;

    // Obteniendo todos los registros de la base de datos
    final List<QRScan> results = await sqlite.queryScans(filters: filters ?? null);

    // Reemplazando la variable scans con un nuevo listado para evitar pasar la referencia de la variable
    scans = results.map((result) => result).toList();

    // Notificando a los dependientes para volver a renderizar widgets
    typeNowDisplaying = filters['type'] ?? typeNowDisplaying;
    notifyListeners();
  }

  // Notificador de la remoción de un registro de la tabla records
  Future<void> removeScan(int id) async {
    // Recuperando instancia del provider
    final SQLiteProvider sqlite = SQLiteProvider.instance;

    // Borrando todos los registros de la tabla records de la BD
    final int _id = await sqlite.removeScan(id);

    // Removiendo item de la lista de scans
    scans.removeWhere((QRScan scan) {
      return scan.id == _id;
    });

    // Notificando a los dependientes para volver a renderizar widgets
    notifyListeners();
  }
  
  // Notificador de la remoción de todos los registro de la tabla records
  Future<void> removeAllScans() async {
    // Recuperando instancia del provider
    final SQLiteProvider sqlite = SQLiteProvider.instance;

    // Borrando todos los registros de la tabla records de la BD
    await sqlite.removeAllScans();

    // Limpiando la variable scans
    scans = [];

    // Notificando a los dependientes para volver a renderizar widgets
    notifyListeners();
  }

}