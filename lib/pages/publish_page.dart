import 'package:findygo/bo/ArgsRoute.dart';
import 'package:findygo/helpers/helpers.dart';
import 'package:findygo/utils/helpers/server_exchanges.dart';
import 'package:findygo/widgets/bottom_bar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:findygo/constants/routes.dart';
import 'package:select_form_field/select_form_field.dart';

/** Publier un article */
class PublishPage extends StatefulWidget {
  ///  Attributs ------------------------------------------------------------------
  /// */
  // Paramètres

  late TextEditingController
      tecTitle, // une string
      tecDescription, // une string
      tecSize, // Tailles des colis de 10, 11, 12, etc == S, L, XL une liste
      tecBrand, // Marques des colis 10, 11, 12, 13, etc == Nike, Addidas, Element, Asus
      tecPrice; // un double

  ///  Constructor ------------------------------------------------------------------
  /// */

  PublishPage(
     {
    Key? key,
  }) : super(key: key) {
    tecTitle = TextEditingController();
    tecDescription = TextEditingController();
    tecSize = TextEditingController();
    tecBrand = TextEditingController();
    tecPrice = TextEditingController();
  }

  // Rafraichir le token

  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  // declare a GlobalKey pour le controle de la validation du formulaire
  final _formKey = GlobalKey<FormState>();

  // Initial Selected Value for the sizes
  String sizeDropdownvalue = 'L';
  // Initial Selected Value for the brands
  String brandDropdownvalue = 'Addidas';

  // List of size items in our dropdown menu
  var sizeItems = [
    'S',
    'L',
    'XL',
  ];

  // List of brand items in our dropdown menu
  var brandItems = [
    'Nike',
    'Addidas',
    'Element',
    'Asus',
  ];

  String _msgErreur = '';

  // declare a variable to keep track of the input text
  String _title = '';
  String _description = '';
  String _size = '11'; // id de la taille par défaut: 11 = L
  String _brand = '11'; // id de la marque par défaut: 11 = Addidas
  double _priceDouble = 0.0;
  String _priceString = "";

  // Lorsque l'on demande à soumettre le formulaire, on check les inputs
  bool isButtonValidationDisabled = false;

  late ArgsRoute args;

  ///  SetState ------------------------------------------------------------------
  /// */
  @override
  void initState() {
    super.initState();
    isButtonValidationDisabled = false;
    // _msgErreur = "";
  }

  ///  Dispose ------------------------------------------------------------------
  /// */
  @override
  void dispose() {
    super.dispose();
  }

