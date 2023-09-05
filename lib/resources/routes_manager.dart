
import 'package:fip5/resources/stringes_manager.dart';
import 'package:fip5/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';


class Routes {
// the main route
  static const String splashRoute ='/';
  static const String loginRoute ='/login';
  static const String registerRoute ='/register';
  static const String mainRoute ='/main';
  static const String forgetpasswordRoute ='/forgetpassword';
  static const String onboardingRoute ='/onboarding';
  static const String storDetailsRoute ='/ storDetails';

  
}

class RouteGenerator {
// static function
  static Route <dynamic> getRoute(RouteSettings settings){

 switch (settings.name) {
   case Routes.splashRoute:
     return MaterialPageRoute(builder: (_)=> const SplashView());

    //  case Routes.loginRoute:
    //  initLoginModule();
    //  return MaterialPageRoute(builder: (_)=> const LoginView());

    //  case Routes.onboardingRoute:
    //  return MaterialPageRoute(builder: (_)=> const OnBoardingView());

    //  case Routes.registerRoute:
    //  return MaterialPageRoute(builder: (_)=>const Registerview());

    //  case Routes.mainRoute:
    //  return MaterialPageRoute(builder: (_)=> const MainView());

    //  case Routes.storDetailsRoute:
    //  return MaterialPageRoute(builder: (_)=>const StoreDetailsView());

    //  case Routes.forgetpasswordRoute:
    //  return MaterialPageRoute(builder: (_)=>const ForgetPasswordView());
     default :
     return unDefinedRoute();
      
      
     
 }
 
  }
  static  Route <dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=> Scaffold(
      appBar: AppBar(title:const Text(AppString.noRouteFound),
      ),
      body: const Center(child: Text(AppString.noRouteFound),),
    ));
  }
}