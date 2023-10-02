import 'dart:io';

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/config/app_constants.dart';
import 'package:fip5/screens/register/register_controller.dart';
import 'package:fip5/screens/register/user_model.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _mobileFocus = FocusNode();
  XFile? xFile;
  bool _isPasswordObscure = true;
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CommonViews().getAppBar(title: "Register"),
      bottomSheet: Container(
        height: 40,
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 10),
        child: Center(
            child: CommonViews().createButton(
                title: "Register",
                onPressed: () async {

                  File file=File(xFile!.path);
                  UserModel model = UserModel(
                    email: _emailController.text,
                    password: _passwordController.text,
                    imgUrl: "",
                    mobile: _mobileController.text,
                  );
                  model.file=file;
                  controller.registerWithEmailAndPassword(model);
                })),
      ),
      body: Form(
        key: controller.key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                _getProfileImageView(),
                const SizedBox(
                  height: AppConstants.textFieldSpacing,
                ),
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
                // CommonViews().createTextFormField(
                //     controller: _passwordController,
                //     focusNode: _passwordFocus,
                //     label: "Password",
                //     validator: (v) {
                //       if (v != null && v.isEmpty) {
                //         return "The field is required";
                //       } else if (v != null && v.length < 6) {
                //         return "Password must be strong";
                //       } else {
                //         return null;
                //       }
                //     },
                //     isObscure: _isPasswordObscure,
                //     suffixIcon: InkWell(
                //         child: Icon(
                //             _isPasswordObscure
                //                 ? Icons.visibility_outlined
                //                 : Icons.visibility_off_outlined,
                //             color: Colors.brown),
                //         onTap: () {
                //           setState(() {
                //             _isPasswordObscure = !_isPasswordObscure;
                //           });
                //         }),
                //     onSubmitted: (v) {
                //       _mobileFocus.requestFocus();
                //     },
                //     inputAction: TextInputAction.next),
                const SizedBox(
                  height: AppConstants.textFieldSpacing,
                ),
                CommonViews().createTextFormField(
                    controller: _mobileController,
                    focusNode: _mobileFocus,
                    label: "Mobile Number",
                    prefixText: "+962",
                    hint: " 79000000",
                    keyboardType: TextInputType.phone),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getProfileImageView() {
    return InkWell(
      onTap: () async {
        ImagePicker picker = ImagePicker();
        xFile = await picker.pickImage(source: ImageSource.camera); // permission
        setState(() {});
      },
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: Center(
            child: xFile == null
                ? const Icon(Icons.photo)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                      File(xFile!.path),
                      fit: BoxFit.fill,
                    ),
                  )),
      ),
    );
  }
}
