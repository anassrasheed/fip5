import 'package:fip5/screens/authintication/signup/signup_model.dart';

class CurrentSession {
  // Sengelton design pattern
  static final CurrentSession _share =CurrentSession._private();
  factory CurrentSession() => _share;
  CurrentSession._private();
    UserModel? user;
  
}