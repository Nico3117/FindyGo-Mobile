import 'package:findygo/constants/constant_bdd.dart';
import 'package:findygo/gestionBdd/table_models/sqlite_db.dart';
import 'package:findygo/gestionBdd/table_models/user.dart';
import 'package:findygo/helpers/helpers.dart';
import 'package:findygo/widgets/nav_bar.dart';
import 'package:findygo/widgets/side_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'forgot_pwd.dart';
import 'login.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({
    Key? key,
  }) : super(key: key);

  @override
  _CreateAccount createState() => _CreateAccount();
}

class _CreateAccount extends State<Subscribe> with ChangeNotifier {
  final String title = "Connexion";
  final Color backgroundColor = const Color.fromARGB(255, 111, 207, 151);

  String emailSaisie = "";
  String passwordSaisie = "";

  // Variable de classe
  String _userEmail = "";
  String _userPassword = "";
  String _userName = "";

  Map<String, dynamic> mapUser = {};

  late Map<String, dynamic> mapPersonneRecuperee;
  User userRecord = User();
  User userRetrieved = User();
  late SqliteDB provider;

  final _formKeyTitle = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final _inputUsername = GlobalKey<FormState>();

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

  /// Créer un compte avec un email et un mot de passe
  /// Le compte est créé uniquement si l'adresse email
  /// n'existe pas déjà dans la table 'user'
  Future<void> setUser(User _user) async {
    try {
      // Récupère la liste des user de la table user
      var mapUser0 = await provider.getAll(TableNames.TUSER);

      // Listes des emails + username + index de la table 'user'
      List<String> listEmails = <String>[];
      List<String> listUserNames = <String>[];
      List<int> listIndex = <int>[];

      for (int i = 0; i < mapUser0.length; i++) {
        listEmails.add(mapUser0[i]['email']);
        listUserNames.add(mapUser0[i]['username']);
        listIndex.add(i);
      }

      // Check si l'email  fournit à la création du compte est déjà utilisé ?
      if (listEmails.contains(_user.email) ||
          listEmails.contains(_user.username)) {
        throw 'Cette adresse email ou ce pseudo est existe déjà !';
      }

      try {
        // Si l'adresse email et le pseudo fournit n'existe pas, le compte est créé
        await provider.insert(TableNames.TUSER, _user.toMap());

        // Snackbar du succès de création du compte
        String add = _user.email + '/' + _user.username;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Le compte $add à été créé avec succès'),
        ));

        // Retour à la page d'accueil
        Navigator.pushNamed(context, '/home');
      } catch (err) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 111, 207, 151),
                title: const Text("Création d'un compte"),
                content: Text(err.toString()),
              );
            });
      }
    } catch (err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 111, 207, 151),
              title: const Text("Création d'un compte"),
              content: Text(err.toString()),
            );
          });
    }
  }

  // Widgets
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
                "Créer un compte",
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
          const Text('Saisissez votre email : '),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: const TextStyle(
                fontSize: 15.0,
                height: 2.0,
              ),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(

                hintText: 'Email',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
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
        ]));

    final inputUsername = Form(
        key: _inputUsername,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Text('Saisissez un pseudo : '),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              style: const TextStyle(
                fontSize: 15.0,
                height: 2.0,
              ),
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Pseudo',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _userName = value;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  _userName = value;
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
          const Text('Saisissez un mot de passe : '),
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

    final createButton = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          child: const Text('Créer',
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
            if (checkEmailOk(_userEmail) &&
                checkUserNameOk(_userName) &&
                checkPasswordOk(_userPassword)) {
              User _u0 = User();
              _u0.email = _userEmail;
              _u0.username = _userName;
              _u0.password = _userPassword;

              setUser(_u0);

              _userEmail = "";
              _userName = "";
              _userPassword = "";

              // Notifier pour enregistrer l'utilisateur dans ses PrefencesShared

              // Retour à la page d'accueil
              // Navigator.pushNamed(context, '/home');

            } else {
              if (!checkEmailOk(_userEmail)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Format adresse email invalide"),
                ));
              } else if (!checkUserNameOk(_userName)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Format pseudo invalide"),
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
          return const Login();
        }));
      },
      child: const Text('Connexion',
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
/*
    final getAllButton = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          child: const Text('GetAll',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF6FCF97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            //fixedSize: const Size(20, 10)
          ),
          onPressed: () {
            getAllUsers();
          }),
    );

    final getEraseOne = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          child: const Text('supOne',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF6FCF97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            //fixedSize: const Size(20, 10)
          ),
          onPressed: () {
            getAllUsers();
          }),
    );

    final getEraseAll = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          child: const Text('supAll',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF6FCF97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            //fixedSize: const Size(20, 10)
          ),
          onPressed: () {
            getAllUsers();
          }),
    );
*/
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.blueGrey,
        ),
        child: const NavDrawer(),
      ),
      backgroundColor: Colors.blueGrey,
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            logo,
            bodyTitle,
            inputEmail,
            inputUsername,
            inputPassword,
            createButton,
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buttonSignUp,
                  buttonForgotPassword,
                ]),
          ],
        ),
      ),
    );
  }
}
