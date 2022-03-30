class Favorit {
  ///  Classe Favorite: représent un objet favorit à afficher dans la GridView
  ///
  /// */

  // Attributs
  String _firstname;
  String _lastname;
  String _shortDescription;
  String _pictureUrl;
  String _pictureCustomer;
  int _price;
  String _taille;
  String _marque;
  double _customerRate;
  bool _like;

  // Constructors
  Favorit(this._firstname, this._lastname, this._shortDescription, this._pictureUrl, this._pictureCustomer, this._price,this._taille, this._marque, this._customerRate, this._like);

  Favorit.fromJson(Map<String, dynamic> myJson)
      : _firstname = myJson["firstname"],
        _lastname = myJson["lastname"],
        _shortDescription = myJson["shortDescription"],
        _pictureUrl = myJson["pictureUrl"],
        _pictureCustomer = myJson["pictureCustomer"],
        _price = myJson["price"],
        _taille = myJson["taille"],
        _marque = myJson["marque"],
        _customerRate = myJson["customerRate"],
        _like = myJson["like"];

  // Getters & setters
  String get firstname => _firstname;

  set firstname(String value) {
    _firstname = value;
  }

  String get lastname => _lastname;

  bool get like => _like;

  set like(bool value) {
    _like = value;
  }

  double get customerRate => _customerRate;

  set customerRate(double value) {
    _customerRate = value;
  }

  int get price => _price;

  set price(int value) {
    _price = value;
  }

  String get pictureCustomer => _pictureCustomer;

  set pictureCustomer(String value) {
    _pictureCustomer = value;
  }

  String get pictureUrl => _pictureUrl;

  set pictureUrl(String value) {
    _pictureUrl = value;
  }

  String get shortDescription => _shortDescription;

  set shortDescription(String value) {
    _shortDescription = value;
  }

  set lastname(String value) {
    _lastname = value;
  }

  String get taille => _taille;

  set taille(String value) {
    _taille = value;
  }

  String get marque => _marque;

  set marque(String value) {
    _marque = value;
  }

  // Methods
  Map<String, dynamic> toJson() => {
        "firstname": _firstname,
        "lastname": _lastname,
        "shortDescription": _shortDescription,
        "pictureUrl": _pictureUrl,
        "pictureCustomer": _pictureCustomer,
        "price": _price,
        "taille": _taille,
        "marque": _marque,
        "customerRate": _customerRate,
        "like": _like
      };
}
