import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fip5/config/firbase_exption/firebase_error_messages.dart';
import 'package:fip5/screens/authintication/login/login_screen.dart';
import 'package:fip5/screens/authintication/signup/signup_model.dart';

import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isChecked = false;

  var obscureText =
      false; // Initialize it to true to hide the password by default
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  GlobalKey<FormState> key = GlobalKey<FormState>();
// Function to register user with email and password
  Future<void> registerWithEmailAndPassword(UserModel userModel) async {
    // Check if the email and password are valid
    if (isValid(userModel.email, userModel.password ?? '')) {
      try {
        // Start loading progress using shared ProgressHud
        ProgressHud.shared.startLoading(Get.context);
        // Attempt to create a user with the provided email and password
        var result = await _auth.createUserWithEmailAndPassword(
            email: userModel.email, password: userModel.password!);
// Check if user creation was successful
        if (result.user != null) {
          // Set the UID and image URL for the userModel
          userModel.uid = result.user!.uid;
          userModel.imgUrl = await saveImageToStorage(userModel.file! as File);
          // Register the user's data to the Firestore database
          _registerUserToFirestore(userModel);
        } else {
          // Stop loading progress and show a snackbar for unsuccessful registration
          ProgressHud.shared.stopLoading();
          CommonViews().showSnackBar("Failed", "Registration UnSuccessful");
        }
        // Unfocus any focused input field
        FocusManager.instance.primaryFocus!.unfocus();
      } catch (error) {
        // Handle any errors that occur during the registration process
        ProgressHud.shared.stopLoading();
        if (error is FirebaseException) {
          // If the error is a Firebase exception, show a snackbar with the corresponding error message
          CommonViews()
              .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
        } else {
          // If it's not a Firebase exception, show a snackbar with a generic error message
          CommonViews()
              .showSnackBar("Failed", "Registration UnSuccessful$error");
        }
        // Unfocus any focused input field
        FocusManager.instance.primaryFocus!.unfocus();
      }
    }
  }

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    obscureText = !obscureText;
    update();
  }

  // Function to toggle checkbox
  void toggleCheckbox(bool value) {
    isChecked = value;
    update();
  }

  // Function to validate email and password
  bool isValid(String email, String password) {
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = "Email is Required";
      return false;
    } else if (password.isEmpty) {
      passwordError.value = "Password is Required";
      return false;
    } else if (password.length < 6) {
      passwordError.value = "please enter Strong password";
      return false;
    }
    return true;
  }

  // Function to register user in Firestore
  void _registerUserToFirestore(UserModel userModel) async {
    try {
      // Get a reference to the Firestore collection named "users"
      var collection = FirebaseFirestore.instance.collection("users");
      // Add the user's data (converted to a map) to the Firestore collection
      await collection.add(userModel.toMap());
      // Stop the loading progress
      ProgressHud.shared.stopLoading();
      // Show a success snackbar with the message "Registration Successful"
      CommonViews().showSnackBar("Success", "Registration Successful");
      // Navigate to the login screen and remove all existing routes from the stack
      FIP5Navigator.of(Get.context!).pushAndRemoveUntil(LoginScreen());
    } catch (error) {
      // Handle any errors that occur during the registration process
      if (error is FirebaseException) {
        // If the error is a Firebase exception, show a snackbar with the corresponding error message
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      }
    }
  }

// Function to save image to Firebase Storage
  Future<String> saveImageToStorage(File imgFile) async {
    try {
      // Get a reference to the Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref();
      // Generate a unique file name for the image using timestamp and random number
      String fileName =
          "fip5_${DateTime.now().millisecondsSinceEpoch}${Random().nextInt(1000)}";
      // Create a reference to the image file in the storage
      Reference imageRef = storageReference.child("images/$fileName.jpg");
      // Upload the image file to Firebase Storage
      await imageRef.putFile(imgFile);
      // Return the download URL of the uploaded image
      return imageRef.getDownloadURL();
    } catch (error) {
      // Handle errors, if any, during the upload process
      if (error is FirebaseException) {
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      }
      return "";
    }
  }
}
