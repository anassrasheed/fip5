import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static final SharedPreferenceHelper _shared =
      SharedPreferenceHelper._private();

  factory SharedPreferenceHelper() => _shared;

  SharedPreferenceHelper._private();

  //
  // Future<void> saveString({required String key, required String value}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, value);
  // }
  //
  // Future<void> saveBool({required String key, required bool value}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool(key, value);
  // }

  Future<void> save(
      // generic method
      {required String key,
      required dynamic value,
      required SaveType type}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case SaveType.boolType:
        {
          prefs.setBool(key, value);
        }
        break;
      case SaveType.stringType:
        {
          prefs.setString(key, value);
        }
        break;
      case SaveType.intType:
        {
          prefs.setInt(key, value);
        }
        break;
      case SaveType.doubleType:
        {
          prefs.setDouble(key, value);
        }
        break;
      case SaveType.stringListType:
        {
          prefs.setStringList(key, value);
        }
        break;
    }
  }

  // Future<String?> readString({required String key}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(key);
  // }
  //
  // Future<bool?> readBool({required String key}) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool(key);
  // }

  Future<dynamic> read(
      // generic method
      {required String key,
      required SaveType type}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (type) {
      case SaveType.boolType:
        {
          return prefs.getBool(key);
        }
      case SaveType.stringType:
        {
          return prefs.getString(key);
        }
      case SaveType.intType:
        {
          return prefs.getInt(key);
        }
      case SaveType.doubleType:
        {
          return prefs.getDouble(key);
        }
      case SaveType.stringListType:
        {
          return prefs.getStringList(key);
        }
    }
  }
}

enum SaveType { stringType, boolType, intType, doubleType, stringListType }
