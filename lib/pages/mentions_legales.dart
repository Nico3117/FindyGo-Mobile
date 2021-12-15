import 'package:findygo/widgets/nav_bar.dart';
import 'package:findygo/widgets/side_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

// Condition générales de vente
class MentionsLegales extends StatelessWidget {
  MentionsLegales({
    Key? key,
  }) : super(key: key);

  final String title = "Mentions légales";
  final Color backgroundColor = const Color.fromARGB(255, 111, 207, 151);

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
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 200.0),
            child: Center(
              child: Text('Mentions légales'),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Divider(),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.deepPurpleAccent,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text('1 - Saisie d\'un texte dans une TextField : '),
                ]),
          ),
        ],
        footer: Footer(
          backgroundColor: Colors.black,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'INFOS',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const Text(
                  'FindyGo\nN° SIRET : XXX XXX XXX\ncontact@finygo.fr\n\n',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Text(
                  'LEGAL',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  child:           const Text(
                  '\nCONDITIONS GENERALES DE VENTES',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                  onTap: () => {Navigator.pushNamed(context, '/search')},
                ),
                const Text(
                  '\nMENTIONS LEGALES',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Text(
                  '\nPOLITIQUE DE CONFIDENTIALITE',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Text(
                  '\nUTILISATION DES COOKIES\n\n',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Text(
                  'AIDE & CONTACT',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const Text(
                  'NOUS CONTACTER',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Text(
                  'SAV',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Text(
                  'SIGNALER UN PROBLEME\n\n',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Text(
                  'RESEAUX SOCIAUX',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 12.0,
                      color: Colors.white),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.audiotrack,
                                  size: 20.0,
                                ),
                                color: Color(0xFF162A49),
                                onPressed: () {},
                              ),
                            ),
                          )),
                      Container(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.fingerprint,
                                  size: 20.0,
                                ),
                                color: Color(0xFF162A49),
                                onPressed: () {},
                              ),
                            ),
                          )),
                      Container(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.call,
                                  size: 20.0,
                                ),
                                color: Color(0xFF162A49),
                                onPressed: () {},
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ]),
        ),
        flex: 9, //default flex is 2
      ),
    );
  }
}
