import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class GestionBdd extends StatelessWidget {
  GestionBdd({Key? key}) : super(key: key);

  final String title = 'Gestion de la base de données';
  final Color backgroundColor = const Color.fromARGB(255, 111, 207, 151);

  // Variable de classe
  String _userEmail = "";
  String _userPassword = "";
  bool _isUserEmailOk = false;
  bool _isUserPasswordOk = false;

  // Méthodes Méthodes

  /// checkEmailOk
  /// Controle si le format est valide d'une adresse email
  /// @param prend une chaine de caractère qui sera un email à analyser
  /// @return true if email address format is compliant
  bool checkEmailOk(String str) {
    return EmailValidator.validate(str);
  }

  /// checkPasswordOk
  /// Controle si le format est valide d'un mot de passe
  /// @param prend une chaine de caractère qui sera un mot de passe à analyser
  /// @return n booléen pour true si le mot de passe est valide
  bool checkPasswordOk(String str) {
    return (str.isNotEmpty && str.length < 50) ? true : false;
  }

  // Widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: const Color.fromARGB(255, 111, 207, 151),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                const Text(
                  "Gestion de la base de données : ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 111, 207, 151)),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                RaisedButton(
                    child: const Text('Création un utilisateur'),
                    elevation: 8,
                    color: const Color.fromARGB(255, 111, 207, 151),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/gestionBddCreate',
                          arguments: <String, dynamic>{
                            'title': 'titre accueil',
                            'message': 'Message 1',
                          });
                    }),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                RaisedButton(
                    child: const Text('Mettre à jour un utilisateur'),
                    elevation: 8,
                    color: const Color.fromARGB(255, 111, 207, 151),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/gestionBddRead',
                          arguments: <String, dynamic>{
                            'title': 'titre accueil',
                            'message': 'Message 1',
                          });
                    }),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                RaisedButton(
                    child: const Text('Récupérer un utilisateur'),
                    elevation: 8,
                    color: const Color.fromARGB(255, 111, 207, 151),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/gestionBddUpdate',
                          arguments: <String, dynamic>{
                            'title': 'titre accueil',
                            'message': 'Message 1',
                          });
                    }),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                RaisedButton(
                    child: const Text('Supprimer un utilisateur'),
                    elevation: 8,
                    color: const Color.fromARGB(255, 111, 207, 151),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/gestionBddDelete',
                          arguments: <String, dynamic>{
                            'title': 'titre accueil',
                            'message': 'Message 1',
                          });
                    }),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          ),
        ));
  }
}
