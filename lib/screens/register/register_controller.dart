import 'package:fip5/config/firebase_error/firebase_error_messages.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    if (isValid(email, password)) {
      try {
        ProgressHud.shared.startLoading(Get.context);
        var result = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        ProgressHud.shared.stopLoading();
        if (result.user != null) {
          CommonViews().showSnackBar("Success", "Registration Successful");
        } else {
          CommonViews().showSnackBar("Failed", "Registration UnSuccessful");
        }
        FocusManager.instance.primaryFocus!.unfocus();
      } catch (error) {
        ProgressHud.shared.stopLoading();
        if (error is FirebaseException) {
          CommonViews()
              .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
        } else {
          CommonViews()
              .showSnackBar("Failed", "Registration UnSuccessful$error");
        }
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }
  }

  bool isValid(String email, String password) {
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = "Email is Required";
      return false;
    } else if (password.isEmpty) {
      passwordError.value = "Password is Required";
      return false;
    } else if (password.length < 6) {
      passwordError.value = "please enter Strong password";
      return false;
    }
    return true;
  }
}
