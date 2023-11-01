import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fip5/config/current_session.dart';
import 'package:fip5/models/rate_model.dart';
import 'package:fip5/screens/login/login_controller.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../main_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bpm = 0;
  int gloc = 0;
  int temp = 0;
  int glocuse = 0;
  int insulin = 0;
  LoginController controller = Get.put(LoginController());
  int _counter = 0;

  @override
  void initState() {
    readDataFromDatabase();
    // writeDataToFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "Home"),
      body: Center(
          child: Column(
        children: [
          // CircleAvatar(
          //     backgroundImage: NetworkImage(
          //       CurrentSession().user!.imgUrl,
          //     ),
          //     radius: 80),
          Text("Hello User " +
              CurrentSession().myUser!.masterCustomerInformationFullName!),
          Text("Hello User that number " +
              CurrentSession().myUser!.masterCustomerInformationMobileNo!),
          Text("BMP $bpm"),
          Text("gloc $gloc"),
          Text("temp $temp"),
          Text("glocuse $glocuse"),
          Text("insulin $insulin"),
          CommonViews().createButton(
              title: "get Data using token",
              onPressed: () {
                controller.getDataWhereId();
              }),
          CommonViews().createButton(
              title: "update Rate",
              onPressed: () async {
                var collection = FirebaseFirestore.instance.collection("rates");
                var result =
                    await collection.where("rate", isEqualTo: 4.6).get();
                if (result != null && result.docs.isNotEmpty) {
                  for (var item in result.docs) {
                    RateModel model = RateModel.fromMap(item.data());
                    String docId = item.id;
                    model.numOfRates = 80;
                    model.rate = 4.8;
                    collection.doc(docId).update(model.toMap());
                  }
                }
              }),
          CommonViews().createButton(
              title: "delete Rate",
              onPressed: () async {
                var collection = FirebaseFirestore.instance.collection("rates");
                var result =
                    await collection.where("userId", isEqualTo: "2").get();
                if (result != null && result.docs.isNotEmpty) {
                  // RateModel model = RateModel.fromMap(result.docs.first.data());
                  String docId = result.docs.first.id;
                  // model.numOfRates = 80;
                  // model.rate = 4.8;
                  collection.doc(docId).delete();
                }
              }),
          CommonViews().createButton(
              title: "show Notification",
              onPressed: () {
                showNotification();
              }),
        ],
      )),
    );
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Hello User $_counter",
        "How you doing ?",
        NotificationDetails(
            android: AndroidNotificationDetails(
                androidChannel.id, androidChannel.name,
                importance: Importance.max,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
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
        _fillData(event.snapshot.value as Map<dynamic, dynamic>); // firestore
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
