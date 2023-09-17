// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FipText extends StatelessWidget {
  final String title;
  final TextColor;
  final double? fontSize;

  // the red is defult

  const FipText({
    super.key,
    required this.title,
    this.TextColor,
    this.fontSize,
    required FontWeight fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      
      style: TextStyle(
          fontSize: fontSize ?? 11.sp,
          color: TextColor,
          fontWeight: FontWeight.bold,
          //decoration: TextDecoration.underline
          ),
    );
  }
}
