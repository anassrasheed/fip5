import 'package:fip5/config/app_colors.dart';
import 'package:fip5/screens/intro/intro_screen.dart';
import 'package:fip5/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sizer/sizer.dart';

import 'l10n/app_language.dart';
import 'old/builders/list_view_builder.dart';
import 'old/generated/l10n.dart';
import 'old/navigations/screen_a.dart';
import 'old/navigations/screen_b.dart';
import 'old/navigations/screen_c.dart';

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
          home: const IntroScreen(),
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
              shadowColor: Colors.red),
          routes: {
            "/screenA": (c) => ScreenA(),
            "/screenB": (c) => ScreenB(),
            "/screenC": (c) => const ScreenC(),
          },
          // initialRoute: "/screenA",
          title: "Fip5",
          debugShowCheckedModeBanner: false,
        );
      });
      // wid
    });
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Fip5"),
        shadowColor: Colors.red,
        elevation: 1,
        centerTitle: true,
        leading: const Text("asjdhaskjdhkjsdfdsfdsfdsfashdkj"),
        actions: const [
          Icon(Icons.add),
          Icon(Icons.remove),
          Text("Anas"),
          Text("Sami"),
        ],
        backgroundColor: Colors.red,
        leadingWidth: 150,
        iconTheme:
            const IconThemeData(color: Colors.green, size: 20, weight: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        // leadingWidth: ,
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            color: Colors.yellow,
            child: Row(
              children: const [
                Text("Anas"),
                Text("Hussain"),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )), // column row
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
// listView with Future
// shimmer
