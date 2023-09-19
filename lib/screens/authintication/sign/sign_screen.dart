// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/resources/stringes_manager.dart';
import 'package:fip5/screens/authintication/login/login_screen.dart';
import 'package:fip5/screens/authintication/signup/signup_screen.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/fitman.webp", 
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // First Text Element
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  child: Text(AppString.fit),
                ),
                SizedBox(width: 7.w),
                FipText(
                  title: AppString.kit,
                  fontWeight: FontWeight.bold,
                  TextColor: AppColors.buttonColor,
                )
              ],
            ),
          ),
          // Second Text Element
          Positioned(
            top: 100, // Adjust the position as needed
            left: 20, // Adjust the position as needed
            child: 
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Sign Up Button
          Positioned(
              bottom: 20, // Adjust the position as needed
              left: 20, // Adjust the position as needed
              right: 20, // Adjust the position as needed
              child: CommonViews().createButton(
                  title:AppLocalizations.of(context)!.signup,
                  onPressed:() {
                    FIP5Navigator.of(context)
                            .pushAndRemoveUntil(SignupScreen());
                  }
          
              ),),
          // Log In With Account Text Button
          Positioned(
            bottom: 60, // Adjust the position as needed
            left: 20, // Adjust the position as needed
            child: TextButton(
              onPressed: () {
                // Add your Log In logic here
                   FIP5Navigator.of(context)
                   .pushAndRemoveUntil(LoginScreen());
                
              },
              child:
               FipText(
                  title:AppLocalizations.of(context)!. loginwithacount,
                  fontWeight: FontWeight.w400,
                  TextColor: AppColors.textcolor,
                  fontSize: 16,

                )
              
            ),
          ),
        ],
      ),
    );
  }
}
