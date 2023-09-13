import 'package:fip5/screens/register/register_screen.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "Login"),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CommonViews().createButton(title: "Register", onPressed: () {
            FIP5Navigator.of(context).push(RegisterScreen());
          }),
        ]),
      ),
    );
  }
}
