// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fip5/screens/authintication/signup/signup_screen.dart';
import 'package:fip5/screens/gender/gender_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

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
              Text("Welcome!",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  )),
              Text("Sign into Your Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 35,
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email Id*',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true, // For password input
                decoration: InputDecoration(
                  hintText: 'Password*',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
              Text("Forgot Password?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),

              SizedBox(
                height: 10,
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    // Add your Sign Up logic here
                    Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GenderScreen(),
                              ),
                            );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC12323),
                    minimumSize: Size(380, 54),
                  ),
                  child: Text("Login",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ))),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff00a4f9),
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
                      SizedBox(width: 8),
                      Container(
                        width: 100,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff00a4f9),
                        ),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account? ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                      TextButton(
                          onPressed: () {
                            // Navigate to the Login screen here
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Text("Signup",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              )))
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
