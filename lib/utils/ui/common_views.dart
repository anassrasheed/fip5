// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

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
        child: FipText(
          title: title,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          TextColor: Colors.grey,
        ));
  }

  Widget textFormField(
      {required Controller,
      required FocusNode,
      required Widget suffixicon,
      required String Hinttext,
    bool  obscuretext =false ,
     keyboardtype =TextInputType.text,
       InputBorder? enabledBorder, // Optional custom enabledBorder

      }) {
    return TextFormField(
      focusNode: FocusNode,
      controller: Controller,
      obscureText:obscuretext ,
      keyboardType:keyboardtype ,
      decoration: InputDecoration(
        hintText: Hinttext,

        disabledBorder:UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.buttonColor,
          )
        ),
    enabledBorder: enabledBorder ?? UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.buttonColor, // Default color if not provided
        ),
      ),
       focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.buttonColor,
        )
       ),
        
      
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixicon,
      ),
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

  // Widget createButton(
  //     {required String title, required VoidCallback onPressed}) {
  //   return ElevatedButton(
  //       onPressed: onPressed,
  //       style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
  //       child: FipText(
  //         title: title,
  //         TextColor: Colors.grey, fontWeight: FontWeight.bold,
  //       ));
  // }
}