  ///  Widget: BUILD ------------------------------------------------------------------
  /// */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Column(
                        children: [
                          Container(height: 50),
                          _logo(),
                          _bodyTitle(),
                          Container(
                              color: Colors.white,
                              height: 400,
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        _buildTitleField(),
                                        _buildDescriptionField(),
                                        _buildSizeField2(),
                                        _buildBrandField2(),
                                        _buildPriceField(),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        _buildPublishButton(context),
                                        _buildMessageErreur(),
                                      ]))),
                        ],
                      ),
                    )))),
      bottomNavigationBar: MyBottomBar(2),
    );
  }

  ///  Widgets ------------------------------------------------------------------
  /// */

  Widget _logo() => SizedBox(
    width: 150,
    child: Padding (
      padding: EdgeInsets.only(bottom: 20),
      child: Image.asset(
        'assets/pictures/logo.png',
      ),
    ),
  );

  Widget _bodyTitle() => SizedBox(
      width: 250.0,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "PUBLICATION",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.black),
                ))
          ]));

  Widget _buildTitleField() => Padding (
      padding: EdgeInsets.only(bottom: 20),
      child : SizedBox(
      width: 200.0,
      child: TextFormField(
        controller: widget.tecTitle,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Titre",
          hintText: "Titre",
        ),
        autovalidateMode: isButtonValidationDisabled
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        // use the validator to return an error string (or null) based on the input text
        validator: (text) {
          // Check format titre
          if (text == null || text.length < 2) {
            return 'Titre trop court !';
          }
          return null;
        },
        // update the state variable when the text changes
        onChanged: (text) => setState(() => _title = text),
      )));

  Widget _buildDescriptionField() => Padding (
      padding: EdgeInsets.only(bottom: 20),
      child : SizedBox(
      width: 200.0,
      child: TextFormField(
        controller: widget.tecDescription,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Description",
          hintText: "Description",
        ),
        autovalidateMode: isButtonValidationDisabled
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        // use the validator to return an error string (or null) based on the input text
        validator: (text) {
          // Check format titre
          if (text == null || text.length < 2) {
            return 'Description trop courte !';
          }
          return null;
        },
        // update the state variable when the text changes
        onChanged: (text) => setState(() => _description = text),
      )));

  Widget _buildSizeField() => SizedBox(
      width: 100.0,
      child:  TextFormField(
        controller: widget.tecSize,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Taille",
          hintText: "Taille",
          prefixIcon: IconButton(
            icon: const Icon(Icons.format_size_outlined),
            onPressed: () {},
          ),
        ),
        autovalidateMode: isButtonValidationDisabled
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        // use the validator to return an error string (or null) based on the input text
        validator: (text) {
          // Check format titre
          if (text == null || text.length < 2) {
            return 'Taille mal renseignée !';
          }
          return null;
        },
        // update the state variable when the text changes
        onChanged: (text) => setState(() => _size = text),
      )
  );

  Widget _buildSizeField2() => SizedBox(
      width: 100.0,
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.format_size, color: Colors.grey),
            const Text("Taille"),
            DropdownButton(

        // Initial Value
        value: sizeDropdownvalue,

        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        // Array list of items
        items: sizeItems.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (String? newValue) {
          setState(() {
            sizeDropdownvalue = newValue!;

            switch(sizeDropdownvalue){
              case "S":{
                _size = "10";
              }
              break;
              case "L":{
                _size = "11";
              }
              break;
              case "XL":{
                _size = "12";
              }
              break;
              default:
                _size = "11";
            }

            // Affectation de la taille à envoyer au serveur
            widget.tecSize.text = _size;
          });
        },
      ),]))
  );

  Widget _buildBrandField() => SizedBox(
      width: 200.0,
      child: TextFormField(
        controller: widget.tecBrand,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Marque",
          hintText: "Marque",
          prefixIcon: IconButton(
            icon: const Icon(Icons.branding_watermark_outlined),
            onPressed: () {},
          ),
        ),
        autovalidateMode: isButtonValidationDisabled
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        // use the validator to return an error string (or null) based on the input text
        validator: (text) {
          // Check format titre
          if (text == null || text.length < 2) {
            return 'Nom de marque trop court !';
          }
          return null;
        },
        // update the state variable when the text changes
        onChanged: (text) => setState(() => _brand = text),
      ));

  Widget _buildBrandField2() => SizedBox(
    width: 100.0,
    child:  Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.branding_watermark_outlined, color: Colors.grey),
          Text("Marque"),
          DropdownButton(

      // Initial Value
      value: brandDropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: brandItems.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          brandDropdownvalue = newValue!;

          switch(brandDropdownvalue){
            case "Nike":{
              _brand = "10";
            }
            break;
            case "Addidas":{
              _brand = "11";
            }
            break;
            case "Element":{
              _brand = "12";
            }
            break;
            case "Asus":{
              _brand = "13";
            }
            break;
            default:
              _brand = "11";
          }

          // Affectation de la marque à envoyer au serveur
          widget.tecBrand.text = _brand;
        });
      },
    ),]))
  );

  Widget _buildPriceField() => Padding (
      padding: EdgeInsets.only(top: 20),
      child : SizedBox(
      width: 200.0,
      child: TextFormField(
        controller: widget.tecPrice,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Prix",
          hintText: "Prix",
        ),
        autovalidateMode: isButtonValidationDisabled
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        // use the validator to return an error string (or null) based on the input text
        validator: (text) {
          // Check format titre
         /* if (text == null || text.length < 6) {
            return 'Nom du titre trop court !';
          }*/
          return null;
        },
        // update the state variable when the text changes
      //  onChanged: (text) => setState(() => _price = double.parse('text')),
        onChanged: (text) => setState(()
        {_priceString = text;
         _priceDouble = _priceString.isNotEmpty ? double.parse(_priceString): 0.0;
        }),
      )));

  Widget _buildMessageErreur() => Center(
          child: Text(
        _msgErreur,
        style: const TextStyle(color: Colors.red),
      ));

  Widget _buildPublishButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
        child: const Text('PUBLIER',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          primary: const Color(0xFFC1D2D9),
        ),
        onPressed: () =>
        _title.isNotEmpty && _description.isNotEmpty && _priceString.isNotEmpty
                ? _submit()
                : null,
      ),
    );
  }

  ///  Permet de contrôler la validité du formulaire avant l'envoi --------------
  /// */
  void _submit() {
    // On controle les inputs avant la soumission du formulaire
    setState(() => {
      isButtonValidationDisabled = true,
    });

    // validate == true si les 3 TextFieldField sont valide
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Faire une demande d'inscription au serveur
      _sendPublish(context);
    }
  }


  ///  Methods ------------------------------------------------------------------
  /// */

  void _sendPublish(BuildContext context) {

    double dou = double.parse(widget.tecPrice.text);

    Map _bodyToPublish = {
      "title": widget.tecTitle.text,
      "description": widget.tecDescription.text,
      "size": "api/sizes/" + _size, //widget.tecSize.text,
      "brand": "api/brands/" + _brand, //widget.tecBrand.text,
      "price": _priceDouble,
    };
    /*
    {
      "title": "hhghgvcj",
    "description": "d0",
    "size": "api/sizes/10",
    "brand": "api/brands/10",
    "price": 10.0
    }
     */

    log("1 ++++++++++++++++++++++++++++++++++++++++++++> _bodyToPublish",
        name: "PublishPage", error: _bodyToPublish);

    ajaxPost("/products", _bodyToPublish).then((value) async => {

    log("2 ********************************************> _bodyToPublish",
    name: "PublishPage", error: value),

          if (value['id'] != null)
            {
              log("--------------------------------------------> body du POST /API/PRODUCTS",
                  name: "PublishPage", error: value.toString()),

              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Publication réussie'))),

              // Reset textviews
              widget.tecTitle.text="",
              widget.tecDescription.text="",
              widget.tecSize.text="",
              widget.tecBrand.text="",
              widget.tecPrice.text="",

              // Redirection vers la page Search
              Navigator.of(context)
                  .pushNamed(ROUTE_SEARCH),
            }
          else
            {
              log("--------------------------------------------> Erreur PUBLISH d'un article",
                  name: "PublishPage", error: "Erreur de PUBLISH d'un article"),
              setState(() {
                _msgErreur = "Erreur dans le paramétrage\n        d'un article à publier";
              })
            }
        });
  }
}
