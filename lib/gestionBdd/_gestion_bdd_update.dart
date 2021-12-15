import 'package:flutter/material.dart';
import 'bdd_controller.dart';
/*
class GestionBddUpdate extends StatelessWidget {
   GestionBddUpdate({
    Key? key,
  }) : super(key: key);

  final String title = "BDD Update";
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
                  child: const Text(
                    'update',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _update,
                ),
              ],
            ),
          ),
        ));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      BddController.columnId: 1,
      BddController.columnName: 'Mary',
      BddController.columnAge: 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }
}
*/