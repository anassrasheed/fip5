import 'package:fip5/config/app_colors.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IntroItem extends StatelessWidget {
  final String image;
  final String? text;
  const IntroItem({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(image),
        SizedBox(height: 20.h,),
         Center(
           child: FipText
                 (title: text!,
           fontWeight: FontWeight.normal, 
           TextColor: AppColors.Black),
         ),
      ],
    );
  }
}