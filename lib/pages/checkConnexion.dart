import 'dart:async';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:findygo/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnexion extends StatefulWidget {
  const CheckConnexion({Key? key}) : super(key: key);

  @override
  State<CheckConnexion> createState() => _CheckConnexionState();
}

class _CheckConnexionState extends State<CheckConnexion> {
  // Est-ce la première fois que l'application est lancée
  // Permet de gérer si l'on affiche l'Intro Slider ou pas
  late String? isFirstTimeAppOpened;

  // Etat sur la possibilité de se connecter au réseau téléphone/wifi/bluethoot/none, etc
  ConnectivityResult _connectionStatus = ConnectivityResult.none;

  // Ecouteur de l'état de la connectivité
  final Connectivity _connectivity = Connectivity();

  // Stream de la connectivité
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    // Récupère une instance des SharedPreferences
    const _storage = FlutterSecureStorage();
    isFirstTimeAppOpened = await _storage.read(key: "isFirstTimeAppOpened");

    setState(() {
      _connectionStatus = result;

      // Si il n'y a pas de réseau wifi ou téléphone, on affiche un message
      if (_connectionStatus != ConnectivityResult.mobile &&
          _connectionStatus != ConnectivityResult.wifi) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                content: const Text("Pas de connexion Internet",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
                actions: [
                  FlatButton(
                      child: const Text(
                        "Ok",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        // Quitte l'application lorsque l'utilisateur presse OK
                        SystemNavigator.pop();
                        exit(0);
                      }),
                ],
              );
            });
      } else {
        // Si au moins le réseau téléphone ou le wifi est disponible,
        // On récupère les SharedPréférences pour savoir si c'est la première fois que l'application est installée,
        // et si oui, on affiche un Intro Slider résumant le but de l'application et la phylosophie de FindyGo

        // Si c'est la première fois que l'on lance l'application sur
        // le terminal, afficher l'Intro Slider
        if (true) { // isFirstTimeAppOpened == "false"
          // Aller à la page Home
          Navigator.of(context).pushNamed(ROUTE_SEARCH);
          // String? monJwt = await all. storage.read(key: "jwt");
        } else {
          // Sinon, aller directement à la page Home
          Navigator.of(context).pushNamed(ROUTE_INTRO_SLIDER);
        }
      }
    });

    // Met à jour comme quoi l'Intro Slider à été vu une première fois
    await _storage.write(key: "isFirstTimeAppOpened", value: "true");

  }

  @override
  void dispose() {
    // Libère le Stream de connectivité
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(),
        ));
  }
}
