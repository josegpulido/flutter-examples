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
      body: Text('body')
    );
  }
}