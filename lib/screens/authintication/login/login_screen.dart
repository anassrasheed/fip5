// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/screens/authintication/login/login_controller.dart';
import 'package:fip5/screens/authintication/signup/signup_screen.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _emailfocusnode = FocusNode();
  final FocusNode _passwordfocusnode = FocusNode();
  final FocusNode _mobileFocus = FocusNode();
  bool _isPasswordObscure = true;

  //bool _isPasswordObscure = true;
  LoginController loginController = Get.put(LoginController());
// Initialize it to true to hide the password by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
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
                      child: Text("Fit"),
                    ),
                    FipText(
                      title: "Kit",
                      fontWeight: FontWeight.bold,
                      fontSize: 36.sp,
                      TextColor: AppColors.buttonColor,
                    ),
                  ],
                ),
                FipText(
                  title: AppLocalizations.of(context)!.welcome,
                  fontWeight: FontWeight.w500,
                  fontSize: 36.sp,
                ),
                SizedBox(height: 20.h),
                //    Obx(
                //   () => CommonViews().createTextFormField(
                //       controller: _emailcontroller,
                //       focusNode: _emailfocusnode,
                //       label: "Email",
                //       errorText: loginController.emailError.value.isEmpty
                //           ? null
                //           : loginController.emailError.value,
                //       onSubmitted: (v) {
                //         setState(() {});
                //         _passwordfocusnode.requestFocus();
                //       },
                //       inputAction: TextInputAction.next),
                // ),
                Obx(
                  () => CommonViews().createTextFormField(
                    controller: _emailcontroller,
                    focusNode: _emailfocusnode,
                    label: "Email",
                    errorText: loginController.emailError.value.isEmpty
                        ? null
                        : loginController.emailError.value,
                    onSubmitted: (v) {
                      String trimmedEmail =
                          _emailcontroller.text.trim(); // Trim the email
                      // Update the email controller with the trimmed email
                      _emailcontroller.text = trimmedEmail;
                      setState(() {});
                      _passwordfocusnode.requestFocus();
                    },
                    inputAction: TextInputAction.next,
                  ),
                ),

                SizedBox(height: 20),
                Obx(
                  () => CommonViews().createTextFormField(
                      controller: _passwordcontroller,
                      focusNode: _passwordfocusnode,
                      label: "Password",
                      errorText: loginController.emailError.value.isEmpty
                          ? null
                          : loginController.emailError.value,
                      isObscure: _isPasswordObscure,
                      suffixIcon: InkWell(
                          child: Icon(
                              _isPasswordObscure
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.brown),
                          onTap: () {
                            setState(() {
                              _isPasswordObscure = !_isPasswordObscure;
                            });
                          }),
                      onSubmitted: (v) {
                        _mobileFocus.requestFocus();
                      },
                      inputAction: TextInputAction.next),
                ),
                SizedBox(height: 10),
                FipText(
                  title: AppLocalizations.of(context)!.forgotpassword,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
                SizedBox(height: 5.h),
                CommonViews().createButton(
                  title: AppLocalizations.of(context)!.login,
                  onPressed: () {
                    loginController.login(
                        _emailcontroller.text, _passwordcontroller.text);
                  },
                ),
                SizedBox(height: 10),
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
