import 'package:fip5/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: Text(title, style: const TextStyle(color: Colors.black)),
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
      bool isObscure = false}) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: inputAction,
      obscureText: isObscure,
      autovalidateMode: AutovalidateMode.always,
      validator: (v) {
        if (validator != null) return validator!.call(v.toString());
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

  void showSnackBar(String title, String msg) {
    Get.snackbar(title, msg,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        duration: Duration(seconds: 5));
  }
}
//
// mixin Fip5Views {
//   AppBar getAppBar({required String title, Color? color}) {
//     return AppBar(
//         backgroundColor: color ?? Colors.white,
//         elevation: 4,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
//         title: Text(title, style: TextStyle(color: Colors.black)),
//         centerTitle: true);
//   }
//
//   Widget createButton(
//       {required String title, required VoidCallback onPressed}) {
//     return ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(backgroundColor: AppColors.buttonColor),
//         child: Fip5Text(
//           title: title,
//           textColor: Colors.white,
//         ));
//   }
//
//   Widget createTextFormField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//   }) {
//     return TextFormField(
//       controller: controller,
//       focusNode: focusNode,
//       decoration: InputDecoration(
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide:
//                   BorderSide(color: AppColors.scaffoldBackgroundColor))),
//     );
//   }
// }
