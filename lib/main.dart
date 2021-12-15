import 'package:findygo/pages/admin.dart';
import 'package:findygo/pages/admin_gestion_bdd.dart';
import 'package:findygo/pages/cgv.dart';
import 'package:findygo/pages/favorites.dart';
import 'package:findygo/pages/login.dart';
import 'package:findygo/pages/forgot_pwd.dart';
import 'package:findygo/pages/mentions_legales.dart';
import 'package:findygo/pages/search.dart';
import 'package:findygo/pages/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:findygo/constants/constantes.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'pages/_spalsh_screen_page.dart';
import 'gestionBdd/_gestion_bdd.dart';
import 'pages/subscribe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'FindyGo';

    return MaterialApp(
      debugShowCheckedModeBanner: ConstApp.ADMIN_MODE,
      title: appName,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 111, 207, 151),

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
          headline2: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(
              fontSize: 15.0,
              fontStyle: FontStyle.normal,
              color: Color.fromARGB(150, 0, 0, 0),
              backgroundColor: Color.fromARGB(255, 111, 207, 151)),
          subtitle1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          subtitle2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
          bodyText2: TextStyle(fontSize: 15.0, fontFamily: 'Hind'),
          caption: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
          button: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Hind',
              color: Color.fromARGB(150, 0, 0, 0),
              backgroundColor: Color.fromARGB(255, 111, 207, 151)),
          overline: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      home: const SplashScreenPage(),
      // home search login createAccount favorites wishlist
      routes: <String, WidgetBuilder>{
        // Main page routes
        '/home': (BuildContext context) => Home(),
        '/search': (BuildContext context) => Search(),
        '/login': (context) => Login(),
        //Login
        '/createAccount': (BuildContext context) => Subscribe(),
        '/favorites': (BuildContext context) => Favorites(),
        '/cart': (BuildContext context) => Cart(),

        // Miscellaneous routes
        '/forgotpwd': (context) => const ForgotPwdPage(title: "Password"),
        '/gestionBdd': (BuildContext context) => GestionBdd(),
        //'/gestionBddCreate': (BuildContext context) => CreateAccount(),//GestionBddCreate(),
        /*'/gestionBddRead': (BuildContext context) => GestionBddRead(),
        '/gestionBddUpdate': (BuildContext context) => GestionBddUpdate(),
        '/gestionBddDelete': (BuildContext context) => GestionBddDelete(),*/

        // Footer routes
        '/cgv': (BuildContext context) => CGV(),
        '/mentionsLegales': (BuildContext context) => MentionsLegales(),

        // Maintenance
        '/admin': (BuildContext context) => const Admin(),
        //'/adminGestionBdd': (BuildContext context) => AdminGestionBdd(),
      },
    );
  }
}
/*
        '/adminGestionBdd': (BuildContext context) => ChangeNotifierProvider(
          // //AdminGestionBdd(),
              create: (_) => ListeUser(0),
              child: const AdminGestionBdd(),
            ),
 */