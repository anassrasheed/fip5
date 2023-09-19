// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fip5/resources/stringes_manager.dart';
import 'package:fip5/screens/authintication/login/login_controller.dart';
import 'package:fip5/screens/authintication/signup/signup_screen.dart';
import 'package:fip5/screens/gender/gender_screen.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../config/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  FocusNode _emailfocusnode = FocusNode();
  FocusNode _passwordfocusnode = FocusNode();
  bool _obscureText = false;
  LoginController loginController = Get.put(LoginController());
// Initialize it to true to hide the password by default

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

      body: SizedBox(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                    FipText(
                      title: AppString.kit,
                      fontWeight: FontWeight.bold,
                      fontSize: 36.sp,
                      TextColor: AppColors.buttonColor,
                    )
                  ],
                ),
                FipText(
                  title: AppLocalizations.of(context)!.welcome,
                  fontWeight: FontWeight.w500,
                  fontSize: 36.sp,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonViews().textFormField(
                    Controller: _emailcontroller,
                    FocusNode: _emailfocusnode,
                    Hinttext: AppLocalizations.of(context)!.emailid,
                    keyboardtype: TextInputType.emailAddress,
                    suffixicon: Icon(Icons.email)),
                SizedBox(
                  height: 20,
                ),
                CommonViews().textFormField(
                    Controller: _passwordcontroller,
                    FocusNode: _passwordfocusnode,
                    Hinttext: AppLocalizations.of(context)!.password,
                    suffixicon: GetBuilder<LoginController>(
                      init: loginController,
                        builder: (loginController) {
                      return IconButton(
                        //. If _obscureText is false, it shows the "visibility" icon (an eye), indicating that the password is visible.

                        onPressed: () {
                         loginController.passwordVisibility();
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color:
                              Colors.grey, // Customize the icon color as needed
                        ),
                      );
                    })),
                SizedBox(
                  height: 10,
                ),
                FipText(
                  title: AppLocalizations.of(context)!.forgotpassword,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CommonViews().createButton(
                  title: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    // Navigate to the Login screen here
                    FIP5Navigator.of(context)
                        .pushAndRemoveUntil(GenderScreen());
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: FipText(
                    title: AppLocalizations.of(context)!.or,
                    fontWeight: FontWeight.w500,
                    TextColor: Colors.red,
                    fontSize: 18.sp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 15.w,
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
                          width: 15.w,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FipText(
                          title:
                              AppLocalizations.of(context)!.donthaveanaccount,
                          fontWeight: FontWeight.w500,
                          TextColor: Colors.red,
                          fontSize: 14.sp,
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
                            title: AppLocalizations.of(context)!.signup,
                            fontWeight: FontWeight.w500,
                            TextColor: Colors.blue,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
