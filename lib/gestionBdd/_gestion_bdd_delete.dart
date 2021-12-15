import 'package:flutter/material.dart';
import 'bdd_controller.dart';
/*
class GestionBddDelete extends StatelessWidget {
  GestionBddDelete({
    Key? key,
  }) : super(key: key);

  final String title = "BDD Delete";
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
                    primary: const Color.fromARGB(255, 111, 207, 151),
                  ),
                  child: const Text(
                    'delete',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _delete,
                ),
              ],
            ),
          ),
        ));
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id!);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
*/