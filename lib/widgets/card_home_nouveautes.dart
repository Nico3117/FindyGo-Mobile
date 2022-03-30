import 'package:findygo/constants/routes.dart';
import 'package:flutter/material.dart';

import '../bo/Favorit.dart';

/// Représente une carte affichant les détails d'un nouvel article sur la page d'acceuil
class CardHomeNouveautes extends StatelessWidget {
  Favorit listeDesNouveautes;

  CardHomeNouveautes(this.listeDesNouveautes);

  @override
  Widget build(BuildContext context) {
    TextStyle tailleTitre = new TextStyle(
        fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.black);

    TextStyle tailleTaille = new TextStyle(
        fontWeight: FontWeight.bold, fontSize: 8.0, color: Colors.black);

    TextStyle tailleMarque = new TextStyle(
        fontWeight: FontWeight.bold, fontSize: 8.0, color: Colors.black);

    TextStyle taillePrix = new TextStyle(
        fontWeight: FontWeight.bold, fontSize: 10.0, color: Colors.black);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      InkWell(
        child: Center(
          child: Image.asset(
            listeDesNouveautes.pictureUrl,
            //width: 20,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, ROUTE_HOME);
        },
      ),
      const SizedBox(
        height: 4.0,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDivider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              listeDesNouveautes.shortDescription,
              style: tailleTitre,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
          ]),
          _buildDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Taille: " + listeDesNouveautes.taille,
                style: tailleTaille,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              ),
              Text(
                "Marque: " + listeDesNouveautes.marque,
                style: tailleMarque,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              ),
            ],
          ),
          _buildDivider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Prix: " + listeDesNouveautes.price.toString() + " euros",
                style: taillePrix,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            )
          ])
        ],
      )
    ]);
  }

  Divider _buildDivider() {
    return const Divider(
      color: Colors.white,
      indent: 10,
      endIndent: 10,
    );
  }
}
