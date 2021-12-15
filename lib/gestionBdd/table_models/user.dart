import 'package:findygo/constants/constant_bdd.dart';

class User {
  int? id;
  String username = "";
  String firstname = "";
  String lastname = "";
  String email = "";
  String password = "";
  String roles = "";
  String phone = "";
  String postal_address = "";
  String additional_address = "";
  String postal_code = "";
  String city = "";
  String department = "";
  String country = "";
  String picture_profil = "";
  String creation_datetime = "";
  String update_datetime = "";
  String is_verified = "";

  User();

  User.fromMap(Map<dynamic, dynamic> map) {
    id = map[Column_UserName.id];
    username = map[Column_UserName.username];
    firstname = map[Column_UserName.firstname];
    lastname = map[Column_UserName.lastname];
    email = map[Column_UserName.email];
    password = map[Column_UserName.password];
    roles = map[Column_UserName.roles];
    phone = map[Column_UserName.phone];
    postal_address = map[Column_UserName.postal_address];
    additional_address = map[Column_UserName.additional_address];
    postal_code = map[Column_UserName.postal_code];
    city = map[Column_UserName.city];
    department = map[Column_UserName.department];
    country = map[Column_UserName.country];
    picture_profil = map[Column_UserName.picture_profil];
    creation_datetime = map[Column_UserName.creation_datetime];
    update_datetime = map[Column_UserName.update_datetime];
    is_verified = map[Column_UserName.is_verified];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      Column_UserName.username: username,
      Column_UserName.firstname: firstname,
      Column_UserName.lastname: lastname,
      Column_UserName.email: email,
      Column_UserName.password: password,
      Column_UserName.roles: roles,
      Column_UserName.phone: phone,
      Column_UserName.postal_address: postal_address,
      Column_UserName.additional_address: additional_address,
      Column_UserName.postal_code: postal_code,
      Column_UserName.city: city,
      Column_UserName.department: department,
      Column_UserName.country: country,
      Column_UserName.picture_profil: picture_profil,
      Column_UserName.creation_datetime: creation_datetime,
      Column_UserName.update_datetime: update_datetime,
      Column_UserName.is_verified: is_verified,
    };

    if (id != null) {
      map[Column_UserName.id] = id;
    }
    return map;
  }
}
