import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
        var obscureText =  false; // Initialize it to true to hide the password by default

   void passwordVisibility() {

    obscureText = !obscureText;
    update();
  }

  
}