import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Define a list of follower avatar URLs or paths
  List<String> followerAvatarPaths = [
    'assets/avatar3.png', // Replace with actual paths or URLs
    'assets/avatar4.png',
    'assets/avatar5.png',
    // Add more avatar paths or URLs here
  ];

  List<Widget> workoutCards = [
    buildWorkoutCard("Abs", "Perfection"),
    buildWorkoutCard("Good", "Cardio"),
    buildWorkoutCard("Arms", "Stretching"),
    // Add more workout cards here
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Container(
        width: 421,
        height: 281,
        decoration: BoxDecoration(
          color: Color(0xffc12323),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Arrow Back Icon Button in the Top Left
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Add your back button functionality here
                },
              ),
            ),
            // Circular Avatar in the Center
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/fitman.webp'),
                ),
                Text("User Name",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
                Row(
                  children: [
                    Text("5k Followers",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                    VerticalDivider(
                      width: 10, // Adjust the width as needed
                      color: Colors.white, // Adjust the color as needed
                    ),
                    Text("2k Following",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ],
                ),
              ],
            ),
            // Search Icon Button in the Bottom Right
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Add your search functionality here
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("My Exercises",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: workoutCards,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Followers",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                )),
            // Horizontal Scrollable List of Circular Avatars for Followers
            SizedBox(
              height: 80, // Set the desired height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: followerAvatarPaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0), // Add horizontal spacing
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(followerAvatarPaths[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
