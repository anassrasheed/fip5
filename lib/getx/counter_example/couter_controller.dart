import 'package:get/get.dart';

class CounterController extends GetxController {
  // inheritance
  // var model = CounterModel().obs; // reactive listen stream
  RxInt counter = 0.obs;
  RxInt counter2 = 0.obs;

  // var counter2 = 0.obs;

  void incrementCounter() {
    counter.value++;
  }

  void incrementCounter2() {
    counter2.value++;
  }

  void decrementCounter() {
    counter.value--;
  }

  // recursion for
}
