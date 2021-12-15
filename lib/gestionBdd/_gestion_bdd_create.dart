import 'package:flutter/material.dart';
import 'bdd_controller.dart';
import 'dart:async';
/*
class GestionBddCreate extends StatelessWidget {
  GestionBddCreate({
    Key? key,
  }) : super(key: key);

  final String title = "Gestion BDD";
  final Color backgroundColor = const Color.fromARGB(255, 111, 207, 151);

  // reference to our single class that manages the database
  final dbHelper = BddController.instance;

  // Widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: backgroundColor,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 111, 207, 151),
                  ),
                  child: const Text(
                    'insert',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _insert,
                ),
              ],
            ),
          ),
        ));
  }

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      "username": "JD",
      "firstname": "John",
      "lastname": "Doe",
      "email": "john.doe@gmail.fr",
      "password": "mp1234",
      "roles": "admin",
      "phone": "0606060606",
      "postal_address": "3 rue ...",
      "additional_address": "Square de ...",
      "postal_code": "44300",
      "city": "Nantes",
      "department": "44",
      "country": "France",
      "picture_profil": "Une image",
      "creation_datetime": "01-12-2021",
      "update_datetime": "02-12-2021",
      "is_verified": "Oui",
    };
    final id = await dbHelper.insert(row);

    row.forEach((key, value){
      print('Key: $key');
      print('Value: $value');
      print('------------------------------');
    });

    //for(var w in row)
      //print('+++++++++++++++++++++++++++++++++++++++ inserted row id: $w');
  }
}
*/