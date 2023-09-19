import 'package:fip5/config/cache_keys.dart';
import 'package:fip5/screens/intrduction/intro_model.dart';
import 'package:fip5/screens/language/languages.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/helpers/shared_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
   late PageController pageController;
  int currentIndex = 0;
   List<IntroModel> get introItems => [
    IntroModel(image: "assets/fitman.webp", text: "Welcome to Fit Kit"),
    IntroModel(image: "assets/goal.jpg", text: "Join a thriving fitness community, connect with like-minded individuals, and share your successes on your fitness journey."),
    IntroModel(image: "assets/gym_1.png", text: "Are you ready to transform your life through fitness? Let's take the first step together! Sign up and get started today."),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     pageController = PageController();
  }
 void onPageChanged(int index) {
    currentIndex = index;
    update();
  }
  void goToNextPage() {
    if (currentIndex < 2) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      update();
    } else {
      _saveData();
      FIP5Navigator.of(Get.context ??   Get.key.currentContext!).pushAndRemoveUntil(LanguageScreen());
    }
  }
   void goToPreviousPage() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      update();
    }
  }

  void _saveData() async {
    await SharedPreferenceHelper()
        .save(key: CacheKeys.introKey, value: true, type: SaveType.boolType);
  }


  
}