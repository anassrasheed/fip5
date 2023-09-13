import 'dart:async';

import 'package:fip5/config/cache_keys.dart';
import 'package:fip5/resources/stringes_manager.dart';
import 'package:fip5/screens/authintication/login/login_screen.dart';
import 'package:fip5/screens/intrduction/intro_screen.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/helpers/shared_prefs_helper.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _navigate();
    super.initState();
  }

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

  void _navigate() {
    Timer(const Duration(seconds: 5), () async {
      bool? isIntroEnteredBefore = await SharedPreferenceHelper()
          .read(key: CacheKeys.introKey, type: SaveType.boolType) as bool?;
      FIP5Navigator.of(context).pushReplacement(
          isIntroEnteredBefore != null && isIntroEnteredBefore
              ? const LoginScreen()
              : const IntroScreen());
    });
  }
}
