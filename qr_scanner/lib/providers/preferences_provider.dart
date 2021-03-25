// Providers
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class PreferencesProvider {

  /*
   * Implementando arquitectura Singleton para utilizar la misma instancia
   * en cualquier punto del app.
   */
  static final PreferencesProvider _instance = PreferencesProvider._internal();

  factory PreferencesProvider() {
    return _instance;
  }

  PreferencesProvider._internal();

  SharedPreferences _preferences;

  // Método de inicialización de la instancia singleton SharedPreferences
  void initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Getters y setters

  get theme {
    return _preferences.getString('theme') ?? null;
  }

  set theme(String type) {
    _preferences.setString('theme', type);
  }

  get lastPage {
    return _preferences.getString('lastPage') ?? null;
  }
  
  set lastPage(String type) {
    _preferences.setString('lastPage', type);
  }

  // Stream controller para cambiar el theme de forma dinámica
  final StreamController _streamController = StreamController<bool>.broadcast();

  Function(bool) get themeSink {
    return _streamController.sink.add;
  }

  Stream<bool> get themeStream {
    return _streamController.stream;
  }
  
  void dispose() {
    /**
     * En teoría, este dispose se ejecuta solo puesto que el dependiente
     * se encuentra escuchando en el main.dart, y si la aplicación se cierra
     * entonces también se desechará el StreamController.
     */
    _streamController?.close();
  }

}