// Required imports
import 'package:flutter/material.dart';
// Providers
import 'package:firstapp/src/providers/menu_provider.dart' show menuProvider;
// Utils
import 'package:firstapp/src/utils/icon_getter_util.dart' show getIcon;

class HomePage extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes')
      ),
      body: _listViewBuilder()
    );
  }

  // List view builder
  Widget _listViewBuilder() {
    /* FutureBuilder es una clase que genera un Widget a partir de un Future.
     * 1. 'future' recibe el Future de donde se cargará la información, que en
     * este caso devuelve un List<dynamic>.
     * 2. 'initialData' funciona como un placeholder de la data antes de que esta
     * sea resuelta por el Future. En este caso, dicho placeholder es del tipo
     * List<dynamic>.
     * 3. 'builder' contiene una función que devuelve en los argumentos el
     * context y un snapshot. La snapshot contiene una 'captura' de la
     * información obtenida por el Future. En este caso, del tipo List<dynamic>.
     * Dicho snapshot tiene propiedades útiles tanto para la extracción de la
     * información como para desarrollar lógica para el Widget.
     */
    return FutureBuilder(
      future: menuProvider.readMenuConfigFile(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createListItems(snapshot.data, context)
        );
      }
    );
  }

  // List items builder
  List<Widget> _createListItems(List<dynamic> items, BuildContext context) {
    // Creando lista contenedora
    List<Widget> _list = List<Widget>();
    /* Recorriendo los items recibidos como argumento para en base a ellos
     * generar los items del Widget.
     */
    items.forEach((item) {
      /* En un List, podemos utilizar una notación de doble punto para
       * indicar a la instrucción consecuente que retorne antes
       * de los dos puntos (..) y ejecute la instrucción especificada:
       * (en este caso, dos instrucciones .add anidadas)
       */
      _list
      ..add(ListTile(
        title: Text(item['title']),
        leading: getIcon(item['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          /* Navigator es un Widget que interpone una serie de Widgets hijos
           * de forma Stack. Esto simula navegación entre distintas vistas.
           * 
           * .pushNamed es un named-constructor que requiere dos
           * argumentos posicionales:
           * - 'context' contiene toda la información de la aplicación como
           * la página previa, el theme, etc.
           * - 'route' recibe una ruta tipo String que la resolverá en el
           * directorio de rutas especificado en el Widget MaterialApp que
           * construye toda la aplicación.
           * 
           * Esta es la forma tradicional de navegación en Flutter.
           */
          Navigator.pushNamed(context, item['route']);
        }
      ))
      ..add(Divider(
        color: Color(0xFF212121)
      ));
    });
    return _list;
  }
}