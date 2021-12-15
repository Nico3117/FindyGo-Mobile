import 'package:flutter/material.dart';

class MyFooter extends StatefulWidget {
  List<Widget> widgetsList;

  MyFooter({Key? key, required this.widgetsList}) : super(key: key);

  @override
  _MyFooter createState() => _MyFooter();
}

class _MyFooter extends State<MyFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
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
              splashColor: Colors.yellow,
              child: const Text(
                '\nCONDITIONS GENERALES DE VENTES',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.white),
              ),
              onTap: () => {Navigator.pushNamed(context, '/cgv')},
            ),
            InkWell(
              splashColor: Colors.yellow,
              child: const Text(
                '\nMENTIONS LEGALES',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Colors.white),
              ),
              onTap: () => {Navigator.pushNamed(context, '/mentionsLegales')},
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
                  SizedBox(
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
                            icon: const Icon(
                              Icons.audiotrack,
                              size: 20.0,
                            ),
                            color: const Color(0xFF162A49),
                            onPressed: () {},
                          ),
                        ),
                      )),
                  SizedBox(
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
                            icon: const Icon(
                              Icons.fingerprint,
                              size: 20.0,
                            ),
                            color: const Color(0xFF162A49),
                            onPressed: () {},
                          ),
                        ),
                      )),
                  SizedBox(
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
                            icon: const Icon(
                              Icons.call,
                              size: 20.0,
                            ),
                            color: const Color(0xFF162A49),
                            onPressed: () {},
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ]),
    );
  }
}
