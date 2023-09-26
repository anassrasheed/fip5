import 'package:get/get.dart';

class SumController extends GetxController {
  var counter = 0.obs;
  var counter2 = 0.obs;

  void incrementCounter1() {
    counter++;
    // update();
  }

  void incrementCounter2() {
    counter2++;
    // update();
  }

  int get sum => counter.value + counter2.value;
}
