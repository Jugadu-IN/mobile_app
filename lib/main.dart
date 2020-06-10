import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
//import 'login2.dart';
//import 'register2.dart';
import 'phone.dart';
//import 'facebook.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: Color(0xffFFEB3B),
        primaryColorDark: Color(0xffFBC02D),
        primaryColorLight: Color(0xffFFF9C4),
        accentColor: Color(0xffFFC107),
        dividerColor: Color(0xffBDBDBD),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {

        '/login' : (context) => LoginPage(),
        '/register' : (context) => Register(),
        //'/register2' : (context) => Register2(),
        '/phone' : (context) => PhoneSignInSection(),
        //'/facebook' : (context) => FacebookSignInSection(),
      },
    );
  }
}


