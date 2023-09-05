// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  
  List<Widget> workoutCards = [
    buildWorkoutCard("Abs", "Perfection"),
    buildWorkoutCard("Good", "Cardio"),
    buildWorkoutCard("Arms", "Stretching"),
    // Add more workout cards here
  ];

  List<Map<String, String>> trainingPlans = [
    {
      'title': 'Shoulder Press',
      'description': 'Walking is simple, yet powerful exercise for your body',
      'image': 'assets/images/gym 1.png',
    },
    {
      'title': 'Jogging',
      'description': 'Walking is simple, yet powerful exercise for your body',
      'image': 'assets/images/gym 1.png',
    },
    {
      'title': 'Jogging',
      'description': 'Walking is simple, yet powerful exercise for your body',
      'image': 'assets/images/gym 1.png',
    },
    {
      'title': 'Jogging',
      'description': 'Walking is simple, yet powerful exercise for your body',
      'image': 'assets/images/gym 1.png',
    },
    // Add more training plans here
   
    
  ];

  static Widget buildWorkoutCard(String title1, String title2) {
    return Stack(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: 130,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x00000000), Colors.black],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFC12323), // Ellipse color
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color(0xFFC12323), // Background color of the button
                    padding: EdgeInsets.all(
                        0), // Remove padding to make the button fill the circle
                    shape: CircleBorder(), // Make the button circular
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white, // Button icon color
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  title2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTrainingPlanCard(
  String title, String description, String imagePath) {
  return SizedBox(
    width: 182,
    height: 200,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color.fromARGB(255, 225, 222, 222),
              width: 1.0,
            ),
            color: Color(0xfff3f3f3),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      imagePath,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF777777),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC12323),
        title: Center(
          child: Text(
            "Home",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Add your menu button functionality here
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add your search button functionality here
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Workout Exercises",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: workoutCards,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Training Plan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Use ListView.builder to create a list of training plans
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: (trainingPlans.length / 2).ceil(),
            itemBuilder: (context, index) {
              final startIndex = index * 2;
              final endIndex = startIndex + 2;
              final visibleTrainingPlans = trainingPlans.sublist(
                startIndex,
                endIndex > trainingPlans.length ? trainingPlans.length : endIndex,
              );

              return Row(
                children: visibleTrainingPlans.map((plan) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildTrainingPlanCard(
                        plan['title']!,
                        plan['description']!,
                        plan['image']!,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
    
  }
}