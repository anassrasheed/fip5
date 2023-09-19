// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, must_be_immutable

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/screens/intrduction/intro_controller.dart';
import 'package:fip5/screens/intrduction/intro_items.dart';
import 'package:fip5/screens/intrduction/intro_model.dart';

import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatelessWidget {
  final List<Widget> _screens = [];

  PageController controller = PageController();

  IntroController introController = Get.put(IntroController());

  IntroScreen({super.key});

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
                return IntroItem(
                  introModel: IntroModel(image: introController.introItems[index].image, text: introController.introItems[index].text),

                 
                );
              },
              itemCount: introController.introItems.length,
              controller: introController.pageController,
              onPageChanged: introController.onPageChanged,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SmoothPageIndicator(
            controller: introController.pageController, // PageController
            count: introController.introItems.length,
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
                    title: "Back", onPressed: introController.goToPreviousPage),
                introController.currentIndex ==
                        introController.introItems.length - 1
                    ? CommonViews().createButton(
                        title: "Done",
                        onPressed: introController.goToNextPage,
                      )
                    : CommonViews().createButton(
                        title: "Next",
                        onPressed: introController.goToNextPage,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _fillPages() {
    _screens.add(
        IntroItem(
          introModel: IntroModel(image: "assets/fitman.webp",text: "Welcome to Fit Kit"),
         ));
    _screens.add(

      IntroItem(
        introModel: IntroModel(image:  "assets/goal.jpg", text: "Join a thriving fitness community, connect with like-minded individuals, and share your successes on your fitness journey."),
       
            ));
    _screens.add(
      IntroItem(
        introModel: IntroModel(image:  "assets/gym_1.png", text:     "Are you ready to transform your life through fitness? Let's take the first step together! Sign up and get started today."),
      
        ));
  }
}
