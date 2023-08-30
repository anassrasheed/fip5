import 'package:flutter/material.dart';

class ScreenC extends StatelessWidget {
  const ScreenC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen C")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/screenA", (route) => false);
              },
              child: Text("Go To Screen A")),
        ],
      )),
    );
  }
}
