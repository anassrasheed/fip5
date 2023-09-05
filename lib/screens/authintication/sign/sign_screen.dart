// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fip5/screens/authintication/login/login_screen.dart';
import 'package:fip5/screens/authintication/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/images/fitman.webp", // Replace with your image asset path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // First Text Element
          Center(
            child: Row(
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
          ),
          // Second Text Element
          Positioned(
            top: 100, // Adjust the position as needed
            left: 20, // Adjust the position as needed
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting ",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Sign Up Button
          Positioned(
            bottom: 20, // Adjust the position as needed
            left: 20, // Adjust the position as needed
            right: 20, // Adjust the position as needed
            child: ElevatedButton(
              onPressed: () {
                // Add your Sign Up logic here
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFC12323),
                minimumSize: Size(380, 54),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          // Log In With Account Text Button
          Positioned(
            bottom: 60, // Adjust the position as needed
            left: 20, // Adjust the position as needed
            child: TextButton(
              onPressed: () {
                // Add your Log In logic here
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Text(
                "Log In With Account",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
