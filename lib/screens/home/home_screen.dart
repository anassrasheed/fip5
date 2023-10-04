import 'package:fip5/config/current_session.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
          CircleAvatar(
              backgroundImage: NetworkImage(
                CurrentSession().user!.imgUrl,
              ),
              radius: 80),
          Text("Hello User that number " + CurrentSession().user!.mobile),
          Text("BMP $bpm"),
          Text("gloc $gloc"),
          Text("temp $temp"),
          Text("glocuse $glocuse"),
          Text("insulin $insulin")
        ],
      )),
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
