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
 final CounterController currentController =
      Get.put(CounterController()); // init  dependency injection
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "getx"),
      floatingActionButton: Obx(
        ()=> FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () {
            currentController.incrementCounter();
          },
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('this counter value is'),
          Text('this counter value is'),
          Text('this counter value is'),
          Text('this counter value is'),
          Text('this counter value is'),
          Text('this counter value is'),
          Text('this counter value is'),
          Text('this counter value is'),
          Text('this counter value is'),
          Text('this counter value is'),
          Text('this counter value is'),
          Obx(() {
            print("Counter 2 called");
            return Text(currentController.counter2.value.toString()); // ignore
          }),
          Obx(() {
            print("Counter 1 called");
            return Text(currentController.counter.value.toString());
          }),
        ]),
      ),
    );
    // print("Build Called");
    // return GetBuilder<CounterController>(
    //   init: CounterController(), // new object
    //   builder: (currentController) {
    //     return Scaffold(
    //       appBar: CommonViews().getAppBar(title: "getx"),
    //       floatingActionButton: FloatingActionButton(
    //         backgroundColor: Colors.blue,
    //         child: Icon(Icons.add),
    //         onPressed: () {
    //           currentController.incrementCounter();
    //         },
    //       ),
    //       body: Center(
    //         child:
    //             Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //           Text('this counter value is'),
    //           Text(currentController.model.counter.toString()), // update
    //         ]),
    //       ),
    //     );
    //   },
    // );
  }
}
