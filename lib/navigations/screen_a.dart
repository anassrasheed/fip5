import 'package:fip5/navigations/screen_b.dart';
import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  ScreenA({Key? key}) : super(key: key);

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> with PrintHelper {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // PrintHelper helper=PrintHelper(); // create new object    Memory   XXXX
    // helper.printData();
    printData();
    printAnas();
    print(getValues());
    activate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen A")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: _controller),
          ElevatedButton(
              onPressed: () async {
                // Navigator.of(context).pushNamed("/screenB", arguments: {
                //   "name": _controller.text,
                //   "age": 20,
                // }); // android ios web desktop
                var result = await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenB(
                          name: _controller.text,
                        ))); // android ios desktop
                if (result != null && result is String)
                  setState(() {
                    _controller.text = result;
                  });
              },
              child: Text("Go To Screen B")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              child: Text("back")),
        ],
      )),
    );
  }
}

mixin PrintHelper {
  void printData() {
    print("Anas");
    print("Sally");
    print("Husain");
    print("Nawal");
    print("Ahmad");
    print("Razan");
    print("abed");
    print("mamoun");
    print("norhan");
  }

  printAnas() {
    print("Anas");
  }

  String getValues() {
    return "10 , 20 , 30";
  }
}

mixin PrintHelper2 {
  void printData() {
    print("Anas");
    print("Sally");
    print("Husain");
    print("Nawal");
    print("Ahmad");
    print("Razan");
    print("abed");
    print("mamoun");
    print("norhan");
  }

  printAnas() {
    print("Anas");
  }

  String getValues() {
    return "10 , 20 , 30";
  }
}
