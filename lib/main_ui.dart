import 'package:fip5/l10n/app_language.dart';
import 'package:fip5/tabs/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'generated/l10n.dart';
import 'navigations/screen_a.dart';
import 'navigations/screen_b.dart';
import 'navigations/screen_c.dart';

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
      print("My App Called");
      return MaterialApp(
        home: TabScreen(),
        locale: model.appLocale,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        // en   ar
        // first screen
        theme: ThemeData(
            // colors
            primaryColor: Colors.black,
            accentColor: Colors.black,
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            buttonColor: Colors.red,
            // ctrl + s  hotReload
            shadowColor: Colors.red),
        routes: {
          "/screenA": (c) => ScreenA(),
          "/screenB": (c) => ScreenB(),
          "/screenC": (c) => ScreenC(),
        },
        // initialRoute: "/screenA",
        title: "Fip5",
        debugShowCheckedModeBanner: false,
      ); // wid
    });
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Fip5"),
        shadowColor: Colors.red,
        elevation: 1,
        centerTitle: true,
        leading: Text("asjdhaskjdhkjsdfdsfdsfdsfashdkj"),
        actions: [
          Icon(Icons.add),
          Icon(Icons.remove),
          Text("Anas"),
          Text("Sami"),
        ],
        backgroundColor: Colors.red,
        leadingWidth: 150,
        iconTheme: IconThemeData(color: Colors.green, size: 20, weight: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        // leadingWidth: ,
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            color: Colors.yellow,
            child: Row(
              children: [
                Text("Anas"),
                Text("Hussain"),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )
          // Column(
          //   children: [
          //     Text("Anas"),
          //     Text("rasheed"),
          //     Text("StepbyStrp"),
          //     Text("StepbyStrp"),
          //     Text("StepbyStrp"),
          //     Text("StepbyStrp"),
          //     Icon(Icons.add),
          //     Text("StepbyStrp"),
          //     Text("StepbyStrp"),
          //     Text("StepbyStrp"),
          //   ],
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.max,// bottomsheet
          // ),
          ), // column row
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
