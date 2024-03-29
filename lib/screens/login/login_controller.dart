import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fip5/config/api_config.dart';
import 'package:fip5/config/current_session.dart';
import 'package:fip5/config/firebase_error/firebase_error_messages.dart';
import 'package:fip5/screens/home/home_screen.dart';
import 'package:fip5/screens/register/user_model.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'login_response.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void login(String email, String password) async {
    try {
      if (isValid(email, password)) {
        ProgressHud.shared.startLoading(Get.context);

        UserCredential response = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (response.user != null) {
          UserModel? model = await _getDataFromFirestore(response.user!.uid);
          ProgressHud.shared.stopLoading();
          if (model != null) {
            CurrentSession().user = model;
            CommonViews().showSnackBar("Success", "Login Successful");
            // navigation
            FIP5Navigator.of(Get.context!).pushAndRemoveUntil(HomeScreen());
            // save user
          } else {
            CommonViews().showSnackBar("Failed", "Login Failed");
          }
        }
      }
    } catch (error) {
      ProgressHud.shared.stopLoading();
      if (error is FirebaseException) {
        print(error.code);
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      } else {
        CommonViews().showSnackBar("Failed", error.toString());
      }
    }
  }

  void loginWithApi(String email, String password) async {
    try {
      if (isValid(email, password)) {
        ProgressHud.shared.startLoading(Get.context);

        var url = Uri.parse(ApiConfig.login);
        Map<String, dynamic> body = {
          "masterCustomerInformationUserName": email,
          "masterCustomerInformationPassword": password,
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
        if (response.statusCode == 200) {
          LoginResponse myResp = LoginResponse.fromJson(response.body);
          if (myResp.success == true) {
            CurrentSession().myUser = myResp.result;
            FIP5Navigator.of(Get.context!).pushAndRemoveUntil(HomeScreen());
            return;
          } else {
            CommonViews().showSnackBar("Failed", myResp.message ?? '');
          }
        }
      }
    } catch (error) {
      ProgressHud.shared.stopLoading();
      if (error is FirebaseException) {
        print(error.code);
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      } else {
        CommonViews().showSnackBar("Failed", error.toString());
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
    }
    return true;
  }

  Future<UserModel?> _getDataFromFirestore(String uid) async {
    try {
      var collection = FirebaseFirestore.instance.collection("users");
      var result = await collection.where("uid", isEqualTo: uid).get();
      if (result.docs.isNotEmpty) {
        UserModel model = UserModel.fromMap(result.docs.first.data());
        return model;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  void getDataWhereId() async {
    try {
      ProgressHud.shared.startLoading(Get.context);

      var url = Uri.parse(ApiConfig.getUserById);

      var response = await http.post(url, body: json.encode({}), headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer ${CurrentSession().myUser!.token!}",
      });
      ProgressHud.shared.stopLoading();
      if (response.statusCode == 200) {
        LoginResponse myResp = LoginResponse.fromJson(response.body);
        if (myResp.success == true) {
          CommonViews().showSnackBar("Success",
              "Welcome to our app ${myResp.result!.masterCustomerInformationFullName!}");
          return;
        } else {
          CommonViews().showSnackBar("Failed", myResp.message ?? '');
        }
      }
    } catch (error) {
      ProgressHud.shared.stopLoading();
      if (error is FirebaseException) {
        print(error.code);
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      } else {
        CommonViews().showSnackBar("Failed", error.toString());
      }
    }
  }
}

// get token DONE
// firebase firestore CRUD create read   update delete DONE
// firebase notitfication // jahez DONE
// firebase ai mlkit
// firebase auth otp // paid  mobile

// upload to store
// google
// apple
