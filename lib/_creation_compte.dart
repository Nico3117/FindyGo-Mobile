import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'argument_routes.dart';

class CreationCompte extends StatefulWidget {
  const CreationCompte({Key? key, required this.title, required this.backgroundColor,}) : super(key: key);

  final String title;
  final Color backgroundColor;

  @override
  State<CreationCompte> createState() => _CreationCompte();
}
//

class _CreationCompte extends State<CreationCompte> {
  //
  // Variable de classe
  String _userEmail = "";
  String _userPassword = "";
  bool _isUserEmailOk = false;
  bool _isUserPasswordOk = false;

  // Méthodes Méthodes

  /**
   * checkEmailOk
   * Controle si le format est valide d'une adresse email
   * @param prend une chaine de caractère qui sera un email à analyser
   * @return true if email address format is compliant
   */
  bool checkEmailOk(String str) {
    return EmailValidator.validate(str);
  }

  /**
   * checkPasswordOk
   * Controle si le format est valide d'un mot de passe
   * @param prend une chaine de caractère qui sera un mot de passe à analyser
   * @return n booléen pour true si le mot de passe est valide
   */
  bool checkPasswordOk(String str) {
    return (str.length > 0 && str.length < 50) ? true : false;
  }

  // Widgets
  @override
  Widget build(BuildContext context) {    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Text(
                "FindyGo",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.green),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              RaisedButton(
                  child: Text('Retour à l\'accueil'),
                  elevation: 8,
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/accueil');
                  }),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text('Inscription nouvel utilisateur : '),
              Divider(),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text('Saisissez votre email : '),
              CupertinoTextField(
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                placeholder: 'Saisissez votre email',
                onChanged: (value) {
                  setState(() {
                    _userEmail = value;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    _userEmail = value;
                  });
                },
              ),
              Divider(),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text('Saisissez votre mot de passe : '),
              CupertinoTextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: false,
                placeholder: 'Saisissez votre mot de passe',
                onChanged: (value) {
                  setState(() {
                    _userPassword = value;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    _userPassword = value;
                  });
                },
              ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              RaisedButton(
                  child: Text('Créer'),
                  elevation: 8,
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    // Retour à la page d'acceuil si les informations
                    // pour la création d'un nouveau compte sont correcte
                    if (checkEmailOk(_userEmail) &&
                        checkPasswordOk(_userPassword)) {
                      _isUserEmailOk = false;
                      _isUserPasswordOk = false;

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Le compte avec l'adresse email\n ${_userEmail} a été créé"),
                      ));

                      _userEmail = "";
                      _userPassword = "";

                      Navigator.pushNamed(context, '/accueil');
                    } else {
                      if (!checkEmailOk(_userEmail)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Format adresse email invalide"),
                        ));
                      } else if (!checkPasswordOk(_userPassword)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Format mot de passe invalide"),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "L'adresse email et le mot de passe sont invalide"),
                        ));
                      }
                    }
                  }),
              Padding(padding: EdgeInsets.only(bottom: 20)),
            ],
          ),
        ),
      ));
  }
}
