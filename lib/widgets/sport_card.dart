import 'package:flutter/material.dart';

class SportCard extends StatelessWidget {
  const SportCard({this.name = "nom sport", this.url = "url", this.route = "destination"});

  final String name;
  final String url;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffeeeeee), width: 2.0),
          color: Colors.white38,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
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
        height: 80,
        width: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ]));
  }
}
