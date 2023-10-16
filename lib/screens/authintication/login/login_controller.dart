// // ignore_for_file: prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fip5/config/firbase_exption/firebase_error_messages.dart';
// import 'package:fip5/screens/authintication/signup/signup_model.dart';
// import 'package:fip5/screens/gender/gender_screen.dart';
// import 'package:fip5/utils/helpers/fip5_navigator.dart';
// import 'package:fip5/utils/ui/common_views.dart';
// import 'package:fip5/utils/ui/loading.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginController extends GetxController {
//         var obscureText =  false; // Initialize it to true to hide the password by default
//           final FirebaseAuth _auth = FirebaseAuth.instance;


//    void passwordVisibility() {

//     obscureText = !obscureText;
//     update();
//   }

//   // Reactive variables for handling email and password errors
//   RxString emailError = ''.obs;
//   RxString passwordError = ''.obs;
//   GlobalKey<FormState> key = GlobalKey<FormState>();
// // Function to handle login process
//   void login(String email, String password) async {
//     try {
//       // Validate input and proceed with login if valid
//       if (isValid(email, password)) {
//         ProgressHud.shared.startLoading(Get.context);
// // Sign in with provided email and password
//         UserCredential response = await _auth.signInWithEmailAndPassword(
//             email: email, password: password);
//         if (response.user != null) {
//           // Get user data from Firestore
//           UserModel? model = await _getDataFromFirestore(response.user!.uid);
//           ProgressHud.shared.stopLoading();
//           if (model != null) {
//             CommonViews().showSnackBar("Success", "Login Successful");
//             FIP5Navigator.of(Get.context!)
//                         .pushAndRemoveUntil(GenderScreen());
//           } else {
//             CommonViews().showSnackBar("Failed", "Login Failed");
//           }
//         }
//       }
//     } catch (error) {
//        // Handle errors during login
//       ProgressHud.shared.stopLoading();
//       if (error is FirebaseException) {
//         print(error.code);
//         CommonViews()
//             .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
//       } else {
//         CommonViews().showSnackBar("Failed", error.toString());
//       }
//     }
//   }
// // Function to validate email and password
//   bool isValid(String email, String password) {
//     emailError.value = '';
//     passwordError.value = '';
//     if (email.isEmpty) {
//       emailError.value = "Email is Required";
//       return false;
//     } else if (password.isEmpty) {
//       passwordError.value = "Password is Required";
//       return false;
//     } else if (password.length < 6) {
//       passwordError.value = "please enter Strong password";
//       return false;
//     }
//     return true;
//   }
//  // Function to get user data from Firestore
//   Future<UserModel?> _getDataFromFirestore(String uid) async {
//     try {
//         // Access the "users" collection in Firestore
//       var collection = FirebaseFirestore.instance.collection("users");
//        // Query Firestore to find a document where the UID matches
//       var result = await collection.where("uid", isEqualTo: uid).get();
//        // Check if the result has any documents
//       if (result.docs.isNotEmpty) {
//          // Parse the data into a UserModel instance
//         UserModel model = UserModel.fromMap(result.docs.first.data());
//         return model;// Return the UserModel instance
//       }
//       // Return null if no matching document was found
//       return null;
//     } catch (e) {
//       // Handle any exceptions and return null in case of an error
//       return null;
//     }
//   }

  
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fip5/config/curunt_session.dart';
import 'package:fip5/config/firbase_exption/firebase_error_messages.dart';
import 'package:fip5/screens/authintication/signup/signup_model.dart';
import 'package:fip5/screens/new_home/home_task_ui.dart';

import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
    var obscureText =  false; // Initialize it to true to hide the password by default

  RxString emailError = RxString('');

  //RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  GlobalKey<FormState> key = GlobalKey<FormState>();
     void passwordVisibility() {

    obscureText = !obscureText;
    update();
  }

  void login(String email, String password) async {
    try {
      // Check if the email and password are valid
      if (isValid(email, password)) {
         // Start loading progress using shared ProgressHud
        ProgressHud.shared.startLoading(Get.context);
// Attempt to sign in with the provided email and password
        UserCredential response = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
            // Check if the sign-in was successful
        if (response.user != null) {
          // Get user data from Firestore based on the user's UID
          UserModel? model = await _getDataFromFirestore(response.user!.uid);
           // Stop loading progress
          ProgressHud.shared.stopLoading();
           // Check if user data was retrieved
          if (model != null) {
            // Set the current user and show a success snackbar
            CurrentSession().user=model;
            CommonViews().showSnackBar("Success", "Login Successful");
             // Navigate to the HomeTaskUi screen
            FIP5Navigator.of(Get.context!).pushAndRemoveUntil(HomeTaskUi());
            // save user
          } else {
            // Show a failure snackbar if user data retrieval failed
            CommonViews().showSnackBar("Failed", "Login Failed");
          }
        }
      }
    } catch (error) {
       // Handle any errors that occur during the login process
      ProgressHud.shared.stopLoading();
      if (error is FirebaseException) {
         // If the error is a Firebase exception, show a snackbar with the corresponding error message
        print(error.code);
        CommonViews()
            .showSnackBar("Failed", FirebaseErrors.getMessage(error.code));
      } else {
        // If it's not a Firebase exception, show a snackbar with the error message
        CommonViews().showSnackBar("Failed", error.toString());
      }
    }
  }

  bool isValid(String email, String password) {
    // Clear any previous error messages
    emailError.value = '';
    passwordError.value = '';
      // Check if the email is empty
    if (email.isEmpty) {
      emailError.value = "Email is Required";
      return false;
       // Check if the password is empty
    } else if (password.isEmpty) {
      passwordError.value = "Password is Required";
      return false;
    }
    return true;
  }

  Future<UserModel?> _getDataFromFirestore(String uid) async {
    try {
       // Access the "users" collection in Firestore
      var collection = FirebaseFirestore.instance.collection("users");
       // Query the collection to find documents where "uid" is equal to the provided UID
      var result = await collection.where("uid", isEqualTo: uid).get();
       // Check if the query result contains any documents
      if (result.docs.isNotEmpty) {
         // If documents are found, create a UserModel object from the data of the first document
        UserModel model = UserModel.fromMap(result.docs.first.data());
        return model;// Return the UserModel object
      }
      return null;// Return null if no documents were found
    } catch (e) {
      return null;// Return null in case of any errors
    }
  }
}