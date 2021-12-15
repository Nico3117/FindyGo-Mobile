import 'package:flutter/material.dart';
import 'package:findygo/constants/constantes.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget{
  const NavBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => new Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context) {

    var toolbarHeight = 40.0;

    return
      AppBar(
        title: SizedBox(
          height: toolbarHeight,
          child: Image.asset('assets/pictures/logo.png'),
        ),
        toolbarHeight: toolbarHeight,//Text("FindyGo"),
        backgroundColor: const Color.fromARGB(255, 111, 207, 151),
        actions: <Widget>[
          Visibility(
            child: IconButton(
              icon: const Icon(Icons.admin_panel_settings_outlined),
              onPressed: () => {Navigator.pushNamed(context, '/admin')},
            ),
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: ConstApp.ADMIN_MODE,
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => {Navigator.pushNamed(context, '/home')},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () => {Navigator.pushNamed(context, '/favorites')},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => {Navigator.pushNamed(context, '/search')},
          ),
        ]
      );
  }
}
