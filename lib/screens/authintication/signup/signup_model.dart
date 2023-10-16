

import 'dart:io';

class UserModel {
  String email;// Email of the user
  String? password;// Password of the user (optional)
  String mobile;// Mobile number of the user
  String imgUrl;  // URL to the user's image
  String? uid; // User ID (optional)
  File? file;// User's profile image file (optional)
  String? UserName;// User's username (optional)


  UserModel(
      {required this.email,
      this.password,
      required this.mobile,
      required this.imgUrl,
      required this.UserName,
      this.uid});
 // Convert UserModel object to a map for database storage
  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "email": email,
      "mobile": mobile,
      "imgUrl": imgUrl,
      "username":UserName,
      "uid": uid
    };
    return result;
  }
 // Create a UserModel object from a map retrieved from the database
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map["email"],
        mobile: map["mobile"],
        imgUrl: map["imgUrl"],
        uid: map["uid"],
         UserName:map['username'] );
  }
}
