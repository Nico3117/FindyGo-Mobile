import 'package:email_validator/email_validator.dart';


/// checkEmailOk
/// Controle si le format est valide d'une adresse email
/// @param prend une chaine de caractère qui sera un email à analyser
/// @return true if email address format is compliant
bool checkEmailOk(String str) {
  return EmailValidator.validate(str);
}

/// checkEmailOk
/// Controle si le format est valide d'une adresse email
/// @param prend une chaine de caractère qui sera un email à analyser
/// @return true if email address format is compliant
bool checkEmailOrUsernameOk(String str) {
  return (str.isNotEmpty && str.length < 50) ? true : false;
}

/// checkPasswordOk
/// Controle si le format est valide d'un mot de passe
/// @param prend une chaine de caractère qui sera un mot de passe à analyser
/// @return n booléen pour true si le mot de passe est valide
bool checkUserNameOk(String str) {
  return (str.isNotEmpty && str.length < 50) ? true : false;
}

/// checkPasswordOk
/// Controle si le format est valide d'un mot de passe
/// @param prend une chaine de caractère qui sera un mot de passe à analyser
/// @return n booléen pour true si le mot de passe est valide
bool checkPasswordOk(String str) {
  return (str.isNotEmpty && str.length < 50) ? true : false;
}