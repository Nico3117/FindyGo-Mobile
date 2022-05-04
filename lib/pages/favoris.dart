import 'package:findygo/bo/Favorit.dart';
import 'package:findygo/constants/classe_images.dart';
import 'package:findygo/constants/routes.dart';
import 'package:findygo/widgets/bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Favoris extends StatefulWidget {
  Favoris({
    Key? key,
  }) : super(key: key);

  @override
  State<Favoris> createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {
  final String title = "FindyGo";

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
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10.0),
        child: AppBar(
          //leading: Container(child: const Text("Favoris", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontStyle: FontStyle.normal),)),
          leading: Container(),
          backgroundColor: Colors.white,
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
                          title: Text('Article de ' +
                              lstHomme.elementAt(index).firstname),
                          content: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child: Image.asset(
                                    lstHomme.elementAt(index).pictureUrl),
                              ),
                              Text(lstHomme.elementAt(index).shortDescription),
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
                color: Color(0xFFEBEBEB),
                elevation: 3.0,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          lstHomme.elementAt(index).lastname,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Image.asset(
                                lstHomme.elementAt(index).pictureUrl),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          lstHomme.elementAt(index).shortDescription,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          lstHomme.elementAt(index).price.toString() + '€',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
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
      indent: 5,
      endIndent: 5,
    );
  }

  Widget _buildTabBar() =>
      // Center(
      // child:
      DefaultTabController(
          length: 1,
          child: Scaffold(
            appBar: AppBar(
              leading: Container(),
              leadingWidth: 0,
              backgroundColor: Colors.white,
              // Color(0xFF000000)
              bottom: TabBar(
                indicatorWeight: 1,
                indicatorColor: Colors.grey,
                tabs: [
                  Tab(
                      child: Text(
                        AppLocalizations.of(context).favorites_page_favorites,
                    textAlign: TextAlign.left,
                  )),
                  // Tab(child: Text("Mes recherches")),
                ],
              ),
              title: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 1.0,
                color: Colors.white,
                child: SizedBox(
                  width: 80.0,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/pictures/logo2.png',
                      width: 50,
                      height: 150,
                    ),
                  ),
                ), //Image.asset(),
              ),
            ),
            body: TabBarView(
              children: [
                Center(child: _mesAnnonces()),
                // Center(child: Text("Transit")),
              ],
            ),
          )
          //)
          );
}
