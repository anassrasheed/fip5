// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/resources/stringes_manager.dart';
import 'package:fip5/screens/authintication/login/login_screen.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/helpers/fip5_navigator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isChecked = false;
  GlobalKey formkey = GlobalKey();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  FocusNode _usernamefocusnode = FocusNode();
  FocusNode _emailfocusnode = FocusNode();
  FocusNode _passwordfocusnode = FocusNode();
  bool _obscureText =
      false; // Initialize it to true to hide the password by default

  File? _selectedImage; // Store the selected image
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      backgroundColor:
          Color(0xFFF8F8F8), // Use the 0x prefix to specify a hexadecimal color
      appBar: AppBar(
        backgroundColor: Color(
            0xFFF8F8F8), // Use the 0x prefix to specify a hexadecimal color
        elevation: 0,
      ),

      body: SizedBox(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        child: Text(AppString.fit),
                      ),
                      FipText(
                        title: AppString.kit,
                        fontWeight: FontWeight.bold,
                        fontSize: 36.sp,
                        TextColor: AppColors.buttonColor,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _showImagePickerBottomSheet();
                    },
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: _selectedImage != null
                          ? Image(image: FileImage(_selectedImage!)).image
                          : AssetImage('assets/defult_profile.png'),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  FipText(
                    title: AppLocalizations.of(context)!.creatyouraccount,
                    fontWeight: FontWeight.w500,
                    TextColor: AppColors.disbaleIndicator,
                    fontSize: 24.sp,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CommonViews().textFormField(
                      Controller: _usernamecontroller,
                      FocusNode: _usernamefocusnode,
                      Hinttext: AppLocalizations.of(context)!.username,
                      suffixicon: Icon(Icons.person)),
                  SizedBox(
                    height: 20,
                  ),
                  CommonViews().textFormField(
                      Controller: _emailcontroller,
                      FocusNode: _emailfocusnode,
                      Hinttext: AppLocalizations.of(context)!.emailid,
                      keyboardtype: TextInputType.emailAddress,
                      suffixicon: Icon(Icons.email)),
                  SizedBox(
                    height: 20,
                  ),
                  CommonViews().textFormField(
                    Controller: _passwordcontroller,
                    FocusNode: _passwordfocusnode,
                    Hinttext: AppLocalizations.of(context)!.password,
                    suffixicon: IconButton(
                      //. If _obscureText is false, it shows the "visibility" icon (an eye), indicating that the password is visible.
                      onPressed: () {
                        setState(() {
                          _obscureText =
                              !_obscureText; // Toggle the obscureText value
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color:
                            Colors.grey, // Customize the icon color as needed
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (newValue) {
                          setState(() {
                            isChecked = newValue ?? false;
                          });
                        },
                      ),
                      FipText(
                        title:AppLocalizations.of(context)!.ireadandagree,
                        fontWeight: FontWeight.w500,
                        TextColor: AppColors.disbaleIndicator,
                        fontSize: 14.sp,
                      ),
                      TextButton(
                        onPressed: () {
                          // Add your Terms & Conditions link here
                        },
                        child: FipText(
                          title: AppLocalizations.of(context)!.tearmandconditions,
                          fontWeight: FontWeight.w500,
                          TextColor: AppColors.disbaleIndicator,
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add your Sign Up logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFC12323),
                      minimumSize: Size(380, 54),
                    ),
                    child: FipText(
                      title: AppLocalizations.of(context)!.signup,
                      fontWeight: FontWeight.w600,
                      TextColor: AppColors.textcolor,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: FipText(
                      title:AppLocalizations.of(context)!.or,
                      fontWeight: FontWeight.w500,
                      TextColor: AppColors.buttonColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
                                color: Colors.white,
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
                                color: AppColors.facebook),
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FipText(
                            title: AppLocalizations.of(context)!.alreadyhaveanaccount,
                            fontWeight: FontWeight.w500,
                            TextColor: AppColors.buttonColor,
                            fontSize: 14.sp,
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigate to the Login screen here
                              FIP5Navigator.of(context)
                                  .pushAndRemoveUntil(LoginScreen());
                            },
                            child: FipText(
                              title: AppLocalizations.of(context)!.login,
                              fontWeight: FontWeight.w500,
                              TextColor: AppColors.buttonColor,
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
      ),
    );
  }

  Future<void> _showImagePickerBottomSheet() async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: FipText(
                title: AppLocalizations.of(context)!.takeaphoto,
                fontWeight: FontWeight.w500,
                TextColor: AppColors.buttonColor,
                fontSize: 14.sp,
              ),
              // Text('Take a Photo'),
              onTap: () async {
                final picker = ImagePicker();
                final pickedImage =
                    await picker.pickImage(source: ImageSource.camera);

                if (pickedImage != null) {
                  setState(() {
                    _selectedImage = File(pickedImage.path);
                  });
                }
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: FipText(
                title: AppLocalizations.of(context)!.choosefromgallery,
                fontWeight: FontWeight.w500,
                TextColor: AppColors.buttonColor,
                fontSize: 14.sp,
              ),
             // Text('Choose from Gallery'),
              onTap: () async {
                final picker = ImagePicker();
                final pickedImage =
                    await picker.pickImage(source: ImageSource.gallery);

                if (pickedImage != null) {
                  setState(() {
                    _selectedImage = File(pickedImage.path);
                  });
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
