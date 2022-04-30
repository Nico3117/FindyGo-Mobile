import 'package:findygo/bo/Favorit.dart';
import 'package:findygo/constants/classe_images.dart';
import 'package:findygo/constants/routes.dart';
import 'package:findygo/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class Favoris extends StatefulWidget {
  Favoris({
    Key? key,
  }) : super(key: key);

  @override
  State<Favoris> createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {
  final String title = "FindyGo";

//  final Color backgroundColor = const Color.fromARGB(255, 111, 207, 151);

  // index de la bottomAppBar
  int _currentIndexBottomAppBar = 0;

  List<Favorit> lstHomme = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _currentIndexBottomAppBar = 1;
    lstHomme = ImagesTests.fetchListeFavoris("Homme");
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Build -------------------------------------------------
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          //leading: Container(child: const Text("Favoris", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontStyle: FontStyle.normal),)),
          leading: Container(),
          backgroundColor: const Color(0x00000000),
          elevation: 0,
        ),
      ),
      body: _buildTabBar(),
      bottomNavigationBar: MyBottomBar(1),
    );
  }

  /// Widgets ------------------------------------------------
  ///

  Widget _mesAnnonces() => GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: lstHomme.length,
        itemBuilder: (context, index) {
          // Variable intermédiaire pour diminuer la longueur de la variable
          var _item = lstHomme[index];

          return GestureDetector(
              onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                          title: Text('Voulez-vous réserver pour le ' +
                              lstHomme.elementAt(index).firstname),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                    lstHomme.elementAt(index).pictureUrl),
                              ),
                              const Text(
                                  '10% de remise pour une réservation à partir de 4 nuits.'),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ])),
              child: Card(
                // color: Colors.teal,
                elevation: 3.0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                                lstHomme.elementAt(index).pictureUrl),
                          )),
                      _buildDivider(),
                      Text(
                        _item.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      _buildDivider(),
                      Text(
                        lstHomme.elementAt(index).lastname,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 8),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ));
        },
      );

  Divider _buildDivider() {
    return const Divider(
      color: Colors.white,
      indent: 10,
      endIndent: 10,
    );
  }

  Widget _buildTabBar() => Center(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(child: Text("Mes annonces")),
                  Tab(child: Text("Mes recherches")),
                ],
              ),
              title: const Text('Favoris'),
            ),
            body: TabBarView(
              children: [
                Center(child: _mesAnnonces()),
                Center(child: Text("Transit")),
              ],
            ),
          )));

  Widget _bottomNavBar() => Theme(
      data: Theme.of(context).copyWith(
          //   canvasColor: Colors.orange,
          //      primaryColor: Colors.deepPurple,
          /*    textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: const TextStyle(color: Colors.yellow))*/
          ),
      child: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        //selectedItemColor: const Color.fromARGB(255, 111, 207, 151),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 1,
        currentIndex: _currentIndexBottomAppBar,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.search),
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Rechercher',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite_border),
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.publish_outlined),
            icon: Icon(
              Icons.publish_outlined,
              color: Colors.black,
            ),
            label: 'Publier',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.chat),
            icon: Icon(
              Icons.chat,
              color: Colors.black,
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.account_circle_outlined),
            icon: Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
            label: 'Compte',
          ),
        ],
      ));

  void _onItemTapped(int index) {
    setState(() {
      _currentIndexBottomAppBar = index;

      switch (index) {
        case 0:
          {
            Navigator.of(context).pushReplacementNamed(ROUTE_SEARCH);
          }
          break;

        case 1:
          {
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
            Navigator.of(context).pushReplacementNamed(ROUTE_ACCOUNT);
          }
          break;
        default:
          print("index = " + index.toString());
      }
    });
  }
}
