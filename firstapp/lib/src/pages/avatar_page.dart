// Required imports
import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://jipboevefive.files.wordpress.com/2016/12/quentin-tarantino-dp-profile-pics-whatsapp-fb-1255.jpg?w=256&h=256')
          ),
          Container(
            margin: EdgeInsets.only(
              right: 10.0
            ),
            child: CircleAvatar(
              child: Text('QT'),
              backgroundColor: Colors.purple,
            )
          )
        ]
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://cflvdg.avoz.es/sc/jOwYWcXFsWdlE_cOP7ZeYGjhQZc=/x/2019/05/21/00121558464603530801709/Foto/GY22P35F2_204838.jpg'),
          placeholder: AssetImage('assets/image_placeholder.gif')
        )
      )
    );
  }
}