// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, unused_local_variable

import 'package:fip5/screens/new_home/homeTas_controller.dart';
import 'package:flutter/material.dart';
import 'package:fip5/config/curunt_session.dart';
import 'package:fip5/screens/authintication/signup/signup_model.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomeTask extends StatefulWidget {
  const HomeTask({Key? key}) : super(key: key);

  @override
  State<HomeTask> createState() => _HomeTaskState();
}

class _HomeTaskState extends State<HomeTask> {
    final HomeTaskController _controller = HomeTaskController();

  // final HomeTaskController _controller =
  //     HomeTaskController(); // Instantiate the controller
        int bpm = 0;
  int gloc = 0;
  int temp = 0;
  int glocuse = 0;
  int insulin = 0;

  @override
  void initState() {
    readDataFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? user = CurrentSession().user;

    return Scaffold(
      appBar: CommonViews().getAppBar(title: "Home"),
      body: Center(
        child: Column(
          children: [
            if (user != null)
              CircleAvatar(
                backgroundImage: NetworkImage(user.imgUrl),
                radius: 80,
              ),
            if (user != null)
              Text("Hello User that number " + user.mobile),
            Card(
              child: ListTile(
                title: Obx(() => Text("BPM: ${_controller.bpm}")),
              ),
            ),
            Card(
              child: ListTile(
                title: Obx(() => Text("Gloc: ${_controller.gloc}")),
              ),
            ),
            Card(
              child: ListTile(
                title: Obx(() => Text("Temp: ${_controller.temp}")),
              ),
            ),
            Card(
              child: ListTile(
                title: Obx(() => Text("Glocuse: ${_controller.glocuse}")),
              ),
            ),
            Card(
              child: ListTile(
                title: Obx(() => Text("Insulin: ${_controller.insulin}")),
              ),
            ),
          ],
        ),
      ),
    );
  }

   void writeDataToFirebase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("fip5");
    ref.set({
      "BPM": 20,
      "Temp": 28,
      "glocuse": 10,
      "insulin": 100,
      "Glocusion": 55
    });
  }

  void readDataFromDatabase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("fip5");
    var data = await ref.get();
    if (data.exists) {
      Map<dynamic, dynamic> myData = data.value as Map<dynamic, dynamic>;
      _fillData(myData);
      ref.onValue.listen((event) {
        _fillData(event.snapshot.value as Map<dynamic, dynamic>);
      });
    }
  }
  void _fillData(Map<dynamic, dynamic> myData) {
    if (myData["BPM"] != null) bpm = myData["BPM"];
    if (myData["Temp"] != null) temp = myData["Temp"];
    if (myData["glocuse"] != null) glocuse = myData["glocuse"];
    if (myData["insulin"] != null) insulin = myData["insulin"];
    if (myData["Glocusion"] != null) gloc = myData["Glocusion"];
    setState(() {});
  }
}
