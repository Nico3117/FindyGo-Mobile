import 'dart:async';
import 'package:findygo/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:findygo/widgets/side_menu_widget.dart';

class AdminGestionBdd extends StatefulWidget {
  List<Map<String, dynamic>> mapUser0;

  AdminGestionBdd(
    this.mapUser0, {
    Key? key,
  }) : super(key: key);

  @override
  _AdminGestionBdd createState() => _AdminGestionBdd(); //(mapUser0);
}

class _AdminGestionBdd extends State<AdminGestionBdd> {
  //
  static TextEditingController myController1 = TextEditingController();
  static TextEditingController myController2 = TextEditingController();
  static TextEditingController myController3 = TextEditingController();
  static TextEditingController myController4 = TextEditingController();
  static TextEditingController myController5 = TextEditingController();
  static TextEditingController myController6 = TextEditingController();

  //
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    myController5.dispose();
    myController6.dispose();
    super.dispose();
  }

  final title = Form(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Text(
          "Données des clients : ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color.fromARGB(255, 111, 207, 151)), //Colors.green),
        ),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Divider(),
      ]));

  var input1 = Form(
    child: TextField(
      controller: myController1,
      readOnly: true,
      style: const TextStyle(
        fontSize: 10.0,
        height: 2.0,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Pseudo',
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    ),
  );
  var input2 = Form(
    child: TextField(
      controller: myController2,
      readOnly: true,
      style: const TextStyle(
        fontSize: 10.0,
        height: 2.0,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Pseudo',
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    ),
  );
  var input3 = Form(
    child: TextField(
      controller: myController3,
      readOnly: true,
      style: const TextStyle(
        fontSize: 10.0,
        height: 2.0,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Pseudo',
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    ),
  );
  var input4 = Form(
    child: TextField(
      controller: myController4,
      readOnly: true,
      style: const TextStyle(
        fontSize: 10.0,
        height: 2.0,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Pseudo',
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    ),
  );
  var input5 = Form(
    child: TextField(
      controller: myController5,
      readOnly: true,
      style: const TextStyle(
        fontSize: 10.0,
        height: 2.0,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Pseudo',
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    ),
  );
  var input6 = Form(
    child: TextField(
      controller: myController6,
      readOnly: true,
      style: const TextStyle(
        fontSize: 10.0,
        height: 2.0,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Pseudo',
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    //
    GestionDesPages bddAff = GestionDesPages(widget.mapUser0);
    Map<String, dynamic> mapUser0;
    //
    return Scaffold(
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.blueGrey,
          ),
          child: const NavDrawer(),
        ),
        backgroundColor: Colors.blueGrey,
        appBar: const NavBar(),
        body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              title,
              input1,
              input2,
              input3,
              input4,
              input5,
              input6,
            ]),
        bottomNavigationBar: BottomAppBar(
          color: const Color.fromARGB(255, 111, 207, 151),
          child: SizedBox(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () => {
                        bddAff.DecrementerPage(),
                        mapUser0 = bddAff.getMapUser0(),
                        myController1.text = 'id: ' + mapUser0['id'].toString(),
                        myController2.text =
                            'username: ' + mapUser0['username'].toString(),
                        myController3.text =
                            'firstname: ' + mapUser0['firstname'].toString(),
                        myController4.text =
                            'lastname: ' + mapUser0['lastname'].toString(),
                        myController5.text =
                            'email: ' + mapUser0['email'].toString(),
                        myController6.text =
                            'password: ' + mapUser0['password'].toString(),
                      },
                    ),
                    IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () => {
                              bddAff.IncrementPage(),
                              mapUser0 = bddAff.getMapUser0(),
                              myController1.text =
                                  'id: ' + mapUser0['id'].toString(),
                              myController2.text = 'username: ' +
                                  mapUser0['username'].toString(),
                              myController3.text = 'firstname: ' +
                                  mapUser0['firstname'].toString(),
                              myController4.text = 'lastname: ' +
                                  mapUser0['lastname'].toString(),
                              myController5.text =
                                  'email: ' + mapUser0['email'].toString(),
                              myController6.text = 'password: ' +
                                  mapUser0['password'].toString(),
                            }),
                  ])),
        ));
  }
}

class GestionDesPages {
  // Liste image de la table user en bdd
  List<Map<String, dynamic>> mapListUser0;
  Map<String, dynamic> mapUser0 = {};

  final _streamCtrl = StreamController<int>();
  int _compteur = 0;

  GestionDesPages(this.mapListUser0) {
    if (mapListUser0.isNotEmpty) {
      mapUser0 = mapListUser0[0];
    }
  }

  Sink<int> get sink => _streamCtrl.sink;

  Stream<int> get stream => _streamCtrl.stream;

  IncrementPage() {
    int nb = mapListUser0.length;
    if (_compteur < (mapListUser0.length - 1)) {
      _compteur++;
      mapUser0 = mapListUser0[_compteur];
      sink.add(_compteur);
    }
  }

  DecrementerPage() {
    if (_compteur >= 1) {
      _compteur--;
      mapUser0 = mapListUser0[_compteur];
      sink.add(_compteur);
    }
  }

  Map<String, dynamic> getMapUser0() => mapUser0;

  dispose() => _streamCtrl.close();
}
