// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_literals_to_create_immutables


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

  Widget languageButton({required VoidCallback ontap , required image ,required title}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 180,
        width: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 248, 248),
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            const BoxShadow(
                color: Color.fromARGB(255, 241, 241, 241),
                blurRadius: 6.0,
                spreadRadius: 3.0,
                offset: Offset(
                  3.0, // Move to right 7.0 horizontally
                  3.0,
                ))
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child:
                  Image.asset(image, fit: BoxFit.contain),
            ),
            SizedBox(
              height: 9,
            ),
            FipText(title: title, fontWeight: FontWeight.bold,TextColor: AppColors.Black,)

          ],
        ),
      ),
    );
  }


  Widget textFormField({
    required Controller,
    required FocusNode,
    required Widget suffixicon,
    required String Hinttext,
    bool obscuretext = false,
    keyboardtype = TextInputType.text,
    InputBorder? enabledBorder, // Optional custom enabledBorder
  }) {
    return TextFormField(
      focusNode: FocusNode,
      controller: Controller,
      obscureText: obscuretext,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        hintText: Hinttext,
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.buttonColor,
        )),
        enabledBorder: enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.buttonColor, // Default color if not provided
              ),
            ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.buttonColor,
        )),
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

  
}
