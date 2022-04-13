import 'package:findygo/bo/Favorit.dart';
import 'package:findygo/constants/classe_images.dart';
import 'package:findygo/constants/routes.dart';
import 'package:findygo/widgets/bottom_bar.dart';
import 'package:findygo/widgets/sport_card.dart';
import 'package:flutter/material.dart';

//import '../helpers/AppLocalizations.dart';
import '../widgets/card_home_nouveautes.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String title = "FindyGo";

  final Color backgroundColor = const Color.fromARGB(255, 111, 207, 151);

  // Est-ce que l'utilisateur est loggé
  late String? token;
  late bool isTokenValide;

  // Largeur icone boutton pour choisir un sport sur la page d'accueil
  double largeIconSport = 100;
  String adresseIconesSports = "assets/pictures/png/icones_des_sports/";

  // index de la bottomAppBar
  int _currentIndexBottomAppBar = 0;

  // Utilisation d'un Stream pour bufferiser les villes
  List<String> lstDesMenu = List.empty(growable: true);
  List<Favorit> lstSport = List.empty(growable: true);
  List<Favorit> lstFemme = List.empty(growable: true);
  List<Favorit> lstHomme = List.empty(growable: true);
  List<Favorit> lstEnfant = List.empty(growable: true);

  TabBar createTabBar() {
    return TabBar(
      tabs: [
        Row(children: const [SizedBox(width: 5), Text("Car")]),
        Row(children: const [SizedBox(width: 5), Text("Transit")]),
        Row(children: const [SizedBox(width: 5), Text("Bike")]),
        Row(children: const [SizedBox(width: 5), Text("Boat")]),
        Row(children: const [SizedBox(width: 5), Text("Railway")]),
        Row(children: const [SizedBox(width: 5), Text("Bus")]),
      ],
      isScrollable: true,
    );
  }

  // Liste des menu
  List<String> _fetchListeMenu() {
    List<String> lstDesMenu = List.empty(growable: true);

    lstDesMenu.add("Sport");
    lstDesMenu.add("Femme");
    lstDesMenu.add("Homme");
    lstDesMenu.add("Enfant");
    lstDesMenu.add("F.A.Q");
    lstDesMenu.add("A propos");
    return lstDesMenu;
  }

  @override
  void initState() {
    super.initState();
    lstDesMenu = _fetchListeMenu();
    lstSport = ImagesTests.fetchListeFavoris("Sport");
    lstFemme = ImagesTests.fetchListeFavoris("Femme");
    lstHomme = ImagesTests.fetchListeFavoris("Homme");
    lstEnfant = ImagesTests.fetchListeFavoris("Enfant");
    _currentIndexBottomAppBar = 0;
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
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          leading: Container(),
          backgroundColor: const Color(0x00000000),
          elevation: 0,
        ),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Container(
              height: 10,
              color: Colors.white,
            ),
            Container(
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
              /* const Text(
                "FindyGo",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 111, 207, 151)),
              ),
              */
            ),
          ]),
          _body(context),
        ]),
      ),
      bottomNavigationBar: MyBottomBar(0),
    );
  }

  /// Widgets ------------------------------------------------
  ///

  Widget _buildPasswordField() => Center(
      child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.95,
          color: Colors.white,
          child: TextFormField(
            decoration: InputDecoration(
              labelText:
                  "AppLocalizations.of(context)?.translate3('home', 'rechercher_sur_findygo').toString()",
              hintText:
                  "AppLocalizations.of(context)!.translate3('home', 'rechercher_sur_findygo').toString()",
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFF0000)),
                borderRadius: BorderRadius.all(Radius.circular(1.0)),
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            validator: (value) {
              if (value != null) {
                return "AppLocalizations.of(context)!.translate3('home', 'veuillez_saisir_du_texte')";
              }
              return null;
            },
          )));

  Widget _body(BuildContext context) => CustomScrollView(slivers: [
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 50,
                child: null,
              ),
            ]))),
        SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            leading: Container(),
            expandedHeight: 40,
            collapsedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Container(
                  color: Colors.white,
                  height: 300,
                  child: _buildPasswordField(),
                ))),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.all(4.0),
                alignment: Alignment.centerLeft,
                child: Text(
                    "AppLocalizations.of(context)!.translate3('home', 'retrouve_tes_sports_prefere')",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    SportCard(name: "arc", route: ROUTE_SEARCH),
                    SportCard(name: "badminton", route: ROUTE_SEARCH),
                    SportCard(name: "baseball", route: ROUTE_SEARCH),
                    SportCard(name: "basket", route: ROUTE_SEARCH),
                    SportCard(name: "billard", route: ROUTE_SEARCH),
                    SportCard(name: "bowling", route: ROUTE_SEARCH),
                    SportCard(name: "boxe", route: ROUTE_SEARCH),
                    SportCard(name: "corde à sauter", route: ROUTE_SEARCH),
                    SportCard(name: "echec", route: ROUTE_SEARCH),
                    SportCard(name: "escrime", route: ROUTE_SEARCH),
                    SportCard(name: "flechette", route: ROUTE_SEARCH),
                    SportCard(name: "foot", route: ROUTE_SEARCH),
                    SportCard(name: "golf", route: ROUTE_SEARCH),
                    SportCard(name: "gym", route: ROUTE_SEARCH),
                    SportCard(name: "hockey", route: ROUTE_SEARCH),
                    SportCard(name: "jet-ski", route: ROUTE_SEARCH),
                    SportCard(name: "judo", route: ROUTE_SEARCH),
                    SportCard(name: "kayak", route: ROUTE_SEARCH),
                    SportCard(name: "moto", route: ROUTE_SEARCH),
                    SportCard(name: "muscu", route: ROUTE_SEARCH),
                    SportCard(name: "natation", route: ROUTE_SEARCH),
                    SportCard(name: "nunchaku", route: ROUTE_SEARCH),
                    SportCard(name: "parachute", route: ROUTE_SEARCH),
                    SportCard(name: "patin à glace", route: ROUTE_SEARCH),
                    SportCard(name: "ping_pong", route: ROUTE_SEARCH),
                    SportCard(name: "plongee", route: ROUTE_SEARCH),
                    SportCard(name: "rugby", route: ROUTE_SEARCH),
                    SportCard(name: "skate", route: ROUTE_SEARCH),
                    SportCard(name: "ski", route: ROUTE_SEARCH),
                    SportCard(name: "surf", route: ROUTE_SEARCH),
                    SportCard(name: "tennis", route: ROUTE_SEARCH),
                    SportCard(name: "velo", route: ROUTE_SEARCH),
                    SportCard(name: "voile", route: ROUTE_SEARCH),
                    SportCard(name: "volley", route: ROUTE_SEARCH),
                  ],
                ),
              ),
              //const SizedBox(height: 2),
            ]),
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    //width: 50,
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "AppLocalizations.of(context)!.translate3('home', 'nouveautes')",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //width: 50,
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        child: Text(
                          "AppLocalizations.of(context)!.translate3('home', 'voir_plus')",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        onTap: () =>
                            //TODO: lien à changer
                            Navigator.of(context)
                                .pushReplacementNamed(ROUTE_FAVORIS)),
                  ),
                ],
              ),
            ]))),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.9,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              // Récupère un
              Favorit unFavoris = lstHomme.elementAt(index);
              return _gridViewAcceuilNouveaute(unFavoris);
            },
            childCount: 6,
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                //height: 50,
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: InkWell(
                      child: Text("AppLocalizations.of(context).",
                          textAlign: TextAlign.center),
                      onTap: () =>
                          //TODO: lien à changer
                          Navigator.of(context)
                              .pushReplacementNamed(ROUTE_FAVORIS)),
                ),
              ),
            ]))),
      ]);

  Widget _gridViewAcceuilNouveaute(listeDesNouveautes) => Card(
        color: Colors.black12,
        elevation: 0.0,
        child: Container(
          padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
          child: CardHomeNouveautes(listeDesNouveautes),
        ),
      );

  Divider _buildDivider() {
    return const Divider(
      color: Colors.white,
      indent: 10,
      endIndent: 10,
    );
  }
}
