import 'dart:io';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:findygo/helpers/helpers.dart';
import 'package:findygo/widgets/nav_bar.dart';
import 'package:findygo/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';

class ForgotPwdPage extends StatefulWidget {
  const ForgotPwdPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ForgotPwdPageState createState() => _ForgotPwdPageState();
}

class _ForgotPwdPageState extends State<ForgotPwdPage> {
  String _userEmail = "";
  final _formKeyTitle = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  // Ecouteur du TextField
  final emailListener = TextEditingController();

  // Méthodes

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    emailListener.addListener(_recupereValeurTextfield );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    emailListener.dispose();
    super.dispose();
  }

  void _recupereValeurTextfield() {
    print('+++++++++++++++++++++++++++ Adresse email à envoyer : ${emailListener.text}');
  }

  /// Créer un compte avec un email et un mot de passe
  /// Le compte est créé uniquement si l'adresse email
  /// n'existe pas déjà dans la table 'user'
  Future<void> requestNewPassword(String _userEmail) async {
    // Snackbar du succès de création du compte
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          'Un email pour réinitialiser votre mot de passe vous a été envoyé à cette adresse:\n$_userEmail'),
    ));

    // Envoi d'un email avec la procédure de réinitialisation du mot de passe

    // Retour à la page d'accueil
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: const EdgeInsets.all(10),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            child: Image.asset('assets/logo.png'),
          )),
    );

    final bodyTitle = Form(
        key: _formKeyTitle,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Mot de passe",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color.fromARGB(255, 111, 207, 151)), //Colors.green),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "oublié",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color.fromARGB(255, 111, 207, 151)), //Colors.green),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Divider(),
            ]));

    final inputNewPwd = Form(
        key: _formKeyPassword,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Text('Saisissez votre email : '),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailListener,
              style: const TextStyle(
                fontSize: 15.0,
                height: 2.0,
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Email',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
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
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Divider(),
          const Text(
              'Envoyer la procédure de réinitialisation du mot de passe à cette adresse email.'),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
        ]));

    final buttonConfPwd = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          child: const Text('Envoyer réinitialisation sur ma boîte ',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          style: ElevatedButton.styleFrom(
              primary: const Color(0xFF6FCF97),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: const Size(100, 50)),
          onPressed: () {
            // Retour à la page d'acceuil si les informations
            // pour la création d'un nouveau compte sont correcte
            if (checkEmailOk(_userEmail)) {
              requestNewPassword(_userEmail);

              _userEmail = "";
            } else {
              if (!checkEmailOk(_userEmail)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Format adresse email invalide"),
                ));
              }
            }
          }),
    );

    final home = TextButton(
      onPressed: () => {Navigator.pushNamed(context, '/home')},
      child: const Text("Accueil",
          style:
              TextStyle(backgroundColor: Colors.blueGrey, color: Colors.blue)),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20),
      ),
    );

    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.blueGrey,
        ),
        child: const NavDrawer(),
      ),
      backgroundColor: Colors.blueGrey,
      appBar: const NavBar(),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          logo,
          bodyTitle,
          inputNewPwd,
          buttonConfPwd,
          home,
        ],
      ),
    );
  }
}
