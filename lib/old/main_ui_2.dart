import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // upper camel case
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // lower camel case
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
          child: Column(children: [
            const Icon(Icons.add),
            const Icon(Icons.add),
            const Icon(Icons.add),
            const Icon(Icons.add),
            const Icon(Icons.add),
            const Icon(Icons.add),
            const Icon(Icons.add),
            Container(
              // color: Colors.white,
              height: 200,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: const EdgeInsets.fromLTRB(10, 10, 20, 50),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.blue.shade300,
                      Colors.blue.shade600,
                      Colors.blue.shade600,
                      Colors.blue.shade600,
                      Colors.blue.shade900,
                    ]),
                borderRadius: BorderRadius.circular(50),
                shape: BoxShape.rectangle,
              ),
              child: const Text(
                "Hello ",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.overline,
                    decorationColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 2,
                    wordSpacing: 5,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.wavy,
                    locale: Locale('ar'),
                    overflow: TextOverflow.visible),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            ),
            // Icon(Icons.add),
          ]), // 411

        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("Noor");
            },
            enableFeedback: false,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                    color: Colors.orange,
                    width: 2,
                    style: BorderStyle.solid,
                    strokeAlign: 0)),
            elevation: 20,
            tooltip: "click here!!",
            // flutter
            // heroTag: "anas",
            backgroundColor: Colors.yellow,
            child: const Icon(Icons.add)),
        backgroundColor: Colors.brown,
        drawer: Drawer(
            elevation: 50,
            shadowColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            backgroundColor: const Color(0xfffff258),
            child: Column(
              children: const [
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
              ],
            )),
        bottomNavigationBar: Container(
          color: Colors.blue,
          height: 80,
        ),
        endDrawer: const Drawer(),
      ),
    );
  }
}
