// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 414,
                height: 271,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xb7000000), Colors.black],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.play_circle_fill,
                  size: 64, // Adjust the size of the play button as needed
                  color: Colors.white, // Play button color
                ),
                onPressed: () {
                  // Add your video play functionality here
                },
              ),
              Positioned(
                top: 16,
                left: 16,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white, // Back arrow button color
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Handle navigation back here
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Week Mass - Building Trainer",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Workout Schedule",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 183,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffc12323),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Adjust the alignment as needed
                    children: [
                      Text("Step 1",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF))),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Warm Up",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF))),
                      SizedBox(
                        height: 5,
                      ),
                      Text("15 Mins",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF)))
                    ],
                  ),
                ),
               
                Container(
                  width: 183,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff222222),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Adjust the alignment as needed
                    children: [
                      Text("Step 2",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF))),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Basics Pushups",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF))),
                      SizedBox(
                        height: 5,
                      ),
                      Text("20 Mins",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF)))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
