import 'dart:math';

import 'package:findygo/bo/Favorit.dart';

class ImagesTests {
  ImagesTests();

  // Récupère la la liste des favoris
  static List<Favorit> fetchListeFavoris(String type) {
    List<Favorit> lstDesFavoris = List.empty(growable: true);

    // Paramètres commun pour la génération aléatoire
    final List<String> _firstname = ["Martin", "Bernard", "Thomas", "Petit", "Robert", "Richard", "Durand"];
    final List<String> _lastname = ["Axel", "Arthur", "Evan", "Adrien", "Alexis", "Antoine", "Adam"];
    final List<String> _shortDescription = [
      "Un super article",
      "Un article tip top",
      "A saisir voiture",
      "Trop cool le zip",
      "Number one car",
      "Must have !",
      "The best moon"
    ];

    final List<String> _pictureUrlSport = [
      "batte de baseball",
      "lunette de plongee",
      "masque decathlon",
      "palme",
      "pions echec",
      "surf",
      "tapis de course"
    ];
    final List<String> _pictureUrlFemme = [
      "body",
      "bonnet de bain",
      "chausson de danse",
      "gants de boxe",
      "maillot de bain",
      "patin à glace",
      "raquette de tennis",
      "roller",
      "velo",
      "vetement de ski"
    ];
    final List<String> _pictureUrlHomme = [
      "body",
      "bonnet de bain",
      "chausson de danse",
      "gants de boxe",
      "maillot de bain",
      "patin à glace",
      "raquette de tennis",
      "roller",
      "velo",
      "vetement de ski"
    ];
    final List<String> _pictureUrlEnfant = ["ballon", "body", "cerf volant", "monocycle", "patin à glace", "skate", "trotinette", "velo"];

    final List<String> _pictureCustomer = ["a1.png", "a2.png", "a3.png", "a4.png", "a5.png", "a6.png", "a7.png", "a8.png", "a9.png", "a10.png"];
    final List<String> _articleTaille = ["XS", "S", "M", "M-L", "L", "L-XL", "XL", "38", "40", "42"];
    final List<String> _articleBrand = [
      "Addidas",
      "Nike",
      "Puma",
      "Le Cop Sportif",
      "Lafuma",
      "Bilabong",
      "Timberland",
      "Asics",
      "Lacoste",
      "Reebok"
    ];
    final List<int> _price = [15, 55, 1500, 30, 75, 80, 99];
    final List<double> _customerRate = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0];
    final List<bool> _like = [true, false];

    const String _urlSport = "assets/pictures/png/sport/";
    const String _urlFemme = "assets/pictures/png/femme/";
    const String _urlHomme = "assets/pictures/png/homme/";
    const String _urlEnfant = "assets/pictures/png/enfant/";

    // Génère une nombre aléatoire pour un sous-titre de la liste
    final Random _rnd = Random();

    for (int i = 0; i < 11; i++) {
      lstDesFavoris.add(Favorit(
          _firstname[_rnd.nextInt(_firstname.length)],
          _lastname[_rnd.nextInt(_lastname.length)],
          _shortDescription[_rnd.nextInt(_shortDescription.length)],
          type == "Sport"
              ? (_urlSport + _pictureUrlSport[_rnd.nextInt(_pictureUrlSport.length)] + ".png")
              : type == "Femme"
                  ? (_urlFemme + _pictureUrlFemme[_rnd.nextInt(_pictureUrlFemme.length)] + ".png")
                  : type == "Homme"
                      ? (_urlHomme + _pictureUrlHomme[_rnd.nextInt(_pictureUrlHomme.length)] + ".png")
                      : (_urlEnfant + _pictureUrlEnfant[_rnd.nextInt(_pictureUrlEnfant.length)] + ".png"),
          "assets/pictures/png/images_avatars/" + _pictureCustomer[_rnd.nextInt(_pictureCustomer.length)],
          _price[_rnd.nextInt(_price.length)],
          _articleTaille[_rnd.nextInt(_articleTaille.length)],
          _articleBrand[_rnd.nextInt(_articleBrand.length)],
          _customerRate[_rnd.nextInt(_customerRate.length)],
          _like[_rnd.nextInt(_like.length)]));
    }
    return lstDesFavoris;
  }
}
