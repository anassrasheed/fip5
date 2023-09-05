import 'package:fip5/config/app_colors.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';

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
         FipText
        (title: text!,
         fontWeight: FontWeight.normal, 
         textColor: AppColors.disbaleIndicator),
      ],
    );
  }
}