
import 'package:fip5/getx/navigators/screen_a.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenC extends StatefulWidget {
  const ScreenC({Key? key}) : super(key: key);

  @override
  State<ScreenC> createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "ScreenC"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CommonViews().createButton(title: "Next", onPressed: () {
          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (c)=>ScreenA()), (route) => false);
          Get.offAll(ScreenA()); // pushAndRemoveUntil
        })],
      )),
    );
  }
}
