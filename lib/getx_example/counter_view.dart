
// ignore_for_file: prefer_const_constructors

import 'package:fip5/getx_example/counter_controller.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  //Creates an instance of CounterController using GetX's dependency injection and assigns it to currentController.
 final CounterController currentController =
      Get.put(CounterController()); // init  dependency injection
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "getx"),
      //Creates a floating action button using GetX's Obx widget to observe changes in the counter.
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
         
          Obx(() {
            //في هذا المثال، ستقوم أداة النص بتحديث نصها كلما تغير العداد الذي يمكن ملاحظته.
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
    /// ** the GetBuilder :
    //It allows you to rebuild parts of the widget tree based on changes in a specific controller or state class.
    
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