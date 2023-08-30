import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Fip5Text extends StatelessWidget {
  final String title;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const Fip5Text(
      {Key? key,
      required this.title,
      this.textColor = Colors.brown,
      this.fontWeight,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize ?? 11.sp,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
