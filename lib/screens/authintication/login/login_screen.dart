// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fip5/resources/stringes_manager.dart';
import 'package:fip5/screens/authintication/signup/signup_screen.dart';
import 'package:fip5/screens/gender/gender_screen.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../config/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFF8F8F8), // Use the 0x prefix to specify a hexadecimal color
      appBar: AppBar(
        backgroundColor: Color(
            0xFFF8F8F8), // Use the 0x prefix to specify a hexadecimal color
        elevation: 0,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
                    fontSize: 36.sp,
                    TextColor: AppColors.buttonColor,
                  )
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              FipText(
                title: AppString.Welcome,
                fontWeight: FontWeight.w500,
                fontSize: 36.sp,
              ),
              FipText(
                title: AppString.kit,
                fontWeight: FontWeight.w500,
                fontSize: 24.sp,
              ),

              SizedBox(
                height: 35.h,
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email Id*',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true, // For password input
                decoration: InputDecoration(
                  hintText: 'Password*',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
              Text("Forgot Password?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),

              SizedBox(
                height: 10.h,
              ),
              Spacer(),
              CommonViews().createButton(
                title: AppString.login,
                onPressed: () {
                  // Navigate to the Login screen here
                  FIP5Navigator.of(context).pushAndRemoveUntil(GenderScreen());
                },
              ),

              SizedBox(height: 10.h),
              Center(
                child: FipText(
                  title: AppString.oR,
                  fontWeight: FontWeight.w500,
                  TextColor: AppColors.textcolor,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100.w,
                        height: 46.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.twitter,
                        ),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.twitter,
                            color: AppColors.textcolor,
                          ),
                          onPressed: () {
                            // Handle Twitter button press here
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        width: 100.w,
                        height: 46.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.facebook,
                        ),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: AppColors.textcolor,
                          ),
                          onPressed: () {
                            // Handle Facebook button press here
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FipText(
                        title: AppString.Donthaveanaccount,
                        fontWeight: FontWeight.w500,
                        TextColor: AppColors.textcolor,
                        fontSize: 18.sp,
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to the Login screen here
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: FipText(
                          title: AppString.signup,
                          fontWeight: FontWeight.w500,
                          TextColor: AppColors.textcolor,
                          fontSize: 18.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h), // Adjust the spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
