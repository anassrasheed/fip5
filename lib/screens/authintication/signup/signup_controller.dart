
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
 
  
  var obscureText =  false; // Initialize it to true to hide the password by default

 var isChecked = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    update();
  }

    
  void toggleCheckbox(bool value) {
    isChecked = value;
    update();
  }
}
