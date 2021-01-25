
class SolicitudesHttp {

  /* Future es una clase que maneja promesas
   * tal como lo hace Javascript; se concatenan los .then(),
   * se manejan los errores con .catchError(), entre otras
   * cosas
   */
  Future<String> httpGet(String url) {
    /* .delayed es una función (named constructor) que posee
     * la clase Future,que ejecuta una tarea luego de que
     * se termine el tiempo especificado
     */
    return Future.delayed(Duration(seconds: 4), () {
      return '{ "displayName": "José Pulido" }';
    });
  }
}