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
        primaryColor: Color(0xff6fcf97),
      ),
      // home: const CreationCompte(title: 'Création de compte'),
      home: Accueil(title: 'Accueil', backgroundColor: Color.fromARGB(255, 111, 207, 151)),
      routes: <String, WidgetBuilder>{
        '/accueil': (BuildContext context) => Accueil(title: 'Accueil', backgroundColor: Color.fromARGB(255, 111, 207, 151)),
        '/creationCompte': (BuildContext context) => CreationCompte(title: 'Création de compte', backgroundColor: Color.fromARGB(255, 111, 207, 151)),
      },
    );
  }
}