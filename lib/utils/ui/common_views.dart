import 'package:fip5/config/app_colors.dart';
import 'package:flutter/material.dart';

import 'fip5_text.dart';

class CommonViews {
  // singleton Ready

  static final CommonViews _shared =
      CommonViews._private(); // new object address 123
  factory CommonViews() => _shared;

  CommonViews._private(); // private constructor

  AppBar getAppBar({required String title, Color? color}) {
    return AppBar(
        backgroundColor: color ?? Colors.white,
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        title: Text(title, style: TextStyle(color: Colors.black)),
        centerTitle: true);
  }

  Widget createButton(
      {required String title, required VoidCallback onPressed}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
        child: Fip5Text(
          title: title,
          textColor: Colors.white,
        ));
  }

  Widget customTextField({required bool abscureText, required String labelText}){
    return  TextFormField(
      obscureText: abscureText,
      decoration:  InputDecoration(labelText: labelText),
    );
  }
}

mixin Fip5Views {
  AppBar getAppBar({required String title, Color? color}) {
    return AppBar(
        backgroundColor: color ?? Colors.white,
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        title: Text(title, style: TextStyle(color: Colors.black)),
        centerTitle: true);
  }

  Widget createButton(
      {required String title, required VoidCallback onPressed}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
        child: Fip5Text(
          title: title,
          textColor: Colors.white,
        ));
  }
}
