import 'package:get/get.dart';


class CounterController extends GetxController {
  // inheritance
  // var model = CounterModel().obs; // reactive listen stream
  //-----------------------------------------------------------------------------------------------------------

  // **** THE Observables (.obs)
  //Here, two variables counter and counter2 are defined as observables using .obs extension. 
  //Observables in GetX allow for reactive programming, 
  //where updates to these variables will automatically trigger updates in any widgets that are listening to them.
  
  //------------------------------------------------------------------------------------------------------------
  var counter = 0.obs;
  var counter2 = 0.obs;

  void incrementCounter() {
    counter.value++;
  }

  void decreaseCounter() {
    counter.value--;
  }
}

// obs is a method provided by GetX that you can use to make a variable reactive.
//You use obs to create observable variables. Observable variables automatically trigger updates in the UI whenever their values change

//  ************************************************************************************************************ //
//THE Summary : 
//Obx is used to observe changes in specific observables,
// GetBuilder is used to rebuild parts of the UI based on changes in a controller's state, 
//and obs is used to make individual variables reactive so that changes to their values trigger UI updates.