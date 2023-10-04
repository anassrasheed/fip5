import 'package:fip5/config/app_constants.dart';
import 'package:fip5/screens/login/login_controller.dart';
import 'package:fip5/screens/register/register_screen.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _mobileFocus = FocusNode();
  bool _isPasswordObscure = true;
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    _emailController.text="shoroq@gmail.com";
    _passwordController.text="123456789";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "Login"),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Obx(
            () => CommonViews().createTextFormField(
                controller: _emailController,
                focusNode: _emailFocus,
                label: "Email",
                errorText: controller.emailError.value.isEmpty
                    ? null
                    : controller.emailError.value,
                onSubmitted: (v) {
                  setState(() {});
                  _passwordFocus.requestFocus();
                },
                inputAction: TextInputAction.next),
          ),
          const SizedBox(
            height: AppConstants.textFieldSpacing,
          ),
          Obx(
            () => CommonViews().createTextFormField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                label: "Password",
                errorText: controller.emailError.value.isEmpty
                    ? null
                    : controller.emailError.value,
                isObscure: _isPasswordObscure,
                suffixIcon: InkWell(
                    child: Icon(
                        _isPasswordObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.brown),
                    onTap: () {
                      setState(() {
                        _isPasswordObscure = !_isPasswordObscure;
                      });
                    }),
                onSubmitted: (v) {
                  _mobileFocus.requestFocus();
                },
                inputAction: TextInputAction.next),
          ),
          CommonViews().createButton(
              title: "Login",
              onPressed: () {
                controller.login(_emailController.text, _passwordController.text);
              }),
          CommonViews().createButton(
              title: "Register",
              onPressed: () {
                FIP5Navigator.of(context).push(RegisterScreen());
              }),
        ]),
      ),
    );
  }
}
