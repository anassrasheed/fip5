// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/config/cache_keys.dart';
import 'package:fip5/screens/authintication/login/login_screen.dart';
import 'package:fip5/screens/intrduction/intro_items.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/helpers/shared_prefs_helper.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<Widget> _screens = [];
  PageController controller = PageController();
  int _screensindex = 0;

  @override
  void initState() {
    _fillPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          SizedBox(
            height: 45.h,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return _screens[index];
              },
              itemCount: _screens.length, // 3  0 1 2
              controller: controller,
              onPageChanged: (pageIndex) {
                setState(() {
                  _screensindex = pageIndex;
                });
              },
            ),
          ),
          SizedBox(height: 25,),
          SmoothPageIndicator(
            controller: controller, // PageController
            count: _screens.length,
            effect: WormEffect(
                activeDotColor: AppColors.activeIndicator,
                dotColor: AppColors.disbaleIndicator,
                spacing: 15), // your preferred effect
            onDotClicked: (index) {},
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonViews().createButton(
                    title: "Back",
                    onPressed: () {
                      controller.animateToPage(_screensindex - 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    }),
                _screensindex == _screens.length - 1
                    ? CommonViews().createButton(
                        title: "Done",
                        onPressed: () {
                          _saveData();
                          FIP5Navigator.of(context)
                              .pushAndRemoveUntil(LoginScreen());
                        })
                    : CommonViews().createButton(
                        title: "Next",
                        onPressed: () {
                          controller.animateToPage(_screensindex + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _fillPages() {
    _screens.add(
        IntroItem(image: "assets/fitman.webp", text: "Welcome to Fit Kit"));
    _screens.add(IntroItem(
        image: "assets/goal.jpg",
        text:
            "Join a thriving fitness community, connect with like-minded individuals, and share your successes on your fitness journey."));
    _screens.add(IntroItem(
        image: "assets/gym_1.png",
        text:
            "Are you ready to transform your life through fitness? Let's take the first step together! Sign up and get started today."));
  }

  void _saveData() async {
    SharedPreferenceHelper()
        .save(key: CacheKeys.introKey, value: true, type: SaveType.boolType);
  }
}
