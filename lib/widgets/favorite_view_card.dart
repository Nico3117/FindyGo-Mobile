import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoriteViewCard extends StatefulWidget {
  FavoriteViewCard(this.firstname, this.lastname, this.shortDescription, this.pictureUrl, this.pictureCustomer, this.price, this.marque, this.taille,
      this.customerRate, this.like,
      {Key? key})
      : super(key: key);

  String firstname;
  String lastname;
  String shortDescription;
  String pictureUrl;
  String pictureCustomer;
  int price;
  String taille;
  String marque;
  double customerRate;
  bool like;

  @override
  _FavoriteViewCardState createState() => _FavoriteViewCardState();
}

class _FavoriteViewCardState extends State<FavoriteViewCard> {
  // Style des textes de la card
  TextStyle header =
      const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, overflow: TextOverflow.ellipsis);
  TextStyle body =
      const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, overflow: TextOverflow.ellipsis);
  TextStyle bodyTitreAnnonce =
      const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, overflow: TextOverflow.clip);
  TextStyle footer =
      const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, overflow: TextOverflow.ellipsis);

  // Style des images
  double bodyPictureGoodSize = 5.0;
  double bodyPictureCustomerSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, fit: StackFit.expand,
        //alignment: AlignmentDirectional.center,
        children: <Widget>[
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 5.0,
            child: Column(children: [
              Container(
                width: 200,
                height: 150.0,
                margin: const EdgeInsets.only(left: 2.0, top: 2.0, right: 2.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                //alignment: Alignment.center,
                child: Stack(alignment: AlignmentDirectional.center, fit: StackFit.expand,
                    //alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(10)),
                        child: Image.asset(widget.pictureUrl, height: 150, width: 150, fit: BoxFit.cover),
                      ),
                    ]),
              ),
              Container(
                width: 200,
                height: 150.0,
                margin: const EdgeInsets.only(left: 2.0, bottom: 2.0, right: 2.0),
                padding: const EdgeInsets.all(3),
                alignment: Alignment.topCenter,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ClipOval(
                        child: Image.asset(
                          widget.pictureCustomer,
                          height: bodyPictureCustomerSize,
                          width: bodyPictureCustomerSize,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                      ),
                      SizedBox(
                        width: 93,
                        height: 15,
                        child: Text(
                          widget.firstname + " " + widget.lastname,
                          style: body,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 1)),
                  Container(
                    //width: 100,
                    height: 20.0,
                    //color: Colors.pinkAccent,
                    margin: const EdgeInsets.all(5.0),
                    //padding: const EdgeInsets.all(3),
                    alignment: Alignment.center,
                    child: RatingBar.builder(
                      initialRating: widget.customerRate,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemCount: 5,
                      itemSize: 18.0,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        widget.customerRate;
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 1)),
                  Container(
                    //width: 100,
                    height: 40.0,
                    margin: const EdgeInsets.all(0.0),
                    //padding: const EdgeInsets.all(3),
                    alignment: Alignment.topLeft,
                    child: Text(widget.shortDescription, style: bodyTitreAnnonce),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //width: 100,
                        height: 10.0,
                        margin: const EdgeInsets.all(0.0),
                        //padding: const EdgeInsets.all(3),
                        alignment: Alignment.topLeft,
                        child: Text("Taille : " + widget.taille, style: footer),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        //width: 100,
                        height: 10.0,
                        margin: const EdgeInsets.all(0.0),
                        //padding: const EdgeInsets.all(3),
                        alignment: Alignment.topLeft,
                        child: Text("Marque : " + widget.marque, style: footer),
                      ),
                    ],
                  )
                ]),
              ),
            ]),
          ),
          Positioned(
              top: 4,
              left: 3,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  child: Container(
                    width: 40,
                    height: 20,
                    color: Colors.white,
                    //padding: const EdgeInsets.all(0.0),
                    // margin: const EdgeInsets.all(20.0),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                      Text(widget.price.toString() + '€'.padLeft(2), style: header),
                    ]),
                  ))),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              //color: Colors.red,
              height: 30.0,
              // padding: const EdgeInsets.all(1.0),
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(widget.like ? Icons.favorite_outline : Icons.favorite),
                onPressed: () {

                },
                iconSize: 16,
                color: Colors.pink,
                splashRadius: 100,
                splashColor: Colors.pink,
                highlightColor: Colors.blue,
                  padding: const EdgeInsets.all(10)
              ),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ]);
  }
}
