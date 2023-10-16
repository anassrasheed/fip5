// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, use_build_context_synchronously, unnecessary_cast, prefer_final_fields

import 'dart:io';

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/screens/authintication/login/login_screen.dart';
import 'package:fip5/screens/authintication/signup/signup_controller.dart';
import 'package:fip5/screens/authintication/signup/signup_model.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;
  File? pickedImage;
  GlobalKey formkey = GlobalKey();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  final FocusNode _usernamefocusnode = FocusNode();
  final FocusNode _emailfocusnode = FocusNode();
  final FocusNode _passwordfocusnode = FocusNode();
  final FocusNode _mobileFocus = FocusNode();
  bool _isPasswordObscure = true;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RegisterController signupcontroller = Get.put(RegisterController());
  XFile? xFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: CommonViews().getAppBar(title: "Register"),
      
      body: Form(
        key: signupcontroller.key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(child: _getProfileImageView())),
                const SizedBox(
                  height: 20,
                ),
                
                Obx(
                  () => CommonViews().createTextFormField(
                    controller: _emailcontroller,
                    focusNode: _emailfocusnode,
                    label: "Email",
                    errorText: signupcontroller.emailError.value.isEmpty
                        ? null
                        : signupcontroller.emailError.value,
                    onSubmitted: (v) {
                      String trimmedEmail =
                          _emailcontroller.text.trim().toLowerCase(); // Trim the email
                      // Update the email controller with the trimmed email8/975583
                      _emailcontroller.text = trimmedEmail;
                      setState(() {});
                      _passwordfocusnode.requestFocus();
                    },
                    inputAction: TextInputAction.next,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => CommonViews().createTextFormField(
                      controller: _usernamecontroller,
                      focusNode: _usernamefocusnode,
                      label: "user name",
                      errorText: signupcontroller.emailError.value.isEmpty
                          ? null
                          : signupcontroller.emailError.value,
                      onSubmitted: (v) {
                        setState(() {});
                        _passwordfocusnode.requestFocus();
                      },
                      inputAction: TextInputAction.next),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => CommonViews().createTextFormField(
                      controller: _passwordcontroller,
                      focusNode: _passwordfocusnode,
                      label: "Password",
                      errorText: signupcontroller.emailError.value.isEmpty
                          ? null
                          : signupcontroller.emailError.value,
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

                const SizedBox(
                  height: 20,
                ),
                CommonViews().createTextFormField(
                    controller: _mobileController,
                    focusNode: _mobileFocus,
                    label: "Mobile Number",
                    prefixText: "+962",
                    hint: " 79000000",
                    keyboardType: TextInputType.phone),
                SizedBox(height: 10),
                SizedBox(height: 5.h),
                CommonViews().createButton(
                    title: AppLocalizations.of(context)!.signup,
                   
                    onPressed: () async {
                      if (xFile != null) {
                        File file = File(xFile!.path);
                        UserModel model = UserModel(
                          email: _emailcontroller.text.toLowerCase(),
                          password: _passwordcontroller.text.trim(),
                          imgUrl: "",
                          mobile: _mobileController.text.trim(),
                          UserName: _usernamecontroller.text.trim(),
                        );
                        model.file = file;
                        signupcontroller.registerWithEmailAndPassword(model);
                      } else {
                        CommonViews().showSnackBar(
                            "feaild", "Chose your profile image please");
                        print("xFile is null");
                      }
                    }),
                Center(
                  child: FipText(
                    title: AppLocalizations.of(context)!.or,
                    fontWeight: FontWeight.w500,
                    TextColor: Colors.red,
                    fontSize: 18.sp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 15.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.twitter,
                          ),
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.twitter,
                              color: AppColors.textcolor,
                            ),
                            onPressed: () {
                              // Handle Twitter button press here
                            },
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          width: 15.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.facebook,
                          ),
                          child: IconButton(
                            icon: Icon(
                              FontAwesomeIcons.facebook,
                              color: AppColors.textcolor,
                            ),
                            onPressed: () {
                              // Handle Facebook button press here
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FipText(
                          title: AppLocalizations.of(context)!
                              .alreadyhaveanaccount,
                          fontWeight: FontWeight.w500,
                          TextColor: Colors.red,
                          fontSize: 14.sp,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: FipText(
                            title: AppLocalizations.of(context)!.login,
                            fontWeight: FontWeight.w500,
                            TextColor: Colors.blue,
                            fontSize: 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  

  
  Widget _getProfileImageView() {
  return InkWell(
    onTap: () {
      _showImagePickerBottomSheet(context);
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
            ? const Icon(Icons.photo)// Show default icon if no image selected
            : ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.file(
                  File(xFile!.path),
                  fit: BoxFit.fill,
                ),
              ),
      ),
    ),
  );
}
  // Function to display a bottom sheet with image source options (camera, gallery)

void _showImagePickerBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Take a Photo'),
            onTap: () async {
              Navigator.pop(context);
              await _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Choose from Gallery'),
            onTap: () async {
              Navigator.pop(context);
              await _pickImage(ImageSource.gallery);
            },
          ),
        ],
      );
    },
  );
}
Future<void> _pickImage(ImageSource source) async {
  ImagePicker picker = ImagePicker();
  XFile? file = await picker.pickImage(source: source);
  if (file != null) {
    setState(() {
      xFile = file;
    });
  }}
}
