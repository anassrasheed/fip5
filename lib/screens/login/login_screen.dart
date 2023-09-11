import 'package:fip5/config/app_colors.dart';
import 'package:fip5/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../utils/ui/common_views.dart';
import '../../utils/ui/fip5_text.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final commonViews = CommonViews();
    return Scaffold(
      appBar: commonViews.getAppBar(title: 'Login'),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.0.w,vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w),
              child: SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Image.asset('assets/shop (1).png')),
            ),
            SizedBox(height: 3.0.h),
            CommonViews().customTextField(abscureText: false, labelText: "EMAIL"),
            SizedBox(height: 3.0.h),
            CommonViews().customTextField(abscureText: true, labelText: "PASSWORD"),
             SizedBox(height: 3.0.h),
            commonViews.createButton(
              title: 'Login',
              onPressed: () {},
            ),
            SizedBox(height: 5.0.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: const Fip5Text(title: 'Don\'t have an account? Signup', textColor: AppColors.blackTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


