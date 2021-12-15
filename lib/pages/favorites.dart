import 'package:findygo/widgets/nav_bar.dart';
import 'package:findygo/widgets/side_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'footer.dart';
import 'tiledata.dart';

class Favorites extends StatelessWidget {
  Favorites({
    Key? key,
  }) : super(key: key);

  final String title = "FindyGo";
  final Color backgroundColor = const Color.fromARGB(255, 111, 207, 151);

  @override
  Widget build(BuildContext context) {


    var largeurEcran = MediaQuery.of(context).size.width;
    var hauteurEcran = MediaQuery.of(context).size.height;


    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.blueGrey,
        ),
        child: const NavDrawer(),
      ),
      backgroundColor: Colors.blueGrey,
      appBar: const NavBar(),
      body: FooterView(
          flex: 5,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text('Mes favoris'),
              ),
            ),
          ],
          footer: Footer(
            backgroundColor: Colors.black,
            child: MyFooter(
              widgetsList: const [],
            ),
          )),
    );
  }
}

