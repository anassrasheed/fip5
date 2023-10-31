import 'package:get/get.dart';

class GeneralStatusModel {
  // status // waiting error, success
  Rx<GeneralStatus> status = GeneralStatus.waiting.obs;
  RxString errorMsg="".obs;

  void updateStatus(GeneralStatus newStatus){
    status.value=newStatus;
  }
  void updateError(String nError){
    errorMsg.value=nError;
  }
}

enum GeneralStatus { waiting, success, error }
