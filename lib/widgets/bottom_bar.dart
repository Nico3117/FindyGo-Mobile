import 'package:findygo/bo/ArgsRoute.dart';
import 'package:findygo/constants/routes.dart';
import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {

  // index de la bottomAppBar
  int currentIndexBottomAppBar = 0;

   MyBottomBar(this.currentIndexBottomAppBar, {Key? key} ) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {

  // index de la bottomAppBar
  int _currentIndexBottomAppBar = 0;

  @override
  void initState() {
    super.initState();
    _currentIndexBottomAppBar = widget.currentIndexBottomAppBar;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _bottomNavBar();
  }

  Widget _bottomNavBar() =>
      Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.orange,
              primaryColor: Colors.deepPurple,
              textTheme: Theme.of(context).textTheme.copyWith(caption: const TextStyle(color: Colors.yellow))),
          child: BottomNavigationBar(
            unselectedItemColor: const Color(0xffC1D2D9),
            selectedItemColor: const Color(0xff4C5059),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 1,
            currentIndex: _currentIndexBottomAppBar,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon:
                Icon(Icons.search, color: const Color(0xff4C5059)),
                icon: Icon(
                  Icons.search,
                  color: const Color(0xff4C5059),
                ),
                label: 'Rechercher',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite_border,
                    color: const Color(0xff4C5059)),
                icon: Icon(
                  Icons.favorite_border,
                  color: const Color(0xff4C5059),
                ),
                label: 'Favoris',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.publish_outlined,
                    color: const Color(0xff4C5059)),
                icon: Icon(
                  Icons.add_circle_outlined,//publish_outlined
                  color: const Color(0xff4C5059),
                ),
                label: 'Publier',
              ),
              BottomNavigationBarItem(
                activeIcon:
                Icon(Icons.chat, color: const Color(0xff4C5059)),
                icon: Icon(
                  Icons.chat,
                  color: const Color(0xff4C5059),
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.account_circle_outlined,
                    color: const Color(0xff4C5059)),
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: const Color(0xff4C5059),
                ),
                label: 'Compte',
              ),
            ],
          ));

  void _onItemTapped(int index) {
    setState(() {
      //widget.currentIndexBottomAppBar = index;

      switch (index) {
        case 0:
          {
            Navigator.of(context).pushReplacementNamed(ROUTE_SEARCH);
          }
          break;

        case 1:
          {
            // Récupère le token


            Navigator.of(context).pushReplacementNamed(ROUTE_FAVORIS);
          }
          break;
        case 2:
          {
            Navigator.of(context).pushReplacementNamed(ROUTE_PUBLISH);
          }
          break;

        case 3:
          {
            Navigator.of(context).pushReplacementNamed(ROUTE_MESSAGES);
          }
          break;
        case 4:
          {
            ArgsRoute _ags = new ArgsRoute("From some where");
            Navigator.of(context).pushNamed(ROUTE_ACCOUNT, arguments: _ags);
          }
          break;
        default:
          Navigator.of(context).pushReplacementNamed(ROUTE_SEARCH);
      }
    });
  }
}