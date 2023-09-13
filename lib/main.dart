// ignore_for_file: sort_child_properties_last, deprecated_member_use

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/generated/l10n.dart';
import 'package:fip5/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';
import 'l10n/app_language.dart';


void main() {
  runApp(ScopedModel<AppLanguage>(
    child: const MyApp(),
    model: AppLanguage(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppLanguage>(builder: (context, child, model) {
      return Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: const SplashView(),
          locale: model.appLocale,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
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
          // debugShowMaterialGrid: false, // Enable debugging overlays

        );
      });
      // wid
    });
  }
}

