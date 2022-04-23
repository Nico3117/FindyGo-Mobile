import 'package:findygo/pages/favoris.dart';
import 'package:findygo/pages/intro_slider.dart';
import 'package:findygo/pages/login_page.dart';
import 'package:findygo/pages/forgot_pwd.dart';
import 'package:findygo/pages/publish_page.dart';
import 'package:findygo/pages/subscribe.dart';
import 'package:flutter/material.dart';
import 'package:findygo/constants/constantes.dart';
import 'bo/ArgsRoute.dart';
import 'constants/routes.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'FindyGo';


    return MaterialApp(
      // Affichage de la bannière Mode Debug
        debugShowCheckedModeBanner: ConstApp.ADMIN_MODE,
        title: appName,

        // Permet de basculer automatiquement entre le style bright ou dark de l'appareil
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,

          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: const Color.fromARGB(255, 111, 207, 151),
          //primarySwatch: Colors.white60,
          backgroundColor: Colors.white,

          // Define the default font family.
          fontFamily: 'Montserrat',

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          /*textTheme: const TextTheme(
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
        ),*/
        ),
        // Route initiale
        home: Home(),
        // home: const CheckConnexion(),

        // Routes sans paramètres
        routes: <String, WidgetBuilder>{
          ROUTE_SEARCH: (BuildContext context) => Home(),
          ROUTE_INTRO_SLIDER: (BuildContext context) => IntroScreenState(),
          ROUTE_PUBLISH: (BuildContext context) => PublishPage(),
          //'/search': (BuildContext context) => Search(),
          ROUTE_FAVORIS: (BuildContext context) => Favoris(),
          ROUTE_FORGOT_PASSWORD: (context) => ForgotPwdPage(),
        },

        // Routes avec passage de paramètres
        onGenerateRoute: (settings) {
          if (settings.name == ROUTE_ACCOUNT) {
            return MaterialPageRoute(
                builder: (BuildContext context) =>
                    LoginPage(settings.arguments as ArgsRoute));
          } else if (settings.name == ROUTE_SUBSCRIBE) {
            return MaterialPageRoute(
                builder: (BuildContext context) =>
                    Subscribe(settings.arguments as ArgsRoute));
          }
        }
    );
  }
}
