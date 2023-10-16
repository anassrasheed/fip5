// ignore_for_file: unused_element, prefer_const_constructors

import 'dart:async';

import 'package:fip5/screens/intrduction/intro_view.dart';
import 'package:fip5/screens/new_home/home_task.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
     Timer(const Duration(seconds: 2), navigateToHome);
  }

 void navigateToHome() {
  // Use null-aware operator ?. to safely access members of Get.context
  if (FirebaseAuth.instance.currentUser?.uid == null) {
    FIP5Navigator.of(Get.context!).pushAndRemoveUntil(IntroScreen());
  } else {
    FIP5Navigator.of(Get.context!).pushAndRemoveUntil(HomeTask());
  }
}

  //  void _navigate() {
  //   Timer(const Duration(seconds: 5), () async {
  //     bool? isIntroEnteredBefore = await SharedPreferenceHelper()
  //         .read(key: CacheKeys.introKey, type: SaveType.boolType) as bool?;
  //     FIP5Navigator.of(Get.context ?? Get.key.currentContext! ).pushReplacement(
  //         isIntroEnteredBefore != null && isIntroEnteredBefore
  //             ? const LoginScreen()
  //             : IntroScreen());
  //   });
  // }
   
}