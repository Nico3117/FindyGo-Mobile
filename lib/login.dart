import 'package:flutter/material.dart';
import 'forgot_pwd.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    final logo = Padding(
        padding: const EdgeInsets.all(10),
        child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            child: Image.asset('assets/logo.png'),
          )
        ),
    );

    final inputEmail = Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
        ),
      ),
    );

    final inputPassword = Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
            ),
        ),
      ),
    );

    final buttonLogin = Padding (
     padding: EdgeInsets.symmetric(horizontal: 115, vertical: 5),
     child : ElevatedButton(
       onPressed: () {  },
       child: const Text('Connection',style : TextStyle(color: Colors.white, fontSize: 20)),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF6FCF97),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: const Size(100, 50)
        ),
      ),
    );

    final buttonForgotPassword = Padding (
      padding: EdgeInsets.symmetric(horizontal: 90, vertical: 5),
       child : FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
                builder:(BuildContext context) {
                  return ForgotPwdPage(title: "Password");
                })) ;
          },
          child: const Text('Mot de passe oublié ?',
              style: TextStyle(color: Colors.blue, fontSize: 16)
          ),
        ),
    );

    final buttonSignUp = Align (
      alignment: Alignment.bottomCenter,
      child: Padding (
        padding: EdgeInsets.only(bottom: 0),
        child : FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
                builder:(BuildContext context) {
                  return ForgotPwdPage(title: "Password");
                })) ;
          },
          child: const Text('Déjà un compte ?',
              style: TextStyle(color: Colors.grey, fontSize: 16)
          ),
        ),
      )
    );

    return SafeArea(
        child: Scaffold(
          appBar: AppBar (
            title: Text(widget.title),
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                logo,
                inputEmail,
                inputPassword,
                buttonLogin,
                buttonForgotPassword,
                buttonSignUp
              ],
            ),
          ),
        ),
    );
  }
}