import 'package:findygo/pages/checkConnexion.dart';
import 'package:findygo/pages/favoris.dart';
import 'package:findygo/pages/intro_slider.dart';
import 'package:findygo/pages/login_page.dart';
import 'package:findygo/pages/forgot_pwd.dart';
import 'package:findygo/pages/publish_page.dart';
import 'package:findygo/pages/subscribe.dart';
import 'package:findygo/theme/theme_constants.dart';
import 'package:findygo/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:findygo/constants/constantes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bo/ArgsRoute.dart';
import 'constants/routes.dart';
import 'pages/home.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'FindyGo';

    return MaterialApp(
        // Commande pour générer flutter_gen: "flutter gen-l10n"
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('fr', ''),
        ],
        // Affichage de la bannière Mode Debug
        debugShowCheckedModeBanner: ConstApp.ADMIN_MODE,
        title: appName,

    //    theme: lightTheme,
    //    darkTheme: darkTheme,
    //    themeMode: ThemeMode.system,
        // ThemeMode.system "pour changer le thème en fonction du mode du téléphone"
        //themeMode: _themeManager.themeMode,
        //
        // home: Home(),
        home: const CheckConnexion(),

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
        });
  }
}
