// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:fip5/screens/help/help_screen.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String selectedGender = ''; // To track the selected gender

  // Function to handle gender selection
  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFFF8F8F8), // Use the 0x prefix to specify a hexadecimal color
      appBar: AppBar(
        backgroundColor: Color(
            0xFFF8F8F8), // Use the 0x prefix to specify a hexadecimal color
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    child: Text('Fit'),
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Kit',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC12323),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Gender",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              // image buttons
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    color: Colors.white),
                child: InkWell(
                  onTap: () {
                    selectGender('Male'); // Handle the selection here
                  },
                  child: Image.asset(
                    'assets/images/male 1.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                 width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    color: Colors.white),
                child: InkWell(
                  onTap: () {
                    selectGender('Female'); // Handle the selection here
                  },
                  child: Image.asset(
                    'assets/images/female 1.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HelpScreen(),
                            ),
                          );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC12323),
                  minimumSize: Size(380, 54),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "To give you a better experience, we need to know your Gender",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Adjust the spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}