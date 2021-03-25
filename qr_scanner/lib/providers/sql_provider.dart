// Required imports
import 'dart:io';
import 'package:path/path.dart';
// Providers
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
// Models
import 'package:qr_scanner/models/qr_scan_model.dart';
export 'package:qr_scanner/models/qr_scan_model.dart'; // <-- De esta forma tengo acceso al model tan solo importando la clase SqlProvider

class SQLiteRef {
  // Facilitando las referencias a SQLite
  static final String databaseName = 'myScanDB';
  static final String recordsTable = 'records';
}

class SQLiteProvider {

  // Arquitectura singleton
  static Database _database;
  static final SQLiteProvider instance = SQLiteProvider._internal();
  SQLiteProvider._internal();

  // Getters de instancia de base de datos
  get database async {
    // Verificando si la DB ya se encuentra instanciada al momento de llamarse get database
    if (_database == null) {
      _database = await initDatabase();
    }
    return _database;
  }

  // Método de inicialización de SQLite
  Future<Database> initDatabase() async {
    
    // Resolver el path de donde se almacenará el archivo principal de SQLite
    final Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, '${SQLiteRef.databaseName}.db'); // <-- .db es la extensión que identifica al archivo como un SQLite

    // Recuperar o crear la base de datos de SQLite
    return await openDatabase(
      path,
      /**
       * La versión permite a SQLite identificar cuando se está construyendo la
       * base de datos por primera vez y cuando solo se tiene que recuperar
       * la versión que ya había. Cuando se hacen cambios estructurales al modo
       * de organización y consumo de SQLite, es importante aumentar este
       * número de versión.
       */
      version: 1,
      // Este método se ejecuta cada que se recupera la base de datos
      onOpen: (Database db) {
        print('SQLite Database opened successfully');
      },
      // Este método se ejecuta cada que se crea una base de datos por primera vez
      onCreate: (Database db, int version) async {

        print('SQLite Database created successfully at $path, creating ${SQLiteRef.recordsTable} table...');
        /**
         * Ejecutando un query apenas se encuentre creada la base de datos,
         * el cual creará la tabla principal de registros.
         */
        await db.execute(
          /**
           * Se recomienda mandar los queries como String multilínea para facilitar
           * la lecuta de código. El id se genera auto incrementado.
           */
          '''
          CREATE TABLE ${SQLiteRef.recordsTable}(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          );
          '''
        );
      }
    );
  }

  /*
   * Método para insertar de forma cruda un registro en la tabla records de la 
   * BD, que retorna el id único incremental del registro recién creado.
   * 
   * Este tipo de operación no es recomendada.
   */
  Future<int> insertScanWithRaw(QRScan scan) async {
    /**
     * Obteniendo la instancia de la base de datos a través del getter, lo cual
     * me garantiza recuperar/crear la BD en caso de que no se haya hecho antes
     * de llamar este método.
     */
    final Database db = await database;

    // Ejecutando una operación INSERT directamente en crudo
    return await db.rawInsert(
      '''
      INSERT INTO ${SQLiteRef.recordsTable}(id, type, value)
        VALUES(${scan.id}, '${scan.type}', '${scan.value}')
      '''
    );
  }

  /*
   * Método para insertar un registro en la tabla records de la BD, que
   * retorna el id único incremental del registro recién creado.
   * 
   * Este tipo de operación es altamente recomendada puesto que integra técnicas
   * de seguridad contra inyecciones SQL, entre otros métodos prefabricados.
   */ 
  Future<int> insertScan(QRScan scan) async {
    // Obteniendo la instancia de la base de datos a través del getter
    final Database db = await database;
    
    // Ejecutando una operación INSERT
    return await db.insert(SQLiteRef.recordsTable, scan.toJson());
  }

  // Método para obtener un registro de la tabla records de la BD a través de su ID único incremental
  Future<QRScan> queryScanById(int id) async {
    // Obteniendo la instancia de la base de datos a través del getter
    final Database db = await database;
    
    /**
     * Ejecutando un query que busque en una tabla de la BD a través de su ID,
     * utilizando argumentos posicionales.
     */
    final List<Map<String, dynamic>> response = await db.query(SQLiteRef.recordsTable, where: 'id = ?', whereArgs: [id]);

    return response.isNotEmpty ? QRScan.fromJson(response.first) : null;
  }

  // Método para obtener todos los registros de una tabla de la BD
  Future<List<QRScan>> queryScans({ Map<String, dynamic> filters }) async {
    // Obteniendo la instancia de la base de datos a través del getter
    final Database db = await database;

    // Ejecutando un query a secas
    List<Map<String, dynamic>> response;

    // Verificando si se ejecutará una búsqueda con o sin argumentos where
    if (filters == null) {
      response = await db.query(SQLiteRef.recordsTable);
    } else {
      // Construyendo la sentencia where de forma dinámica
      String whereSentence = '';
      List<dynamic> whereArgs = [];
      int i = 0;

      filters.forEach((String key, dynamic value) {
        whereSentence += '$key = ?';
        if (i > 0 && i < filters.length) {
          whereSentence += ', ';
        }
        whereArgs.add(value);
        i++;
      });

      response = await db.query(SQLiteRef.recordsTable, where: whereSentence, whereArgs: whereArgs);
    }

    return response.isNotEmpty ? response.map((Map<String, dynamic> record) {
      return QRScan.fromJson(record);
    }).toList() : [];
  }

  // Método para actualizar un registro de la tabla records de la BD
  Future<int> updateScan(QRScan scan) async {
    // Obteniendo la instancia de la base de datos a través del getter
    final Database db = await database;

    // Ejecutando query de actualización
    return await db.update(SQLiteRef.recordsTable, scan.toJson(), where: 'id = ?', whereArgs: [scan.id]);
  }

  // Método para borrar un registro de la tabla records de la BD
  Future<int> removeScan(int id) async {
    // Obteniendo la instancia de la base de datos a través del getter
    final Database db = await database;

    // Ejecutando query de remoción
    return await db.delete(SQLiteRef.recordsTable, where: 'id = ?', whereArgs: [id]);
  }

  // Método para borrar todos los registros de la tabla records de la BD
  Future<int> removeAllScans() async {
    // Obteniendo la instancia de la base de datos a través del getter
    final Database db = await database;

    // Ejecutando query de remoción
    return await db.delete(SQLiteRef.recordsTable);
  }

}