
import 'package:fip5/resources/stringes_manager.dart';
import 'package:fip5/screens/splash/splash_controller.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController splashController =Get.put(SplashController());
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/olympic-athlete.json',
              width: 100.w, // Use .w for width scaling
              height: 50.h, // Use .h for height scaling
            ),
            SizedBox(height: 5.h), // Use .sp for font size scaling
            FipText(
              title: AppString.fit + AppString.kit,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              TextColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  
}
