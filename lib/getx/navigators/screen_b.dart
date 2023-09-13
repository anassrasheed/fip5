import 'package:fip5/getx/navigators/screen_c.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "ScreenB"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonViews().createButton(
              title: "Next",
              onPressed: () {
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (c) => ScreenC()));

                Get.off((const ScreenC())); // push

              }),
          CommonViews().createButton(
              title: "Back",
              onPressed: () {
                // Navigator.of(context).maybePop();
                Get.back();
                // Get.off((const ScreenC())); // push

              }),
        ],
      )),
    );
  }
}
