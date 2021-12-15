import 'package:flutter/material.dart';

double mainTab = 150;

class TileData extends StatefulWidget {
  List<Widget> widgetsList;

  TileData({required this.widgetsList});

  @override
  _TileDataState createState() => _TileDataState();
}

class _TileDataState extends State<TileData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200 - 15.0,
      width: mainTab - 10.0,
        decoration: const BoxDecoration(
            color: Colors.green),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
        child: Column(
          children: widget.widgetsList,
        ),
      ),
    );
  }
}
