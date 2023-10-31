import 'package:fip5/screens/register/user_model.dart';

import '../screens/login/login_response.dart';

class CurrentSession {
  static final CurrentSession _shared = CurrentSession._private();

  factory CurrentSession() => _shared;

  CurrentSession._private();

  UserModel? user;
  ApiUser? myUser;

}
