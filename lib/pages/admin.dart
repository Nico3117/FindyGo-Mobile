import 'package:findygo/constants/constant_bdd.dart';
import 'package:findygo/gestionBdd/table_models/sqlite_db.dart';
import 'package:findygo/widgets/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:findygo/widgets/side_menu_widget.dart';

import 'admin_gestion_bdd.dart';

class Admin extends StatefulWidget {
  const Admin({
    Key? key,
  }) : super(key: key);

  @override
  _Admin createState() => _Admin();
}

class _Admin extends State<Admin> {
  late SqliteDB provider;

  // Méthodes

  Future<SqliteDB> getInstance() async {
    return provider = SqliteDB.instance;
  }

  @override
  void initState() {
    super.initState();
    getInstance();
  }

  @override
  void dispose() {
    super.dispose();
    provider.close();
  }

  @override
  Widget build(BuildContext context) {
    final connexionButton = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
          child: const Text('Gestion de la BDD',
              style: TextStyle(color: Colors.white, fontSize: 20)),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF6FCF97),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () async {
            // Récupère la liste des user de la table user
            var mapUser0 = await provider.getAll(TableNames.TUSER);

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>
                    AdminGestionBdd(mapUser0))
            );

            /*Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        AdminGestionBdd(mapUser0)));
            //'/adminGestionBdd');
            */
          }),
    );

    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.blueGrey,
        ),
        child: const NavDrawer(),
      ),
      backgroundColor: Colors.blueGrey,
      appBar: const NavBar(),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50, bottom: 10)),
            const Text('Maintenance de la BDD',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            const Divider(),
            connexionButton,
          ]),
    );
  }
}
