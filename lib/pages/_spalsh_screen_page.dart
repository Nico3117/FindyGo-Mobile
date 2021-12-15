import 'package:flutter/material.dart';
import 'package:findygo/constants/constantes.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';

import 'home.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Home(),
      backgroundColor: Colors.blueGrey,
      title: const Text(
        ConstApp.appName,
        textScaleFactor: 2,
      ),
      styleTextUnderTheLoader: const TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
      image: Image.asset('assets/pictures/logo.png'),
      loadingText: const Text("Chargement"),
      photoSize: 100.0,
      loaderColor: const Color.fromARGB(255, 111, 207, 151),
        useLoader: true,
    );
  }
}
