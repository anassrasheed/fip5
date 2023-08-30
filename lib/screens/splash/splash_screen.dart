import 'dart:async';

import 'package:fip5/screens/intro/intro_screen.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../utils/ui/fip5_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonViews().getAppBar(
      //   title: "Splash Screen",
      // ),
      body: Column(children: [
        SizedBox(height: 10.h),
        Lottie.asset('assets/eco_animation.json'),
        SizedBox(
          height: 5.h,
        ),
        Fip5Text(
          title: "Fip5 App",
          textColor: Colors.red,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        const Spacer(),
        Fip5Text(
          title: "2023",
          textColor: Colors.grey,
          fontSize: 30.sp,
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  void _navigate() {
    Timer(const Duration(seconds: 5), () {
      Fip5Navigator.of(context).pushReplacement(const IntroScreen());
    });
  }
}
