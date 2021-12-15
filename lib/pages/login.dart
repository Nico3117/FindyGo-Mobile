import 'package:findygo/constants/constant_bdd.dart';
import 'package:findygo/gestionBdd/table_models/sqlite_db.dart';
import 'package:findygo/gestionBdd/table_models/user.dart';
import 'package:findygo/helpers/helpers.dart';
import 'package:findygo/widgets/nav_bar.dart';
import 'package:findygo/widgets/side_menu_widget.dart';
import 'package:flutter/material.dart';
import 'subscribe.dart';
import 'forgot_pwd.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:developer' as developer;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  String emailSaisie = "";
  String passwordSaisie = "";
  String _userEmailPseudo = "";
  String _userPassword = "";

  Map<String, dynamic> mapUser = {};

  late Map<String, dynamic> mapPersonneRecuperee;
  User userRecord = User();
  User userRetrieved = User();
  late SqliteDB provider;

  final _formKeyTitle = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  // Méthodes

  Future<SqliteDB> getInstance() async {
    return provider = SqliteDB.instance;
  }

  @override
  void initState() {
    super.initState();
    userRecord = User.fromMap(mapUser);
    getInstance();
  }

  @override
  void dispose() {
    super.dispose();
    provider.close();
  }

  /// Créer un contexte utilisateur si l'email
  /// ou le username et le mot de passe
  /// correspondent en base
  Future<void> setConnexion(User _user) async {
    // Listes des emails + username + index de la table 'user'
    List<int> listIndex = <int>[];
    List<String> listEmails = <String>[];
    List<String> listUserNames = <String>[];
    List<String> listUserPasswords = <String>[];

    try {
      // Récupère la liste des user de la table user
      var mapUser0 = await provider.getAll(TableNames.TUSER);

       //var myCustomObject = {"a": "Salut", "b": "à toi !!!"};

      developer.log(
        ' -->>',
        name: 'login.dart: liste des utilisateurs',
        error: jsonEncode(mapUser0),
      );

      bool userExiste = false;

      for (int i = 0; i < mapUser0.length; i++) {
        listIndex.add(i);
        listEmails.add(mapUser0[i]['email']);
        listUserNames.add(mapUser0[i]['username']);
        listUserPasswords.add(mapUser0[i]['password']);

        // Mémorise l'index de l'utilisateur _indexListUser
        if ((mapUser0[i]['username'] == _user.username ||
                mapUser0[i]['email'] == _user.email) &&
            mapUser0[i]['password'] == _user.password) {
          userExiste = true;
        }
      }
      if (userExiste) {
        // Snackbar du succès de connexion à un compte
        String add = _user.email;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Connexion au compte  $add ok.'),
        ));

        // Retour à la page d'accueil
        Navigator.pushNamed(context, '/home');
      } else {
        throw "Identifiants inconnus";
      }
    } catch (err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 111, 207, 151),
              title: const Text("Connexion :"),
              content: Text(err.toString()),
            );
          });
    }
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
                "Connexion",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color.fromARGB(255, 111, 207, 151)), //Colors.green),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Divider(),
            ]));

    final inputEmail = Form(
        key: _formKeyEmail,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Text('Saisissez votre email ou votre pseudo: '),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: const TextStyle(
                fontSize: 15.0,
                height: 2.0,
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email ou pseudo',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              onChanged: (value) {
                setState(() {
                  _userEmailPseudo = value;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  _userEmailPseudo = value;
                });
              },
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Divider(),
        ]));

    final inputPassword = Form(
        key: _formKeyPassword,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Text('Saisissez votre mot de passe : '),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: const TextStyle(
                fontSize: 15.0,
                height: 2.0,
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
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
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Divider(),
        ]));

    final connexionButton = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          child: const Text('Connexion',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF6FCF97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            // Retour à la page d'acceuil si les informations
            // pour la création d'un nouveau compte sont correcte
            if (checkEmailOrUsernameOk(_userEmailPseudo) &&
                checkPasswordOk(_userPassword)) {
              User _u0 = User();

              // Détermine si c'est un pseudo ou un email
              if (!checkEmailOk(_userEmailPseudo)) {
                // C'est un pseudo
                _u0.username = _userEmailPseudo;
                _u0.email = '';
              } else {
                // C'est un email
                _u0.username = '';
                _u0.email = _userEmailPseudo;
              }
              _u0.password = _userPassword;

              setConnexion(_u0);

              _userEmailPseudo = "";
              _userPassword = "";

              // Notifier pour enregistrer l'utilisateur dans ses PrefencesShared

            } else {
              if (!checkEmailOk(_userEmailPseudo)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Format adresse email invalide"),
                ));
              } else if (!checkPasswordOk(_userPassword)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Format mot de passe invalide"),
                ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                      Text("L'adresse email et le mot de passe sont invalide"),
                ));
              }
            }
          }),
    );

    final buttonSignUp = TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute<void>(builder: (BuildContext context) {
          return const Subscribe();
        }));
      },
      child: const Text('Créer un compte ?',
          style: TextStyle(
              backgroundColor: Colors.blueGrey,
              color: Colors.blue,
              fontSize: 15)),
    );

    final buttonForgotPassword = TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute<void>(builder: (BuildContext context) {
          return const ForgotPwdPage(title: "Password");
        }));
      },
      child: const Text('Mot de passe oublié ?',
          style: TextStyle(
              backgroundColor: Colors.blueGrey,
              color: Colors.blue,
              fontSize: 15)),
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
              inputEmail,
              inputPassword,
              connexionButton,
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    buttonSignUp,
                    buttonForgotPassword,
                  ]),
            ]));
  }
}
