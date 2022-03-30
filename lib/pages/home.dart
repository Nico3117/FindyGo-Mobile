import 'dart:developer';
import 'package:findygo/bo/Favorit.dart';
import 'package:findygo/constants/classe_images.dart';
import 'package:findygo/constants/routes.dart';
import 'package:findygo/utils/helpers/server_exchanges.dart';
import 'package:findygo/widgets/bottom_bar.dart';
import 'package:findygo/widgets/favorite_view_card.dart';
import 'package:findygo/widgets/sport_card.dart';
import 'package:flutter/material.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter_svg/svg.dart';

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
  //late StreamController<List<Sport>> _streamControllerListeSports;
  //late Stream<List<Sport>> _streamSport;

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
              height: 38,
              width: MediaQuery.of(context).size.width * 1.0,
              color: Colors.white,
              child: const Text(
                "FindyGo",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 111, 207, 151)),
              ),
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
          width: MediaQuery.of(context).size.width * 0.7,
          color: Colors.white,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Rechercher sur FindyGo",
              hintText: "Rechercher sur FindyGo",
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFF0000)),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
            validator: (value) {
              if (value != null) {
                return 'Veuillez saisir un texte';
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
                child: const Text("Catégories",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    SportCard(
                        name: "arc",
                        url: "assets/pictures/png/icones_des_sports/arc.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "badminton",
                        url:
                            "assets/pictures/png/icones_des_sports/badminton.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "baseball",
                        url:
                            "assets/pictures/png/icones_des_sports/baseball.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "basket",
                        url: "assets/pictures/png/icones_des_sports/basket.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "billard",
                        url:
                            "assets/pictures/png/icones_des_sports/billard.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "bowling",
                        url:
                            "assets/pictures/png/icones_des_sports/bowling.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "boxe",
                        url: "assets/pictures/png/icones_des_sports/boxe.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "corde à sauter",
                        url:
                            "assets/pictures/png/icones_des_sports/corde_a_sauter.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "echec",
                        url: "assets/pictures/png/icones_des_sports/echec.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "escrime",
                        url:
                            "assets/pictures/png/icones_des_sports/escrime.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "flechette",
                        url:
                            "assets/pictures/png/icones_des_sports/flechette.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "foot",
                        url: "assets/pictures/png/icones_des_sports/foot.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "golf",
                        url: "assets/pictures/png/icones_des_sports/golf.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "gym",
                        url: "assets/pictures/png/icones_des_sports/gym.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "hockey",
                        url: "assets/pictures/png/icones_des_sports/hockey.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "jet-ski",
                        url:
                            "assets/pictures/png/icones_des_sports/jet-ski.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "judo",
                        url: "assets/pictures/png/icones_des_sports/judo.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "kayak",
                        url: "assets/pictures/png/icones_des_sports/kayak.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "moto",
                        url: "assets/pictures/png/icones_des_sports/moto.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "muscu",
                        url: "assets/pictures/png/icones_des_sports/muscu.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "natation",
                        url:
                            "assets/pictures/png/icones_des_sports/natation.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "nunchaku",
                        url:
                            "assets/pictures/png/icones_des_sports/nunchaku.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "parachute",
                        url:
                            "assets/pictures/png/icones_des_sports/parachute.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "patin à glace",
                        url:
                            "assets/pictures/png/icones_des_sports/patin_a_glace.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "ping_pong",
                        url:
                            "assets/pictures/png/icones_des_sports/ping_pong.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "plongee",
                        url:
                            "assets/pictures/png/icones_des_sports/plongee.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "rugby",
                        url: "assets/pictures/png/icones_des_sports/rugby.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "skate",
                        url: "assets/pictures/png/icones_des_sports/skate.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "ski",
                        url: "assets/pictures/png/icones_des_sports/ski.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "surf",
                        url: "assets/pictures/png/icones_des_sports/surf.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "tennis",
                        url: "assets/pictures/png/icones_des_sports/tennis.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "velo",
                        url: "assets/pictures/png/icones_des_sports/velo.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "voile",
                        url: "assets/pictures/png/icones_des_sports/voile.png",
                        route: ROUTE_SEARCH),
                    SportCard(
                        name: "volley",
                        url: "assets/pictures/png/icones_des_sports/volley.png",
                        route: ROUTE_SEARCH),
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(4),
                //color: const Color.fromARGB(255, 111, 207, 151),
                margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Annonces fraichements publiées",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ]))),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView(
                  reverse: false,
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(4),
                        color: const Color.fromARGB(255, 111, 207, 151),
                        margin: const EdgeInsets.only(
                            left: 8, top: 0, right: 8, bottom: 2),
                        child: const Text(
                          "Sport",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        )),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      height: 314,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: lstSport.length,
                          itemBuilder: (context, index) {
                            final _item = lstSport[index];

                            return SizedBox(
                                width: 150,
                                child: FavoriteViewCard(
                                    _item.firstname,
                                    _item.lastname,
                                    _item.shortDescription,
                                    _item.pictureUrl,
                                    _item.pictureCustomer,
                                    _item.price,
                                    _item.marque,
                                    _item.taille,
                                    _item.customerRate,
                                    _item.like));
                          }),
                    ),
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(4),
                        color: Colors.green,
                        margin:
                            const EdgeInsets.only(left: 8, top: 8, right: 8),
                        child: const Text(
                          "Femme",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        )),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      height: 314,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: lstFemme.length,
                          itemBuilder: (context, index) {
                            final _item = lstFemme[index];

                            return SizedBox(
                                width: 150,
                                child: FavoriteViewCard(
                                    _item.firstname,
                                    _item.lastname,
                                    _item.shortDescription,
                                    _item.pictureUrl,
                                    _item.pictureCustomer,
                                    _item.price,
                                    _item.marque,
                                    _item.taille,
                                    _item.customerRate,
                                    _item.like));
                          }),
                    ),
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(4),
                        color: const Color.fromARGB(255, 111, 207, 151),
                        margin:
                            const EdgeInsets.only(left: 8, top: 8, right: 8),
                        child: const Text(
                          "Homme",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        )),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      height: 314,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: lstHomme.length,
                          itemBuilder: (context, index) {
                            final _item = lstHomme[index];

                            return SizedBox(
                                width: 150,
                                child: FavoriteViewCard(
                                    _item.firstname,
                                    _item.lastname,
                                    _item.shortDescription,
                                    _item.pictureUrl,
                                    _item.pictureCustomer,
                                    _item.price,
                                    _item.marque,
                                    _item.taille,
                                    _item.customerRate,
                                    _item.like));
                          }),
                    ),
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(4),
                        color: const Color.fromARGB(255, 111, 207, 151),
                        margin:
                            const EdgeInsets.only(left: 8, top: 8, right: 8),
                        child: const Text(
                          "Enfant",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        )),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      height: 314,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: lstEnfant.length,
                          itemBuilder: (context, index) {
                            final _item = lstEnfant[index];

                            return SizedBox(
                                width: 150,
                                child: FavoriteViewCard(
                                    _item.firstname,
                                    _item.lastname,
                                    _item.shortDescription,
                                    _item.pictureUrl,
                                    _item.pictureCustomer,
                                    _item.price,
                                    _item.marque,
                                    _item.taille,
                                    _item.customerRate,
                                    _item.like));
                          }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
            ]),
          ),
        ),
      ]);
}
