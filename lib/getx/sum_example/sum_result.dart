import 'package:fip5/getx/counter_example/couter_controller.dart';
import 'package:fip5/getx/sum_example/sum_controller.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SumResult extends StatelessWidget {
  SumResult({Key? key}) : super(key: key);

  SumController controller = Get.find(); // inject init

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "sum Result"),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(() {
            print("counter 1");
            return Text(controller.counter.value.toString());
          }),
          Obx(() {
            print("counter 2");
            return Text(controller.counter2.value.toString());
          }),
          Obx(() {
            print("sum");
            return Text(controller.sum.toString());
          }),
          ElevatedButton(
              onPressed: () {
                controller.incrementCounter1();
              },
              child: Text("increase counter 1")),
          ElevatedButton(
              onPressed: () {
                controller.incrementCounter2();
              },
              child: Text("increase counter 2")),
        ]),
      ),
    );
  }
}
