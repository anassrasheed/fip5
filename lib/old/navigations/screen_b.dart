import 'package:flutter/material.dart';

class ScreenB extends StatelessWidget {
  final String? name;

  ScreenB({Key? key, this.name}) : super(key: key);
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    print(arguments['name']);
    print(arguments['age']);
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(_controller.text);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Screen B")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (arguments['name'] != null) Text(arguments['name']!),
            if (arguments['age'] != null) Text(arguments['age'].toString()),
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/screenC");
                },
                child: Text("Go To Screen C")),
            ElevatedButton(
                onPressed: () {
                  int count = 0;
                  // if (Navigator.of(context).canPop()) { // true
                  //   Navigator.of(context).pop();
                  // }
                  Navigator.of(context).maybePop(_controller.text);
                  // Navigator.of(context).popUntil((_) => count++ >= 2);
                },
                child: Text("back to A")),
          ],
        )),
      ),
    );
  }
}
