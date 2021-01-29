// Required imports
import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20.0
        ),
        children: _cardsListTypeABuilder()
      )
    );
  }

  // Cards list type A builder
  List<Widget> _cardsListTypeABuilder() {
    return [
      _cardTypeABuilder(),
      SizedBox(
        height: 15.0
      ),
      _cardTypeBBuilder()
    ];
  }

  // Card type A builder
  Widget _cardTypeABuilder() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Column(
        children: [
          ListTile(
            title: Text('Card title'),
            subtitle: Text('Lorem ipsum dolor sit amet consectetur'),
            leading: Icon(Icons.photo_album_outlined)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  // code
                }
              ),
              FlatButton(
                child: Text('Continuar'),
                onPressed: () {
                  // code
                }
              )
            ]
          )
        ]
      )
    );
  }

  // Card type B builder
  Widget _cardTypeBBuilder() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)
      ),
      /* 'clipBehavior' es una propiedad de Card que permite asignar un Clip,
       * el cual es un Widget que ayuda a fijar todo el contenido de su Widget
       * padre (en este caso, Card) y que no se salga de las dimensiones
       * padre.
       */
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/image_placeholder.gif'),
            image: NetworkImage('https://p4.wallpaperbetter.com/wallpaper/863/730/470/mac-os-x-mac-sierra-wallpaper-preview.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 200.0,
            fit: BoxFit.cover
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 20.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Lorem ipsum dolor sit amet consectetur'),
                  Container(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      bottom: 14.0
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          child: Text('Me gusta'),
                          onPressed: () {
                            // code
                          }
                        ),
                        FlatButton(
                          child: Text('Compartir'),
                          onPressed: () {
                            // code
                          }
                        )
                      ]
                    )
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}