import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// ----------------------------------------------------------
/// Method that saves the token in Shared Preferences
/// ----------------------------------------------------------
Future<bool> setASharedPreferences(String _key, String _value) async {
  const _prefs = FlutterSecureStorage();
  await _prefs.write(key: _key, value: _value);
  return true;
}