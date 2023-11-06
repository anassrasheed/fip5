import 'package:fip5/getx/sum_example/sum_result.dart';
import 'package:fip5/main.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sum_example/sum_controller.dart';
import '../sum_example/sum_view.dart';

class InitPage extends StatelessWidget {
  InitPage({Key? key}) : super(key: key);

  // SumController controller = Get.put(SumController());
 // offline  without internet   -- local storage  / sqlite
  // online with internet   firebase / api
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "Init page"),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => SumView(), binding: BindingsBuilder(() {
                  Get.put(SumController());
                }));
              },
              child: Text("go to sum example")),
          ElevatedButton(
              onPressed: () {
                Get.to(() => SumResult());
              },
              child: Text("go to sum Result")),
        ]),
      ),
    );
  }
}
