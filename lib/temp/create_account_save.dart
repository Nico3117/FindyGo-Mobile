import 'package:findygo/constants/constant_bdd.dart';
import 'package:findygo/gestionBdd/table_models/sqlite_db.dart';
import 'package:findygo/gestionBdd/table_models/user.dart';
import 'package:findygo/helpers/helpers.dart';
import 'package:findygo/widgets/nav_bar.dart';
import 'package:findygo/widgets/side_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  _CreateAccount createState() => _CreateAccount();
}

class _CreateAccount extends State<CreateAccount> with ChangeNotifier {
  final String title = "Connexion";
  final Color backgroundColor = const Color.fromARGB(255, 111, 207, 151);

  String emailSaisie = "";
  String passwordSaisie = "";

  // Variable de classe
  String _userEmail = "";
  String _userPassword = "";

  int _nbCpt = 0; //PersonneProvider.sCpt;

  Map<String, dynamic> mapUser = {};

  late Map<String, dynamic> mapPersonneRecuperee;
  User userRecord = User();
  User userRetrieved = User();
  late SqliteDB provider;

  final _formKeyTitle = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final _formKeyDataDisplay = GlobalKey<FormState>();

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

      // Listes des emails + index de la table 'user'
      List<String> listEmails = <String>[];
      List<int> listIndex = <int>[];

      for (int i = 0; i < mapUser0.length; i++) {
        listEmails.add(mapUser0[i]['email']);
        listIndex.add(i);
      }

      // Check si l'email  fournit à la création du compte existe ?
      if (listEmails.contains(_user.email)) {
        throw 'Ce compte existe déjà !';
      }

      try {
        // SI l'adresse email fournit n'existe pas, le compte est créé
        await provider.insert(TableNames.TUSER, _user.toMap());
        userRetrieved = _user;
        // Récupère le nombre de compte pour affichage
        SqliteDB p1 = SqliteDB();
        _nbCpt = (await p1.getCount(TableNames.TUSER))!;
        // Snackbar du succès de création du compte
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Le compte à bien été créé"),
        ));
        // Mise à jour du state
        setState(() {});

      } catch (err) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Création du compte"),
                content: Text('Recommencez !'),
              );
            });
      }
    } catch (err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Erreur pour la création du compte"),
              content: Text(err.toString()),
            );
          });
    }
  }

  Future<void> getAllUsers() async {
    // aurelienvaillant@outlook.fr'
    try {
      List<Map<String, dynamic>> maMaps = await provider.getAll('user');

      setState(() {});
    } catch (err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('getAllUsers'),
              content:
                  Text('Problème dans la récupération de tous les users !'),
            );
          });
    }
  }

  Future<void> getUser(int id) async {
    if (userRetrieved.toMap()['id'] != null) {
      userRetrieved =
          await provider.getPersonne('user', userRetrieved.toMap()['id']);
      setState(() {});
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Récupération'),
              content: Text('Aucune données à récupérer !'),
            );
          });
    }
  }

  Future<void> delete() async {
    await provider.delete('user', userRetrieved.toMap()['id']);
    setState(() {
      userRetrieved = User();
    });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Suppression'),
            content: Text('Les données ont été supprimées !'),
          );
        });
  }

  // Widgets
  @override
  Widget build(BuildContext context) {
    final bodyTitle = Form(
        key: _formKeyTitle,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "Create Account",
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

    final inputPassword = Form(
        key: _formKeyPassword,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Text('Saisissez votre mot de passe : '),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
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
            //fixedSize: const Size(20, 10)
          ),
          onPressed: () async {
            // Retour à la page d'acceuil si les informations
            // pour la création d'un nouveau compte sont correcte
            if (checkEmailOk(_userEmail) && checkPasswordOk(_userPassword)) {
              User _u0 = User();
              _u0.email = _userEmail;
              _u0.password = _userPassword;

              setUser(_u0);

              _userEmail = "";
              _userPassword = "";

              // Notifier pour enregistrer l'utilisateur dans ses PrefencesShared

              // Retour à la page d'accueil
              // Navigator.pushNamed(context, '/home');

            } else {
              if (!checkEmailOk(_userEmail)) {
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

    final dataDisplay = Form(
        key: _formKeyDataDisplay,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          const Text('Données récupérées :'),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Email : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text('${userRetrieved.toMap()['email']}',
                          style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Paswword : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text('${userRetrieved.toMap()['password']}',
                          style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Nombre de comptes dans la BDD : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text('$_nbCpt',
                          style: const TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ]),
          )
        ]));

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                bodyTitle,
                inputEmail,
                inputPassword,
                Row(children: <Widget>[
                  createButton,
                  getAllButton,
                ]),
                Row(children: <Widget>[
                  getEraseOne,
                  getEraseAll,
                ]),
                dataDisplay,
              ],
            ),
          ),
        ));
  }
}
