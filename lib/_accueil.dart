import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({
    Key? key,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;

  @override
  State<Accueil> createState() => _Accueil();
}

class _Accueil extends State<Accueil> {
  get backgroundColor => Color.fromARGB(255, 111, 207, 151);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.backgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "FindyGo",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color.fromARGB(255, 111, 207, 151)),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            RaisedButton(
                child: Text('Création de comptes'),
                elevation: 8,
                color: Color.fromARGB(255, 111, 207, 151),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/creationCompte', arguments:<String, dynamic>{
                    'title': 'titre accueil',
                    'message': 'Message 1',
                  });
                }),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            RaisedButton(
                child: Text('Connexion comptes'),
                elevation: 8,
                color: Color.fromARGB(255, 111, 207, 151),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/login', arguments:<String, dynamic>{
                    'title': 'titre accueil',
                    'message': 'Message 1',
                  });
                }),
            Padding(padding: EdgeInsets.only(bottom: 20)),
          ],
        ),
      ),
    );
  }
}
