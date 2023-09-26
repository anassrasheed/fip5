import 'dart:developer';

import 'package:fip5/old/oop3.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'couter_controller.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return _getXExample();
  }

  Scaffold _getXExample() {
    CounterController myController = Get.put(CounterController()); // inject
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "getx"),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          // myController.incrementCounter();
          myController.incrementCounter2();
        },
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('this counter value is'),
          GetX<CounterController>(
              init: CounterController(),
              builder: (controller) {
                print("text called");
                return Text(controller.counter.value.toString());
              }),
          Obx(() => Text(myController.counter2.value.toString())),
          // listener observe thread
        ]),
      ),
    );
  }

  Scaffold _getBuilderExample() {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "getx"),
      floatingActionButton: GetBuilder<CounterController>(
        init: CounterController(),
        builder: (controller) {
          print("button called");
          return FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(Icons.add),
            onPressed: () {
              controller.incrementCounter();
            },
          );
        },
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('this counter value is'),
          GetBuilder<CounterController>(
              init: CounterController(),
              builder: (controller) {
                print("text called");
                return Text(controller.counter.toString());
              }),
        ]),
      ),
    );
  }
}
