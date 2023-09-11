import 'package:fip5/config/app_colors.dart';
import 'package:fip5/config/cache_keys.dart';
import 'package:fip5/screens/login/login_screen.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/helpers/shared_prefs_helper.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_page_item.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with Fip5Views {
  final List<Widget> _pages = [];
  PageController controller = PageController();
  int _pageIndex = 0;

  @override
  void initState() {
    _fillPages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 150,
        ),
        SizedBox(
          height: 45.h,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return _pages[index];
            },
            itemCount: _pages.length, // 3  0 1 2
            controller: controller,
            onPageChanged: (pageIndex) {
              setState(() {
                _pageIndex = pageIndex;
              });
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller, // PageController
          count: _pages.length,
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
                    controller.animateToPage(_pageIndex - 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                  }),
              _pageIndex == _pages.length - 1
                  ? CommonViews().createButton(
                      title: "Done",
                      onPressed: () {
                        _saveData();
                        FIP5Navigator.of(context)
                            .pushAndRemoveUntil(LoginPage());
                      })
                  : createButton(
                      title: "Next",
                      onPressed: () {
                        controller.animateToPage(_pageIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      }),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ]),
    );
  }

  void _fillPages() {
    _pages.add(IntroPageItem(
      title: "Test title 1",
      image: "assets/first_img.jpg",
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (c) {
              return Container(
                height: 20.h,
                color: Colors.lightBlue,
              );
            });
      },
    ));
    _pages.add(const IntroPageItem(
      title: "Test title 2",
      image: "assets/f_intro_img.png",
    ));
    _pages.add(const IntroPageItem(
      title: "Test title 3",
      image: "assets/third_intro_img.png",
    ));
  }

  void _saveData() async {
    SharedPreferenceHelper()
        .save(key: CacheKeys.introKey, value: true, type: SaveType.boolType);
  }
}
