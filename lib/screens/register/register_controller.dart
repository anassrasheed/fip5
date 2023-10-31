import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fip5/config/firebase_error/firebase_error_messages.dart';
import 'package:fip5/screens/login/login_screen.dart';
import 'package:fip5/screens/register/user_model.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/helpers/general_status_model.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // late var statusModel = GeneralStatusModel().obs;
  late var statusModel = GeneralStatusModel().obs;

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> registerWithEmailAndPassword(UserModel userModel) async {
    if (isValid(userModel.email, userModel.password ?? '')) {
      try {
        ProgressHud.shared.startLoading(Get.context);
        var result = await _auth.createUserWithEmailAndPassword(
            email: userModel.email, password: userModel.password!);

        if (result.user != null) {
          userModel.uid = result.user!.uid;
          userModel.imgUrl = await saveImageToStorage(userModel.file!);
          _registerUserToFirestore(userModel);
        } else {
          ProgressHud.shared.stopLoading();
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

  void registerWithApi(UserModel userModel) async {
    ProgressHud.shared.startLoading(Get.context);
    statusModel.value.updateStatus(GeneralStatus.waiting);

    var url = Uri.parse(
        'http://newcamels.albatross-solution.com/API/App/MasterCustomerInformation/RegisterCustomer');
    Map<String, dynamic> body = {
      "lookupCountryId": 5,
      "masterCustomerInformationFullName": "stepbystep academy",
      "masterCustomerInformationMobileNo": userModel.mobile,
      "masterCustomerInformationUserName": "fipp5",
      "masterCustomerInformationPassword": userModel.password,
      "deviceId": "string",
      "deviceType": "string",
      "deviceOs": "string",
      "deviceToken": "string",
      "appVersion": "string"
    };
    var response = await http.post(url, body: json.encode(body), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    ProgressHud.shared.stopLoading();
    if ((response.statusCode >= 200 && response.statusCode < 300)) {
      if (response.body.isEmpty) {
        statusModel.value.updateStatus(GeneralStatus.error);
        statusModel.value.updateError("Register Failed");
        CommonViews().showSnackBar("Failed", "Registration UnSuccessful");
        return;
      }
      statusModel.value.updateStatus(GeneralStatus.success);
      FIP5Navigator.of(Get.context!).pushAndRemoveUntil(LoginScreen());
      return;
    }
    statusModel.value.updateStatus(GeneralStatus.error);
    statusModel.value.updateError("Something went wrong");
  }

  get isWaiting => statusModel.value.status.value == GeneralStatus.waiting;

  get isError => statusModel.value.status.value == GeneralStatus.error;

  get isSuccess => statusModel.value.status.value == GeneralStatus.success;



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

  void _registerUserToFirestore(UserModel userModel) async {
    try {
      var collection = FirebaseFirestore.instance.collection("users");
      await collection.add(userModel.toMap());
      ProgressHud.shared.stopLoading();
      CommonViews().showSnackBar("Success", "Registration Successful");
      FIP5Navigator.of(Get.context!).pushAndRemoveUntil(LoginScreen());
    } catch (error) {
      if (error is FirebaseException) {
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      }
    }
  }

  Future<String> saveImageToStorage(File imgFile) async {
    try {
      Reference storageReference = FirebaseStorage.instance.ref();
      String fileName =
          "fip5_${DateTime.now().millisecondsSinceEpoch}${Random().nextInt(1000)}";
      Reference imageRef = storageReference.child("images/$fileName.jpg");
      await imageRef.putFile(imgFile);
      return imageRef.getDownloadURL();
    } catch (error) {
      if (error is FirebaseException) {
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      }
      return "";
    }
  }
}
