import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    const String _title = 'Flutter App :)';

    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("José Pulido"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 26
            ),
            tooltip: "Regresar",
          ),
          backgroundColor: Colors.teal,
          titleSpacing: 5
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/do_y_mizu.jpg"),
                  fit: BoxFit.fitWidth
                )
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                color: Colors.black.withOpacity(0.3),
                constraints: BoxConstraints.expand(
                  height: 55
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: const Text(
                    "Do y Mizu ❤️",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22
                    ),
                  ),
                ),
              )
            )
          ]
        )
      )
    );
  }
}
