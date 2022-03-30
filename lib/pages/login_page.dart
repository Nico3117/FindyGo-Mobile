import 'package:findygo/bo/ArgsRoute.dart';
import 'package:findygo/helpers/helpers.dart';
import 'package:findygo/utils/helpers/server_exchanges.dart';
import 'package:findygo/widgets/bottom_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:findygo/constants/routes.dart';

class LoginPage extends StatefulWidget {
  ///  Attributs ------------------------------------------------------------------
  /// */
  // Prochaine route / page à afficher
  ArgsRoute nextRoute;

  late TextEditingController tecEmail, tecPwd;

  ///  Constructor ------------------------------------------------------------------
  /// */

  LoginPage(
    this.nextRoute, {
    Key? key,
  }) : super(key: key) {
    tecEmail = TextEditingController();
    tecPwd = TextEditingController();
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // declare a GlobalKey pour le controle de la validation du formulaire
  final _formKey = GlobalKey<FormState>();

  String _msgErreur = '';
  String prenom = '';

  // declare a variable to keep track of the input text
  String emailUserInput = '';
  String passwordUserInput = '';

  // Lorsque l'on demande à soumettre le formulaire, on check les inputs
  bool isButtonDisabled = false;

  // Gère la visibilité du mot de passe
  bool _isPasswordVisible = false;

  // Etat checkbox se souvenir des identifiants
  bool _checkBoxSaveIds = false;

  late ArgsRoute args;

  void _submit() {
    // On controle les inputs avant la soumission du formulaire
    setState(() => {
          isButtonDisabled = true,
        });

    // validate == true si les 3 TextFieldField sont valide
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Faire une demande d'inscription au serveur
      _login(context);
    }
  }

  ///  SetState ------------------------------------------------------------------
  /// */
  @override
  void initState() {
    super.initState();
    isButtonDisabled = false;
    // _msgErreur = "";
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
                        children: [
                          Container(height: 50),
                          _logo(),
                          _bodyTitle(),
                          Container(
                            height: 10,
                          ),
                          Container(
                              color: Colors.white,
                              height: 310,
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        _buildEmailField(),
                                        _buildPasswordField(),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        _buildLoginButton(context),
                                        _buildMessageErreur(),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Checkbox(
                                              activeColor:
                                                  const Color(0xFF6FCF97),
                                              value: _checkBoxSaveIds,
                                              onChanged: (value) {
                                                setState(() {
                                                  _checkBoxSaveIds = value!;
                                                });
                                              },
                                            ),
                                            Text(
                                              'Se souvenir de moi',
                                              style: _checkBoxSaveIds
                                                  ? const TextStyle(
                                                      color: Color(0xFF6FCF97))
                                                  : const TextStyle(),
                                            )
                                          ],
                                        ),
                                      ]))),
                          const Spacer(),
                          Image.network(
                            "https://www.u-bordeaux-montaigne.fr/_contents/ametys-internal%253Asites/www/ametys-internal%253Acontents/partir-a-l-etranger-dans-le-cadre-d-une-convention-de-cooperation-article/_attribute/illustration/image/partir-etranger-convention-cooperation-u-bordeaux-montaigne_max0x611.png?objectId=defaultWebContent://c1579e77-f30d-4644-822f-d2f33946bd0b",
                            width: MediaQuery.of(context).size.width * 0.9,
                            //height: 200,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                _buildSubscribeButton(context),
                                _buildForgotPasswordButton(context),
                              ]),
                          //const Spacer(),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )))),
    );
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
      width: 200.0,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Se connecter",
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

  Widget _buildPasswordField() => SizedBox(
        width: 200.0,
        child: TextFormField(
          controller: widget.tecPwd,
          obscureText: !_isPasswordVisible,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: "Mot de passe",
            hintText: "Mot de passe",
            prefixIcon: IconButton(
              icon: const Icon(Icons.lock_outline_rounded),
              onPressed: () {},
            ),
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
              //isButtonDisabled = false;
              //passwordUserInput = '';
              return 'Mot de passe trop court (min. 6 caractères) !';
            }
            return null;
          },
          // update the state variable when the text changes
          onChanged: (text) => setState(() => passwordUserInput = text),
        ),
      );

  void updateStatus() {
    // Flip flop pour la visibilité du password
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  Widget _buildMessageErreur() => Center(
          child: Text(
        _msgErreur,
        style: const TextStyle(color: Colors.red),
      ));

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        child: const Text('Se connecter',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6FCF97),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () =>
            emailUserInput.isNotEmpty && passwordUserInput.isNotEmpty
                ? _submit()
                : null,
      ),
    );
  }

  ///  Widgets button ------------------------------------------------------------------
  /// */

  Widget _buildSubscribeButton(BuildContext context) {
    return OutlinedButton(
      child: const Text("S'enregistrer'"),
      onPressed: () => {
        // Aller à la page souscription
        Navigator.of(context).pushReplacementNamed(ROUTE_SUBSCRIBE)
      },
    );
  }

  Widget _buildForgotPasswordButton(BuildContext context) {
    return OutlinedButton(
      child: const Text("Mot de passe oublié"),
      onPressed: () => {
        // Aller à la page mot de passe oublier
        Navigator.of(context).pushReplacementNamed(ROUTE_FORGOT_PASSWORD)
      },
    );
  }

  ///  Methods ------------------------------------------------------------------
  /// */

  void _login(BuildContext context) {
    Map _body = {
      "email": widget.tecEmail.text,
      "password": widget.tecPwd.text,
    };

    ajaxPost("/login", _body).then((value) async => {
          if (value['token'] != null)
            {
              log("--------------------------------------------> body du login",
                  name: "Login", error: value.toString()),

              prenom = value["firstname"],

              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Bienvenue $prenom'))),

              if (_checkBoxSaveIds == true)
                {
                  // Sauvegarde des données reçues dans les SharedPreferences
                  await const FlutterSecureStorage()
                      .write(key: "token", value: value["token"]),
                  await const FlutterSecureStorage()
                      .write(key: "lastname", value: value["lastname"]),
                  await const FlutterSecureStorage()
                      .write(key: "firstname", value: value["firstname"]),
                  await const FlutterSecureStorage()
                      .write(key: "email", value: value["email"])
                },

              // Reset textviews
              widget.tecEmail.text = "",
              widget.tecPwd.text = "",

              // Navigator.of(context).pushReplacementNamed(widget.nextRoute, arguments: 'Hello from Login'),

              // Objet à transmettre en paramètres de la route
              args = ArgsRoute(widget.nextRoute.nomRoute),
              // Si un logement existe pour la ville sélectionnée, on afiche la page
              // liste des logements de la ville
              Navigator.of(context)
                  .pushNamed(widget.nextRoute.nomRoute, arguments: args),
            }
          else
            {
              log("--------------------------------------------> Erreur connexion login",
                  name: "Login", error: "Erreur de login ou de mot de passe"),
              setState(() {
                _msgErreur = "Erreur de login ou de mot de passe";
              })
            }
        });
  }
}
