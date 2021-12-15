import 'dart:core';

class ConstantesBdd{
  // Paramètres de connexion BDD
  static const String HOST = 'localhost';
  static const int PORT = 3306;
  static const String USER = "ava";
  static const String PASSWWORD = "clips";
  static const String DB = "findygo";
  static const int VERSION = 1;
}

class TableNames{
  // Nom des tables en BDD
  static const String TBRAND = 'brand';
  static const String TCATEGORY = 'category';
  static const String TCIVILITY = 'civility';
  static const String TCOLOR = 'color';
  static const String TFAVORITE = 'favorite';
  static const String TGENDER = 'gender';
  static const String TMESSAGE = 'message';
  static const String TORDER = 'order';
  static const String TPRODUCT = 'product';
  static const String TQUALITY = 'quality';
  static const String TSIZE = 'size';
  static const String TSTATE = 'state';
  static const String TTYPE = 'type';
  static const String TUSER = 'user';
}



class Column_UserName{
  // Noms des colonnes de la table User en BDD
  static const String id = 'id';
  static const String username = 'username';
  static const String firstname = 'firstname';
  static const String lastname = 'lastname';
  static const String email = 'email';
  static const String password = 'password';
  static const String roles = 'roles';
  static const String phone = 'phone';
  static const String postal_address = 'postal_address';
  static const String additional_address = 'additional_address';
  static const String postal_code = 'postal_code';
  static const String city = 'city';
  static const String department = 'department';
  static const String country = 'country';
  static const String picture_profil = 'picture_profil';
  static const String creation_datetime = 'creation_datetime';
  static const String update_datetime = 'update_datetime';
  static const String is_verified = 'is_verified';

  static const String queryCreateUserTable = '''
        CREATE TABLE user (
        id INTEGER PRIMARY KEY NOT NULL,
        username TEXT,
        firstname TEXT,
        lastname TEXT,
        email TEXT,
        password TEXT,
        roles TEXT,
        phone TEXT,
        postal_address TEXT,
        additional_address TEXT,
        postal_code TEXT,
        city TEXT,
        department TEXT,
        country TEXT,
        picture_profil TEXT,
        creation_datetime TEXT,
        update_datetime TEXT,
        is_verified INTEGER)
    ''';
}


