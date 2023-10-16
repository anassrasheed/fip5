// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fip5/config/app_colors.dart';
import 'package:fip5/screens/authintication/login/login_screen.dart';
import 'package:fip5/screens/authintication/signup/signup_controller.dart';
import 'package:fip5/screens/new_home/home_task_ui.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ProfileTask extends StatefulWidget {
  const ProfileTask({super.key});

  @override
  State<ProfileTask> createState() => _ProfileTaskState();
}

class _ProfileTaskState extends State<ProfileTask> {
  RegisterController signupcontroller = Get.put(RegisterController());

  XFile? xFile;
  File? pickedImage;
  final TextEditingController _usernamecontroller = TextEditingController();
  final FocusNode _usernamefocusnode = FocusNode();
    final FocusNode _passwordfocusnode = FocusNode();
      final FocusNode _mobileFocus = FocusNode();
        final TextEditingController _mobileController = TextEditingController();




  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 255, 255, 255),),
        ),
        backgroundColor: AppColors.buttonColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeTaskUi(),
                ));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.delete_forever_sharp,
              color: Colors.white,
            ),
            onPressed: () async {
              var uId = FirebaseAuth.instance.currentUser!.uid;
              await FirebaseFirestore.instance
                  .collection('user')
                  .doc(uId)
                  .delete();
              await FirebaseAuth.instance.signOut();
              await FIP5Navigator.of(context).pushAndRemoveUntil(LoginScreen());
              debugPrint('77 $uId');
              setState(() {});
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _getProfileImageView();
                        },
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 4,
                                color: Colors.white,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: NetworkImage(''))),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Obx(
                  () => CommonViews().createTextFormField(
                      controller: _usernamecontroller,
                      focusNode: _usernamefocusnode,
                      label: AppLocalizations.of(context)!.username,
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
                CommonViews().createTextFormField(
                    controller: _mobileController,
                    focusNode: _mobileFocus,
                    label: "Mobile Number",
                    prefixText: "+962",
                    hint: " 79000000",
                    keyboardType: TextInputType.phone),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonColor,
                          ),
                          onPressed: () async {
                            // Call a function to update the user's information
                            await _updateUserProfile();
                          },
                          child: Text(AppLocalizations.of(context)!.save),
                        ),
                      ),
                    ],
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
            ? const Icon(Icons.photo)
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
void _showImagePickerBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.camera),
            title:  FipText(title: "Take A Photo", fontWeight: FontWeight.w500),
            onTap: () async {
              Navigator.pop(context);
              await _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: FipText(title: "Choose From Galllery", fontWeight: FontWeight.w500),
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

  Future<void> _updateUserProfile() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String? imageUrl;
        if (pickedImage != null) {
          imageUrl = await signupcontroller.saveImageToStorage(pickedImage!);
        }

        await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .update({
          'userName': _usernamecontroller.text,
          'imgUrl': imageUrl,
        });

        CommonViews().showSnackBar('Success', 'Profile Updated Successfully');
      }
    } catch (e) {
      CommonViews().showSnackBar('Error', 'Failed to update profile: $e');
    }
  }
}
