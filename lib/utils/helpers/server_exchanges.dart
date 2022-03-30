/// Module that handles all communications with the server
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';

//import 'package:device_info_plus/device_info_plus.dart';
import 'package:findygo/utils/helpers/save_sharedpreferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// the unique ID of the application
const String _applicationId = "my_application_id";

// the storage key for the token
const String _storageKeyMobileToken = "token";

// the URL of the Web Server
const String _urlBase = "https://www.findygo.fr";

// the URI to the Web Server Web API
const String _serverApi = "/api";

// the mobile device unique identity
String _deviceIdentity = "";

/// Method which is only run once to fetch the device identity
/// */
//final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

Future<String> _getDeviceIdentity() async {
  if (_deviceIdentity == '') {
    try {
      if (Platform.isAndroid) {
        // AndroidDeviceInfo info = await _deviceInfoPlugin.androidInfo;
        //_deviceIdentity = "${info.device}-${info.id}";
        _deviceIdentity = "info.device info.id";
      } else if (Platform.isIOS) {
        // IosDeviceInfo info = await _deviceInfoPlugin.iosInfo;
        //_deviceIdentity = "${info.model}-${info.identifierForVendor}";
        _deviceIdentity = "model identifierForVendor";
      }
    } on PlatformException {
      _deviceIdentity = "unknown";
    }
  }

  return _deviceIdentity;
}

/// ----------------------------------------------------------
/// Method that returns the token from Shared Preferences
/// ----------------------------------------------------------

const _prefs = FlutterSecureStorage();

Future<String> getSharedPreferences(String _key) async {
  String? prefs = await _prefs.read(key: _key);
  return prefs ?? '';
}

/// ----------------------------------------------------------
/// Method that saves the token in Shared Preferences
/// ----------------------------------------------------------
Future<bool> setSharedPreferences(String _key, String _value) async {
  await _prefs.write(key: _key, value: _value);
  return true;
}

/// ----------------------------------------------------------
/// Http Handshake
///
/// At application start up, the application needs to synchronize
/// with the server.
/// How does this work?
///   - A. If a previous token exists, the latter is sent to
///   -   the server to be validated.  If the validation is Ok,
///   -   the user is re-authenticated and a new token is returned
///   -   to the application.  The application then stores it.
///
///   - B. If no token exists, the application sends a request
///   -   for a new token to the server, which returns the
///   -   the requested token.  This token will be saved.
/// ----------------------------------------------------------
Future<String> handShake() async {
  String _status = "ERROR";

  return ajaxGet("/users/24").then((String responseBody) async {
    Map response = json.decode(responseBody);
    _status = response["status"];
    switch (_status) {
      case "REQUIRES_AUTHENTICATION":
        // We received a new token, so let's save it.
        await setSharedPreferences("token", response["token"]);
        break;

      case "INVALID":
        // The token we passed is invalid ??  why ?? somebody played with the local storage?
        // Anyways, we need to remove the previous one from the local storage,
        // and proceed with another handshake
        await setSharedPreferences("token", "");
        break;
      default:
        log("--------------------------------------------> Erreur handcheck", name: "server_exchanges", error: "Erreur de handshake");
    }

    return _status;
  });
}

/// ----------------------------------------------------------
/// Http "GET" request
/// ----------------------------------------------------------
Future<String> ajaxGet(String serviceName) async {
  var responseBody = '{"data": "", "status": "NOK GET"}';
  try {
    var response = await http.get(Uri.parse(_urlBase + _serverApi + serviceName),
        headers: {'X-DEVICE-ID': await _getDeviceIdentity(), 'X-TOKEN': await getSharedPreferences("token"), 'X-APP-ID': _applicationId});

    if (response.statusCode == 200) {
      responseBody = response.body;
    }
  } catch (e) {
    // An error was received
    throw Exception("AJAX ERROR");
  }
  return responseBody;
}

/// ----------------------------------------------------------
/// Http "POST" request
/// ----------------------------------------------------------
Future<Map> ajaxPost(String serviceName, Map data) async {
  var responseBody = json.decode('{"data": "", "status": "NOK POST"}');

  String _url = _urlBase + _serverApi + serviceName;

  log("_url reçu par le serveur : Erreur échange serveur :", name: "fichier : server_exhanges", error: _url);

  String token0 = await getSharedPreferences("token");
  log("token0 :", name: "fichier : server_exhanges", error: token0);

  String _token0 = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2NDc0NDI2NTksImV4cCI6MTY0NzQ2NDI1OSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sImVtYWlsIjoiYXVyZWwwOEB5bm92LmNvbSJ9.jCZU6iGHWHX9deMPV30AYMIw1V4A2yGL61_OYR6mlJ1f17B14LihvdWG7w6-LM6tgWjdk0Hi7oeJB2kmvghEz-_RANLWRVaoKcHK3hL54tpV8IQH9CDtyXkW4bMKHlVOOs0PUs-sCb9y8On29Hr88anp1z7DLiFvH3LZ0OhhDN740nDOtfE5FrJnymT77CZTreJwUa_CmHmtFuD1D2Qz0JBC_m79GgYTXwO3f1Wohi0yChMfvOsrL-SWfUOO3Y-uBx1xiYuwmiaOlvIy9yoiV1TmBrYaStzTF2bUCPD4wJAyTRMoOdnAGjdY5aGF16nITSRzeVk6jkPzuPBbcYkTTQ5NSBqbol8OJg7PTXykgs6aCP-_L84bXm2B9FjwZDLBC92NIVq1vsEjeVe6iKCmngtefJ67i7uhksR092b5SveoRVESEuFWvV0uJGRw7B5CfgL-NvLxSsM-QJU0KLgUYj9aqBlYDMlY38eGZj0JBLCI-GrI4nza49nXxptfXgrtwISdbRfsyh8pLx8_kz9GuJNvgK1flAuEEIrwiToywnIvoQ-wDF98VPQgeB31zOQnHJHppaU5drNVEvAVsGPXpDd5iAr0tQ_PqtkAGcT3K8ljBXP4C021o0WQWbk6Bu6A-s7pnHuGs9yMeOjFIVii4lgVfRvKw1lKxvfv8t125ms";

  Map<String, String> _header = {
    "Content-Type": "application/json",
    'X-DEVICE-ID': await _getDeviceIdentity(),
    'X-TOKEN': await getSharedPreferences("token"),
    'X-APP-ID': _applicationId,
    //'Authorization': "Bearer " + token0,
  };

  try {
    Response response = await http.post(Uri.parse(_url), headers: _header, body: json.encode(data));

    // décodage de la réponse
    responseBody = json.decode(response.body);

    if (response.statusCode == 200 ) {
      // code 200 : loggin ok

    } else if (response.statusCode == 201) {
      // code 201 : subscribe ok

    } else if (response.statusCode == 401) {
      // code 401 : JWT Token not found

    }else if (response.statusCode == 422) {
      // Code 422 : compte utilisateur déjà existant. On ne peut pas l'utiliser

      // On créer une réponse avec un status
      responseBody = json.decode('{"data": "", "status": "User already existe"}');
    } else {
      log("Else:", name: "fichier : server_exhanges", error: "response.statusCode = " + response.statusCode.toString());
    }
    log("statusCode -->> :", name: "fichier : server_exhanges", error: "response.statusCode == " + response.statusCode.toString());
  } catch (e) {
    // An error was received
    log("Catch: Erreur échange serveur :", name: "fichier : server_exhanges", error: e.toString());
  }
  return responseBody;
}
