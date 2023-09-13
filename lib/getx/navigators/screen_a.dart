import 'package:fip5/getx/navigators/screen_b.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "ScreenA"),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonViews().createButton(
              title: "Next",
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => ScreenB()));
                //   Navigator.of(context).pushNamed("/screenB"); //
                Get.toNamed("/screenB");
                Get.offNamed("/screenB");
                Get.offAllNamed("/screenB");

                // FIP5Navigator.of(Get.context!).push(const ScreenB());

                // Get.to((const ScreenB())); // push
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
