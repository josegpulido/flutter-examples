// Required imports
import 'package:flutter/material.dart';
// Pages
import 'package:formvalidation/pages/home_page.dart';
import 'package:formvalidation/pages/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Validation',
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        LoginPage.routeName: (_) => LoginPage()
      }
    );
  }
}