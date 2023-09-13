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
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  FocusNode _emailfocusnode = FocusNode();
  FocusNode _passwordfocusnode = FocusNode();
  bool _obscureText =
      false; // Initialize it to true to hide the password by default

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
                  title: AppString.Welcome,
                  fontWeight: FontWeight.w500,
                  fontSize: 36.sp,
                ),
                
                SizedBox(
                  height: 20.h,
                ),
                 CommonViews().textFormField(
                    Controller: _emailcontroller,
                    FocusNode: _emailfocusnode,
                    Hinttext: AppString.EmailId,
                    keyboardtype: TextInputType.emailAddress,
                    suffixicon: Icon(Icons.email)),
                
                // TextFormField(
                //   decoration: InputDecoration(
                //     hintText: 'Email Id*',
                //     hintStyle: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     suffixIcon: Icon(Icons.email),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                // TextFormField(
                //   obscureText: true, // For password input
                //   decoration: InputDecoration(
                //     hintText: 'Password*',
                //     hintStyle: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     suffixIcon: Icon(Icons.lock),
                //   ),
                // ),
                CommonViews().textFormField(
                  Controller: _passwordcontroller,
                  FocusNode: _passwordfocusnode,
                  Hinttext: AppString.Password,
                  suffixicon: IconButton(
                    //. If _obscureText is false, it shows the "visibility" icon (an eye), indicating that the password is visible.
                    onPressed: () {
                      setState(() {
                        _obscureText =
                            !_obscureText; // Toggle the obscureText value
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey, // Customize the icon color as needed
                    ),
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
                          width: 6.w,
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
                          width: 6.w,
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
      ),
    );
  }
}
