// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';








void main() {
  runApp(
     MyApp(),
    //model: AppLanguage(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!;
  }

  @override
  State<MyApp> createState() => _MyAppState();

  //static of(BuildContext context) {}
}

class _MyAppState extends State<MyApp> {
   Locale? _locale;
    void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  String getLocale() {
    return _locale!.languageCode.toString();
  }
  @override
  Widget build(BuildContext context) {
  
      return Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: const SplashView(),
         // locale: model.appLocale,
           locale: _locale,
             localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
         // supportedLocales: S.delegate.supportedLocales,
          // localizationsDelegates: const [
          //   S.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          // ],
          theme: ThemeData(
              // colors
              primaryColor: AppColors.primaryColor,
              hintColor: Colors.black,
              backgroundColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              fontFamily: "trojan",
              // textTheme: GoogleFonts.abelTextTheme(Theme.of(context).textTheme),
              // ctrl + s  hotReload
              shadowColor: Colors.red
          ),
          routes: const {
            // "/screenA": (c) => ScreenA(),
            // "/screenB": (c) => ScreenB(),
            // "/screenC": (c) => const ScreenC(),
          },
          // initialRoute: "/screenA",
          title: "Fip5",
          debugShowCheckedModeBanner: false,

        );
      });
      
    
    
  }
}

