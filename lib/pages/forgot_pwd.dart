import 'dart:io';
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:findygo/constants/constantes.dart';
import 'package:findygo/constants/routes.dart';
import 'package:findygo/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ForgotPwdPage extends StatefulWidget {
  ///  Attributs ------------------------------------------------------------------
  /// */

  late TextEditingController tecEmail;

  ///  Constructor ------------------------------------------------------------------
  /// */
  ForgotPwdPage({Key? key}) : super(key: key) {
    tecEmail = TextEditingController();
  }

  @override
  _ForgotPwdPageState createState() => _ForgotPwdPageState();
}

class _ForgotPwdPageState extends State<ForgotPwdPage> {
  // declare a GlobalKey pour le controle de la validation du formulaire
  final _formKey = GlobalKey<FormState>();

  // declare a variable to keep track of the input text
  String emailUserInput = '';

  // Lorsque l'on demande à soumettre le formulaire, on check les inputs
  bool isButtonDisabled = false;

  void _submit() {
    // On controle les inputs avant la soumission du formulaire
    setState(() => {
          isButtonDisabled = true,
        });

    // validate == true si les 3 TextFieldField sont valide
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Faire une demande d'inscription au serveur
      //_subscribe(context);
    }
  }

  ///  SetState ------------------------------------------------------------------
  /// */
  @override
  void initState() {
    super.initState();
    isButtonDisabled = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

/*
  void _recupereValeurTextfield() {
    print('+++++++++++++++++++++++++++ Adresse email à envoyer : ${emailListener.text}');
  }

  /// Send an email to FindyGo IT support with customer email to recover a forget password
  Future<void> requestNewPassword(String _userEmail) async {
    // Fait apparaître le client mail sur le cleint
    String toMailId = ConstApp.FINDYGO_IT_SUPPORT_EMAIL;
    String subject = "Procédure de récupération d'un mot de passe";
    String body =
        'Pour l\'administrateur: renvoyer un mot de passe à l\'utilisateur en utilisant la procédure standard.\n -> $_userEmail\n\nEntreprise FindyGo\ncontact@findygo.fr \n+336 1122 3344 \n\n\n';

    await launch('mailto:$toMailId?subject=$subject&body=$body', headers: const {"token": "abcd1234EFG", "data_1": "789"});

    // Snackbar du succès de création du compte
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Un email pour réinitialiser votre mot de passe vous a été envoyé à cette adresse:\n$_userEmail'),
    ));

    // Retour à la page d'accueil
    Navigator.pushNamed(context, '/home');
  }

    final logo = Padding(
      padding: const EdgeInsets.all(10),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            child: Image.asset('assets/pictures/logo.png'),
          )),
    );

    final bodyTitle = Form(
        key: _formKeyTitle,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: const [
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "Mot de passe",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromARGB(255, 111, 207, 151)), //Colors.green),
          ),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          Text(
            "oublié",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromARGB(255, 111, 207, 151)), //Colors.green),
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
                contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
          const Text('Envoyer la procédure de réinitialisation du mot de passe à cette adresse email.'),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
        ]));

    final btRequestNewPassword = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          child: const Text('Envoyer réinitialisation sur ma boîte ', style: TextStyle(color: Colors.white, fontSize: 20)),
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
      child: const Text("Accueil", style: TextStyle(backgroundColor: Colors.blueGrey, color: Colors.blue)),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20),
      ),
    );
*/

  /// Send an email to FindyGo IT support with customer email to recover a forget password
  Future<void> requestNewPassword(String _userEmail) async {
    // Fait apparaître le client mail sur le cleint
    String toMailId = ConstApp.FINDYGO_IT_SUPPORT_EMAIL;
    String subject = "Procédure de récupération d'un mot de passe";
    String body =
        'Pour l\'administrateur: renvoyer un mot de passe à l\'utilisateur en utilisant la procédure standard.\n -> $_userEmail\n\nEntreprise FindyGo\ncontact@findygo.fr \n+336 1122 3344 \n\n\n';

    await launch('mailto:$toMailId?subject=$subject&body=$body',
        headers: const {"token": "abcd1234EFG", "data_1": "789"});
  }

  ///  Widget: BUILD ------------------------------------------------------------------
  /// */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(height: 50),
                          _logo(),
                          _bodyTitle(),
                          Container(height: 10),
                          Container(
                              color: Colors.white,
                              height: 180,
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        _buildEmailField(),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        //_buildRegistrationButton(context),
                                        btRequestNewPassword(context),
                                      ]))),
                          //const SizedBox(height:0,),
                          const Spacer(),
                          Image.network(
                            "https://c.neh.tw/thumb/f/720/49999f336e344fb0b7b6.jpg",
                            width: MediaQuery.of(context).size.width * 0.9,
                            //height: 300,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                _buildLoginButton(context),
                              ]),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )))));
  }

  ///  Widgets ------------------------------------------------------------------
  /// */

  Widget _logo() => SizedBox(
        width: 80.0,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/pictures/logo.png',
            width: 50,
            height: 50,
          ),
        ),
      );

  Widget _bodyTitle() => SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Mot de passe oublié",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 111, 207, 151)),
                ))
          ]));

  Widget _buildEmailField() => SizedBox(
      width: 200.0,
      child: TextFormField(
        controller: widget.tecEmail,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Email",
          prefixIcon: IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ),
        autovalidateMode: isButtonDisabled
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        // use the validator to return an error string (or null) based on the input text
        validator: (text) {
          if (!checkEmailOk(text!)) {
            return 'Format email invalide !';
          }
          return null;
        },
        // update the state variable when the text changes
        onChanged: (text) => setState(() => emailUserInput = text),
      ));

  Widget _buildRegistrationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        child: const Text('Demande mot de passe',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6FCF97),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => emailUserInput.isNotEmpty ? _submit() : null,
      ),
    );
  }

  Widget btRequestNewPassword(BuildContext context) {
    return Padding(
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
            if (checkEmailOk(emailUserInput)) {
              requestNewPassword(emailUserInput).then((value) => {
                    // Snackbar du succès de création du compte
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'Un email pour réinitialiser votre mot de passe vous a été envoyé '),
                    )),
                    emailUserInput = "",

                    // Retour à la page d'accueil
                    Navigator.pushNamed(context, '/home'),
                  });
            } else {
              if (!checkEmailOk(emailUserInput)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Format adresse email invalide"),
                ));
              }
            }
          }),
    );
  }

  ///  Widgets button ------------------------------------------------------------------
  /// */

  Widget _buildLoginButton(BuildContext context) {
    return OutlinedButton(
      child: const Text("Accueil"),
      onPressed: () => {
        // Aller à la page loggin
        Navigator.of(context).pushReplacementNamed(ROUTE_SEARCH)
      },
    );
  }
}
