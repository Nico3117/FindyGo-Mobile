import 'package:flutter/material.dart';

class ForgotPwdPage extends StatefulWidget {
  const ForgotPwdPage({Key? key,  required this.title}) : super(key: key);
  final String title;
  @override
  _ForgotPwdPageState createState() => _ForgotPwdPageState();
 }

class _ForgotPwdPageState extends State<ForgotPwdPage> {

  @override
  Widget build(BuildContext context) {

    final inputNewPwd = Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Mot de passe',
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );

    final inputConfPwd = Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Nouveau mot de passe',
          contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );

    final buttonConfPwd = Padding (
      padding: EdgeInsets.symmetric(horizontal: 115, vertical: 5),
      child : ElevatedButton(
        onPressed: () {  },
        child: const Text('Confirmer',style : TextStyle(color: Colors.white, fontSize: 20)),
        style: ElevatedButton.styleFrom(
            primary: Color(0xFF6FCF97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fixedSize: const Size(100, 50)
        ),
      ),
    );

    final buttonBack = TextButton(
      onPressed: () => {
        Navigator.pop(context)
      },
      child: Text("Se connecter", style : TextStyle(color: Colors.blue)),
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(20),
      ),
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
                inputNewPwd,
                inputConfPwd,
                buttonConfPwd,
                buttonBack
              ],
            ),
          ),
        )
    );
  }
}
