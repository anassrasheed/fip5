import 'dart:ui';

import 'package:scoped_model/scoped_model.dart';

class AppLanguage extends Model{
  static final AppLanguage _appLanguage = AppLanguage._shared(); // abc123

  // singelton

  factory AppLanguage() {
    return _appLanguage;
  }

  AppLanguage._shared(); // private named constructor

  Locale appLocale = Locale("en"); // default ar

  void changeLanguage([String? lang]) {
    appLocale=Locale(lang!);
    // if (appLocale.languageCode == 'en') {
    //   appLocale = Locale('ar');
    // } else {
    //   appLocale = Locale('en');
    // }
    notifyListeners();
  }
}
