import 'package:fip5/screens/language/lannguage_model.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {

  var selectlanguage = LanguageModel(
    LanguageCode: 'en', 
    languageName: 'English'
    ).obs;

    void setlanguage (LanguageModel language){
      selectlanguage.value =language;
    }
  
}


