import 'package:flutter/material.dart';

class SportCard extends StatelessWidget {
  const SportCard({this.name = "nom sport", this.route = "destination"});

  final String name;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffeeeeee), width: 0.0),
        color: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(0.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.white10,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.all(1),
      height: 50,
      width: 100,
      child: InkWell(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.white,
                  backgroundColor: Colors.black),
            ),
          ])
        ]),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
      /*Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            child: Center(
              child: Image.asset(
                url,
                //width: 20,
                height: 55,
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, route);
            },
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: Colors.black),
          ),
        ])*/
    );
  }
}
