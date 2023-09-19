import 'package:fip5/config/app_colors.dart';
import 'package:fip5/screens/intrduction/intro_model.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroItem extends StatelessWidget {

   final IntroModel introModel;


  const IntroItem({required this.introModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
         introModel.image ,
          height: 30.h,
        ),
        const SizedBox(
          height: 30,
        ),
        FipText(
            title:introModel.text ,
            fontWeight: FontWeight.normal,
            TextColor: AppColors.Black),
      ],
    );
  }
}
