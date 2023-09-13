import 'package:get/get.dart';

import 'counter_model.dart';

class CounterController extends GetxController {
  // inheritance
  // var model = CounterModel().obs; // reactive listen stream
  var counter = 0.obs;
  var counter2 = 0.obs;

  void incrementCounter() {
    counter.value++;
  }

  void decreaseCounter() {
    counter.value--;
  }
}
