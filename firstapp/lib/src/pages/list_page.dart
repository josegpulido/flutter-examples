// Required imports
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

// Widget
class ListPage extends StatefulWidget {

  // State builder
  @override
  State<StatefulWidget> createState() {
    return _WidgetState();
  }
}

// State
class _WidgetState extends State<ListPage> {

  // Variables
  List<int> numbers = List();
  bool isLoading = false;
  /* ScrollController es una clase que permite controlar un scroll, como por
   * ejemplo, los gestos sobre él.
   */
  ScrollController scrollController = ScrollController();

  /* 'initState' es un método que se dispara al inicializar el estado del
   * Widget.
   */
  @override
  void initState() {
    super.initState();
    
    // Generando 5 items aleatorios apenas inicie el State
    _createAdditionalItems(quantity: 5);

    // Levantando listener al controlador para escuchar sus cambios
    scrollController.addListener(() {
      // Validando si el scroll llegó hasta el límite inferior máximo disponible
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        // Descargando 3 items aleatorios más
        _fetchData();
      }
    });
  }

  // dispose() se dispara cuando el Widget se destuye o se desecha
  @override
  void dispose() {
    super.dispose();

    /* Desechando listener para que no se quede escuchando aún cuando el Widget
     * se destruyó, y así prevenir fugas de memoria.
     */
    scrollController.dispose();
  }

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List + Scroll')
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _listBuilder(),
          _circularProgressBuilder()
        ]
      )
    );
  }

  // Método para generar la lista
  Widget _listBuilder() {
    /* RefreshIndicator es una clase que permite el gesto de pull-refresh
     * en un ListView
     */
    return RefreshIndicator(
      // 'onRefresh' pide la referencia a un método; no es un callback tal cual
      onRefresh: _refreshData,
      color: Colors.pinkAccent,
      /* ListView.builder se encarga de renderizar los items conforme sean
       * necesarios, es decir, una Lazy List.
       */
      child: ListView.builder(
        // 'itemCount' establece el número máximo de una supuesta lista de urls
        itemCount: numbers.length,
        // 'itemBuilder' es la función que genera los items del list uno por uno
        itemBuilder: (BuildContext context, int i) {
          // Imagenes tomadas de Picsum (https://picsum.photos)
          return FadeInImage(
            fit: BoxFit.cover,
            height: 300.0,
            placeholder: AssetImage('assets/image_placeholder.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=${numbers[i]}')
          );
        },
        controller: scrollController
      )
    );
  }

  // Método que simula refrescar los items de la lista descargando nuevos datos
  Future<Null> _refreshData() async {
    Timer(
      Duration(seconds: 2),
      () {
        // Limpiando lista y generando nuevos items aleatorios
        numbers.clear();
        _createAdditionalItems(quantity: 5);
      }
    );
    Future.delayed(Duration(seconds: 2));
  }
  // Método que simula descargar data de un servicio API
  Future<Null> _fetchData() async {
    
    // Redibujando Widget para mostrar el circular progress
    isLoading = true;
    setState(() {
      // empty
    });

    // Timer dispara una función luego de pasar el Duration definido
    Timer(
      Duration(seconds: 5),
      () {
        // Redibujando Widget para ocultar el circular progress
        isLoading = false;
        // Generando 3 items aleatorios cada que el scroll tope hasta abajo
        _createAdditionalItems(quantity: 3);
      }
    );
  }

  // Método para generar X número de items aleatorios adicionales a la lista original
  void _createAdditionalItems({int quantity}) {

    for (var i = 0; i < quantity; i++) {
      numbers.add(Random().nextInt(100));
    }
    // Indicandole al Widget que tiene que redibujarse
    setState(() {
      // empty
    });
  }

  // Método para generar un Circular Progress
  Widget _circularProgressBuilder() {
    return isLoading ? Container(
      width: 53.0,
      height: 53.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0.0, 8.0),
            blurRadius: 10.0
          )
        ]
      ),
      margin: EdgeInsets.only(
        bottom: 35.0
      ),
      padding: EdgeInsets.all(12.0),
      child: CircularProgressIndicator(
        strokeWidth: 4.0
      )
    ) : Container();
  }
}