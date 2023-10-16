// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_literals_to_create_immutables

import 'package:fip5/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

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
   ListTile buildListTile(String title, IconData icon, VoidCallback onTap) {
  return ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
    title: Text(
      title,
      style: TextStyle(color: AppColors.Black),
    ),
    leading: Icon(
      icon,
      color: AppColors.buttonColor,
    ),
    trailing: Icon(
      Icons.arrow_forward_ios,  // Change this to the appropriate icon for a back arrow
      color: AppColors.buttonColor,
    ),
    onTap: onTap,
  );
}

 
  void showSnackBar(String title, String msg) {
    Get.snackbar(title, msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        duration: Duration(seconds: 5));
  }
     Widget createTextFormField(
      {required TextEditingController controller,
      required FocusNode focusNode,
      required String label,
      TextInputType keyboardType = TextInputType.text,
      TextInputAction inputAction = TextInputAction.done,
      ValueChanged<String>? onSubmitted,
      String? prefixText,
      String? hint,
      Widget? suffixIcon,
      String? errorText,
      FormFieldValidator<String>? validator,
        bool convertToLowercase = false,

      bool isObscure = false}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: inputAction,
      obscureText: isObscure,
      autovalidateMode: AutovalidateMode.always,
       onChanged: (value) {
      if (convertToLowercase) {
        controller.value = controller.value.copyWith(
          text: value.toLowerCase(),
          selection: TextSelection.collapsed(offset: value.length),
        );
      }
    },
      validator: (v) {
        if (validator != null) return validator.call(v.toString());
        return null;
      },
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        labelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        hintText: hint,
        // prefixText: prefixText,
        prefix: Text(prefixText ?? ''),
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        // prefixIcon: Text(prefixText??''),
        border: _getBorder(),
        enabledBorder: _getBorder(),
        disabledBorder: _getBorder(),
        focusedBorder: _getBorder(),
      ),
    );
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.brown));
  }
}





Widget languageButton(
    {required VoidCallback ontap, required image, required title}) {
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
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          SizedBox(
            height: 9,
          ),
          FipText(
            title: title,
            fontWeight: FontWeight.bold,
            TextColor: AppColors.Black,
          )
        ],
      ),
    ),
  );
}




