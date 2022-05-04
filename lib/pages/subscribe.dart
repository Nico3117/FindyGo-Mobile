import 'dart:developer';

import 'package:findygo/bo/ArgsRoute.dart';
import 'package:findygo/helpers/helpers.dart';
import 'package:findygo/utils/helpers/server_exchanges.dart';
import 'package:flutter/material.dart';
import 'package:findygo/constants/routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Subscribe extends StatefulWidget {
  ///  Attributs ------------------------------------------------------------------
  /// */

  // Prochaine route / page à afficher
  ArgsRoute nextRoute;
  late TextEditingController tecEmail, tecId, tecPwd, tecPwd2;

  ///  Constructor ------------------------------------------------------------------
  /// */

  Subscribe(this.nextRoute, {Key? key}) : super(key: key) {
    tecEmail = TextEditingController();
    tecId = TextEditingController();
    tecPwd = TextEditingController();
    tecPwd2 = TextEditingController();
  }

  @override
  State<Subscribe> createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  // declare a GlobalKey pour le controle de la validation du formulaire
  final _formKey = GlobalKey<FormState>();

  // declare a variable to keep track of the input text
  String emailUserInput = '';
  String pseudoUserInput = '';
  String passwordUserInput = '';
  String passwordUserInput2 = '';
  ArgsRoute _ags = new ArgsRoute("From some where");

  // Lorsque l'on demande à soumettre le formulaire, on check les inputs
  bool isButtonDisabled = false;

  // Gère la visibilité du mot de passe
  bool _isPasswordVisible = false;

  void _submit() {
    // On controle les inputs avant la soumission du formulaire
    setState(() => {
          isButtonDisabled = true,
        });

    // validate == true si les 3 TextFieldField sont valide
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Faire une demande d'inscription au serveur
      _subscribe(context);
    }
  }

  ///  SetState ------------------------------------------------------------------
  /// */
  @override
  void initState() {
    super.initState();
    isButtonDisabled = false;
  }

  ///  Dispose ------------------------------------------------------------------
  /// */
  @override
  void dispose() {
    super.dispose();
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
                              height: 400,
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        _buildEmailField(),
                                        _buildUsernameField(),
                                        _buildPasswordField(),
                                        _buildPasswordField2(),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        _buildRegistrationButton(context),
                                      ]))),
                          //const SizedBox(height:0,),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
        width: 150.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Image.asset(
            'assets/pictures/logo.png',
          ),
        ),
      );

  Widget _bodyTitle() => SizedBox(
      width: 250.0,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  AppLocalizations.of(context).subscribe_page_main_title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black),
                ))
          ]));

  Widget _buildEmailField() => Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SizedBox(
          width: 200.0,
          child: TextFormField(
            controller: widget.tecEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).subscribe_page_mail,
              hintText: AppLocalizations.of(context).subscribe_page_mail,
              border: OutlineInputBorder(),
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
          )));

  Widget _buildUsernameField() => Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: 200.0,
        child: TextFormField(
          controller: widget.tecId,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).subscribe_page_username,
            hintText: AppLocalizations.of(context).subscribe_page_username,
            border: OutlineInputBorder(),
          ),
          autovalidateMode: isButtonDisabled
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          // use the validator to return an error string (or null) based on the input text
          validator: (text) {
            if (text == null || text.length < 6) {
              //isButtonDisabled = false;
              //pseudoUserInput = '';
              return 'Pseudo trop court (min. 6 caractères) !';
            } else {
              //isButtonDisabled = true;
              //pseudoUserInput = text;
            }
            return null;
          },
          // update the state variable when the text changes
          onChanged: (text) => setState(() => pseudoUserInput = text),
        ),
      ));

  Widget _buildPasswordField() => Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: 200.0,
        child: TextFormField(
          controller: widget.tecPwd,
          obscureText: !_isPasswordVisible,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).subscribe_page_password,
            hintText: AppLocalizations.of(context).subscribe_page_password,
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () => updateStatus(),
              icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          autovalidateMode: isButtonDisabled
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          validator: (text) {
            if (text == null || text.length < 6) {
              return 'Mot de passe trop court (min. 6 caractères) !';
            } else if (text != passwordUserInput2) {
              return 'Mots de passe différents';
            }
            return null;
          },
          // update the state variable when the text changes
          onChanged: (text) => setState(() => passwordUserInput = text),
        ),
      ));

  Widget _buildPasswordField2() => Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: 200.0,
        child: TextFormField(
          controller: widget.tecPwd2,
          obscureText: !_isPasswordVisible,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)
                .subscribe_page_confirmation_password,
            hintText: AppLocalizations.of(context)
                .subscribe_page_confirmation_password,
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () => updateStatus(),
              icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          autovalidateMode: isButtonDisabled
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          validator: (text) {
            if (text == null || text.length < 6) {
              return 'Mot de passe trop court (min. 6 caractères) !';
            } else if (text != passwordUserInput) {
              return 'Mots de passe différents';
            }
            return null;
          },
          // update the state variable when the text changes
          onChanged: (text) => setState(() => passwordUserInput2 = text),
        ),
      ));

  void updateStatus() {
    // Flip flop pour la visibilité du password
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  Widget _buildRegistrationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
        child: Text(
            AppLocalizations.of(context).subscribe_page_subscribe_button,
            style: TextStyle(color: Colors.black, fontSize: 20)),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          primary: const Color(0xFFC1D2D9),
        ),
        onPressed: () => emailUserInput.isNotEmpty &&
                pseudoUserInput.isNotEmpty &&
                passwordUserInput.isNotEmpty &&
                passwordUserInput2.isNotEmpty
            ? _submit()
            : null,
      ),
    );
  }

  ///  Widgets button ------------------------------------------------------------------
  /// */

  Widget _buildLoginButton(BuildContext context) {
    return FlatButton(
      child: Text(
        AppLocalizations.of(context).subscribe_page_already_an_account,
      ),
      onPressed: () => {
        // Aller à la page loggin
        Navigator.of(context)
            .pushReplacementNamed(ROUTE_ACCOUNT, arguments: _ags)
      },
    );
  }

  ///  Methods ------------------------------------------------------------------
  /// */

  void _subscribe(BuildContext context) {
    Map _body = {
      "username": widget.tecId.text,
      "firstname": widget.tecId.text,
      "lastname": "",
      "email": widget.tecEmail.text,
      "password": widget.tecPwd.text,
      "phone": "",
      "postal_address": "",
      "postal_code": "",
      "city": "",
      "department": "",
      "country": ""
    };

    ajaxPost("/users", _body).then((value) async => {
          log("########################### Data:",
              name: "fichier : server_exhanges", error: value),
          if (value['status'] == "User already existe")
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'Identifiant de compte déjà utilisé par un autre utilisateur !\nUtiliser d\'autres identifiants'))),
            }
          else if (value['id'].toString() != "0")
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                      'Inscription réussi.\nVous devez vous connecter une première fois.'))),

              // Sauvegarde des données reçues dans les SharedPreferences
              await const FlutterSecureStorage()
                  .write(key: "email", value: widget.tecEmail.text),
              await const FlutterSecureStorage()
                  .write(key: "password", value: widget.tecPwd.text),
              await const FlutterSecureStorage()
                  .write(key: "id", value: value["id"]),

              // Lire une valeur
              await FlutterSecureStorage().read(key: "email").then((value) {
                print("-------------------------------> email :" +
                    value.toString());
              }),
              await FlutterSecureStorage().read(key: "password").then((value) {
                print("-------------------------------> password :" +
                    value.toString());
              }),
              await FlutterSecureStorage().read(key: "id").then((value) {
                print(
                    "-------------------------------> id :" + value.toString());
              }),

              // Reset textviews
              widget.tecEmail.text = "",
              widget.tecId.text = "",
              widget.tecPwd.text = "",
              widget.tecPwd2.text = "",

              Navigator.pushNamed(context, ROUTE_LOGIN),
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Status non géré")))
            }
        });
  }
}
