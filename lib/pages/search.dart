import 'package:findygo/widgets/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:findygo/constants/constantes.dart';
import 'package:findygo/widgets/side_menu_widget.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'footer.dart';

class Search extends StatelessWidget {
  Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Text('Rechercher'),
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
