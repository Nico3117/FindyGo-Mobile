import 'package:findygo/login.dart';
import 'package:findygo/forgot_pwd.dart';
import 'package:flutter/material.dart';

import '_accueil.dart';
import '_bdd.dart';
import '_creation_compte.dart';
import 'constants/_customMaterialColor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FindyGo',
      theme: ThemeData(
          primaryColor: Color(0xff6fcf97)
      ),
      home: Accueil(title: 'Accueil', backgroundColor: Color.fromARGB(255, 111, 207, 151)),
      routes: <String, WidgetBuilder> {
        '/accueil': (BuildContext context) => Accueil(title: 'Accueil', backgroundColor: Color.fromARGB(255, 111, 207, 151)),
        '/login': (context) => LoginPage(title: "Login"),
        '/forgotpwd': (context) => ForgotPwdPage(title: "Password"),
        '/creationCompte': (BuildContext context) => CreationCompte(title: 'Création de compte', backgroundColor: Color.fromARGB(255, 111, 207, 151)),
      },
    );
  }
}