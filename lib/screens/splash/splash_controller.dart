// ignore_for_file: unused_element

import 'dart:async';

import 'package:fip5/config/cache_keys.dart';
import 'package:fip5/screens/authintication/login/login_screen.dart';
import 'package:fip5/screens/intrduction/intro_view.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/helpers/shared_prefs_helper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _navigate();
    super.onInit();
  }
   void _navigate() {
    Timer(const Duration(seconds: 5), () async {
      bool? isIntroEnteredBefore = await SharedPreferenceHelper()
          .read(key: CacheKeys.introKey, type: SaveType.boolType) as bool?;
      FIP5Navigator.of(Get.context ?? Get.key.currentContext! ).pushReplacement(
          isIntroEnteredBefore != null && isIntroEnteredBefore
              ? const LoginScreen()
              : IntroScreen());
    });
  }
  
}