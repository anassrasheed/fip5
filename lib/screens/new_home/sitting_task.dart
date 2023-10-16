// ignore_for_file: prefer_const_constructors

import 'package:fip5/config/app_colors.dart';
import 'package:fip5/screens/new_home/profile_task.dart';
import 'package:fip5/utils/helpers/fip5_navigator.dart';
import 'package:fip5/utils/ui/common_views.dart';
import 'package:fip5/utils/ui/fip5_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingTask extends StatefulWidget {
  const SettingTask({super.key});

  @override
  State<SettingTask> createState() => _SettingTaskState();
}

class _SettingTaskState extends State<SettingTask> {
   
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: CommonViews().getAppBar(title: FipText(title: "Setting", fontWeight: FontWeight.w500).title),
    body: Padding(
      padding: EdgeInsets.only(bottom: 20.0), // Adjust the value as needed
      child: SizedBox(height: 30,),  // Your existing body content
    ),
    bottomSheet: buildBottomSheet(),
  );
  }

  Widget buildBottomSheet() {
    return Container(
     height: double.infinity,
     width: double.infinity,
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
            border: Border.all(color: AppColors.buttonColor, width: 2.0), // Border color is red

      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
       CommonViews().   buildListTile('My Profile', Icons.person, () {
            // Handle My Profile

           FIP5Navigator.of(Get.context!).pushAndRemoveUntil(ProfileTask());
          }),
         CommonViews().  buildListTile('Change My Password', Icons.lock, () {
            // Handle Change My Password
           
          }),
         CommonViews().  buildListTile('Terms and Conditions', Icons.info, () {
            // Handle Terms and Conditions
           
          }),
        CommonViews().   buildListTile('About Us', Icons.info, () {
            // Handle About Us
          
          }),
         CommonViews().  buildListTile('Privacy Policy', Icons.privacy_tip, () {
            // Handle Privacy Policy
        
          }),
        ],
      ),
    );
  }
 
}

