import 'dart:io';

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/config/app_constants.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  FocusNode _userNameFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _mobileFocus = FocusNode();
  XFile? file;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool _isPasswordObscure = true;

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
            child:
                CommonViews().createButton(title: "Confirm", onPressed: () {})),
      ),
      body: Form(
        key: key,
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
                CommonViews().createTextFormField(
                    controller: _userNameController,
                    focusNode: _userNameFocus,
                    label: "Username",
                    onSubmitted: (v) {
                      setState(() {

                      });
                      _passwordFocus.requestFocus();
                    },
                    inputAction: TextInputAction.next),
                const SizedBox(
                  height: AppConstants.textFieldSpacing,
                ),
                CommonViews().createTextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    label: "Password",
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
        file = await picker.pickImage(source: ImageSource.camera); // permission
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
            child: file == null
                ? const Icon(Icons.photo)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.file(
                      File(file!.path),
                      fit: BoxFit.fill,
                    ),
                  )),
      ),
    );
  }
}
