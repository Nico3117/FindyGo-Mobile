import 'package:flutter/material.dart';
import 'bdd_controller.dart';
/*
class GestionBddRead extends StatelessWidget {
  GestionBddRead({Key? key}) : super(key: key);

  final String title = "";
  final Color backgroundColor = const Color.fromARGB(255, 111, 207, 151);


  // reference to our single class that manages the database
  final dbHelper = BddController.instance;

  // Widgets
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: backgroundColor,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary : const Color.fromARGB(255, 111, 207, 151),
                  ),
                  child: const Text('query', style: TextStyle(fontSize: 20),),
                  onPressed: _query,
                ),
              ],
            ),
          ),
        ));
  }
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
  }
}
*/