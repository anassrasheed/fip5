// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fip5/screens/home/home_ui.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  String selectedGoal = ''; // To track the selected fitness goal

  // Function to handle fitness goal selection
  void selectFitnessGoal(String goal) {
    setState(() {
      selectedGoal = goal;
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
              Text("Let us know how  we can help you",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 35,
              ),

              // Fitness goal radio buttons
              Container(
                width: 384,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    color: Color(0xfff3f3f3)),
                child: ListTile(
                  title: const Text('Weight Loss'),
                  leading: Radio<String>(
                    value: 'Weight Loss',
                    groupValue: selectedGoal,
                    onChanged: (String? value) {
                      selectFitnessGoal(value!);
                    },
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),
              Container(
                width: 384,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    color: Color(0xfff3f3f3)),
                child: ListTile(
                  title: const Text('Better Sleeping Habit'),
                  leading: Radio<String>(
                    value: 'Better Sleeping Habit',
                    groupValue: selectedGoal,
                    onChanged: (String? value) {
                      selectFitnessGoal(value!);
                    },
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),
              Container(
                width: 384,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    color: Color(0xfff3f3f3)),
                child: ListTile(
                  title: const Text('Track My Nutrition'),
                  leading: Radio<String>(
                    value: 'Track My Nutrition',
                    groupValue: selectedGoal,
                    onChanged: (String? value) {
                      selectFitnessGoal(value!);
                    },
                  ),
                ),
              ),
               SizedBox(
                height: 10,
              ),
              Container(
                width: 384,
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                    color: Color(0xfff3f3f3)),
                child: ListTile(
                  title: const Text('Improve Overall Fitness'),
                  leading: Radio<String>(
               
                    value: 'Improve Overall Fitness',
                    groupValue: selectedGoal,
                    onChanged: (String? value) {
                      selectFitnessGoal(value!);
                    },
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
                              builder: (context) => HomeUI(),
                            ),
                          );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC12323),
                  minimumSize: Size(380, 54),
                ),
                child: Text("Get Stared",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(height: 10),

              SizedBox(height: 20), // Adjust the spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}