import 'package:fip5/main_ui_2.dart';
import 'package:fip5/task.dart';
import 'package:flutter/material.dart';

import 'main_ui_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainUi3(), // first screen
      theme: ThemeData(
          // colors
          primaryColor: Colors.black,
          accentColor: Colors.black,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          buttonColor: Colors.red,
          // ctrl + s  hotReload
          shadowColor: Colors.red),
      title: "Fip5",
      debugShowCheckedModeBanner: false,
    ); // widget class MaterialApp   Text()   container Container   MyFirstClass
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
