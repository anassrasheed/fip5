// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/main.dart';
import 'package:fip5/resources/stringes_manager.dart';
import 'package:fip5/screens/authintication/sign/sign_screen.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import '../../utils/helpers/fip5_navigator.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CommonViews commonViews =
        CommonViews(); // Create an instance of CommonViews

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        FipText(
                          title: AppString.Choosethelanguageyou,
                          fontWeight: FontWeight.w400,
                          TextColor: AppColors.buttonColor,
                        ),
                        FipText(
                          title: AppString.prefertouse,
                          fontWeight: FontWeight.w400,
                          TextColor: AppColors.buttonColor,
                        ),
                      ]),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // InkWell(
                      //   // onTap: () {
                      //   //   MyApp.of(context)!.setLocale(
                      //   //       const Locale.fromSubtags(languageCode: 'en'));
                      //   //   FIP5Navigator.of(context)
                      //   //       .pushAndRemoveUntil(LoginScreen());
                      //   // },
                      //   onTap: () {
                      //       print('English button tapped');
                      //       MyApp.of(context)!.setLocale(
                      //         const Locale.fromSubtags(languageCode: 'en'));
                      //          FIP5Navigator?.of(context)
                      //           .pushAndRemoveUntil(LoginScreen());

                      //   },
                      //   child: Container(
                      //     height: 180,
                      //     width: 150,
                      //     padding: const EdgeInsets.all(20),
                      //     decoration: BoxDecoration(
                      //       color: const Color.fromARGB(255, 248, 248, 248),
                      //       border: Border.all(color: Colors.white),
                      //       borderRadius: BorderRadius.circular(25),
                      //       boxShadow: [
                      //         const BoxShadow(
                      //             color: Color.fromARGB(255, 241, 241, 241),
                      //             blurRadius: 6.0,
                      //             spreadRadius: 3.0,
                      //             offset: Offset(
                      //               3.0, // Move to right 7.0 horizontally
                      //               3.0,
                      //             ))
                      //       ],
                      //     ),
                      //     child: Column(
                      //       children: [
                      //         SizedBox(
                      //           height: 100,
                      //           width: 100,
                      //           child: Image.asset("assets/english.png",
                      //               fit: BoxFit.contain),
                      //         ),
                      //         SizedBox(
                      //           height: 9,
                      //         ),
                      //         FipText(
                      //           title: "English",
                      //           fontWeight: FontWeight.bold,
                      //           TextColor: AppColors.Black,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      commonViews.languageButton(
                        image: "assets/english.png",
                        ontap: () {
                          MyApp.of(context).setLocale(
                              const Locale.fromSubtags(languageCode: 'en'));
                          FIP5Navigator.of(context)
                              .pushAndRemoveUntil(SignScreen());
                        },
                        title: "English",
                      ),

                      const SizedBox(
                        width: 20,
                      ),
                      // InkWell(
                      //   // onTap: () {
                      //   //   MyApp.of(context)!.setLocale(
                      //   //       const Locale.fromSubtags(languageCode: 'ar'));
                      //   //   FIP5Navigator.of(context)
                      //   //       .pushAndRemoveUntil(LoginScreen());
                      //   // },
                      //   onTap: () {
                      //       print('arabic button tapped');
                      //        MyApp.of(context)!.setLocale(
                      //         const Locale.fromSubtags(languageCode: 'ar'));
                      //          FIP5Navigator?.of(context)
                      //           .pushAndRemoveUntil(LoginScreen());

                          
                      //   },

                      //   child: Container(
                      //     height: 180,
                      //     width: 150,
                      //     padding: const EdgeInsets.all(20),
                      //     decoration: BoxDecoration(
                      //       color: const Color.fromARGB(255, 248, 248, 248),
                      //       border: Border.all(color: Colors.white),
                      //       borderRadius: BorderRadius.circular(25),
                      //       boxShadow: [
                      //         const BoxShadow(
                      //             color: Color.fromARGB(255, 241, 241, 241),
                      //             blurRadius: 6.0,
                      //             spreadRadius: 3.0,
                      //             offset: Offset(
                      //               3.0, // Move to right 7.0 horizontally
                      //               3.0,
                      //             ))
                      //       ],
                      //     ),
                      //     child: Column(
                      //       children: [
                      //         SizedBox(
                      //           height: 100,
                      //           width: 100,
                      //           child: Image.asset("assets/arabic.png",
                      //               fit: BoxFit.contain),
                      //         ),
                      //         SizedBox(
                      //           height: 9,
                      //         ),
                      //         FipText(
                      //           title: "العربية",
                      //           fontWeight: FontWeight.bold,
                      //           TextColor: AppColors.Black,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      commonViews.languageButton(
                        image: "assets/arabic.png",
                        ontap: () {
                          MyApp.of(context).setLocale(
                              const Locale.fromSubtags(languageCode: 'ar'));
                          FIP5Navigator.of(context)
                              .pushAndRemoveUntil(SignScreen());
                        },
                        title: "العربية",
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
