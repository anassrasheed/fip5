import 'package:fip5/screens/register/user_model.dart';

class CurrentSession {
  static final CurrentSession _shared = CurrentSession._private();

  factory CurrentSession() => _shared;

  CurrentSession._private();

  UserModel? user;

}
