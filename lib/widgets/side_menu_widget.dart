import 'package:findygo/constants/constantes.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bpAdminVisible = true; //debugShowCheckedModeBanner;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'FindyGo',
              style: TextStyle(
                  color: Color.fromARGB(255, 111, 207, 151), fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/pictures/logo.png'))),
          ),
          ListTile(
            // search person_outline favorite_border shopping_cart_outlined
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () => {Navigator.pushNamed(context, '/home')},
          ),
          ListTile(
            // search person_outline favorite_border shopping_cart_outlined
            leading: const Icon(Icons.search),
            title: const Text('Panier'),
            onTap: () => {Navigator.pushNamed(context, '/cart')},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Articles sauvegardés'),
            onTap: () => {Navigator.pushNamed(context, '/favorites')},
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Mon compte'),
            onTap: () => {Navigator.pushNamed(context, '/login')},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Réglages'),
            onTap: () => {Navigator.pushNamed(context, '/home')},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Aid et FAQ'),
            onTap: () => {Navigator.pushNamed(context, '/home')},
          ),
          Visibility(
            child: ListTile(
              // debugShowCheckedModeBanner
              leading: const Icon(Icons.admin_panel_settings_outlined),
              title: const Text('Administration'),
              onTap: () => {Navigator.pushNamed(context, '/admin')},
            ),
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: ConstApp.ADMIN_MODE,
          ),
          const Divider(),
          const Text(
            "       Version de l'appli 1.0.0 (12410)",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 10),
          ),
        ],
      ),
    );
  }
}
