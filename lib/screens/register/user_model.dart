import 'dart:io';

class UserModel {
  String email;
  String? password;
  String mobile;
  String imgUrl;
  String? uid;
  File? file;

  UserModel(
      {required this.email,
      this.password,
      required this.mobile,
      required this.imgUrl,
      this.uid});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {
      "email": email,
      "mobile": mobile,
      "imgUrl": imgUrl,
      "uid": uid
    };
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map["email"],
        mobile: map["mobile"],
        imgUrl: map["imgUrl"],
        uid: map["uid"]);
  }
}
