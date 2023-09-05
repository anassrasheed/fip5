import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<String> messages = [
    'Hello there!',
    'How are you?',
    'What are you up to?',
    'See you later!',
    'Good morning!',
  ];

  final List<String> avatarUrls = [
    'assets/images/fitman.webp',
    'assets/images/fitman.webp',
    'assets/images/fitman.webp',
    'assets/images/fitman.webp',
    'assets/images/fitman.webp',
  ];

  bool isLoading = true; // Initially, set to true to show shimmer

  @override
  void initState() {
    super.initState();

    // Simulate data loading after a delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // Set to false to stop shimmer
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC12323),
        title: Center(
          child: Text(
            "Messages",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add your back button functionality here
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search button functionality here
            },
          ),
        ],
      ),
      body: isLoading
          ? _buildShimmerListView()
          : _buildMessageListView(),
    );
  }

  Widget _buildShimmerListView() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: Duration(seconds: 2),
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(avatarUrls[index]),
            ),
            title: Text('Loading...'), // Placeholder text
          );
        },
      ),
    );
  }

  Widget _buildMessageListView() {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatarUrls[index]),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green, // Change color as needed for online status
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          title: Text(messages[index]),
          onTap: () {
            // Handle tapping on a message, e.g., navigate to a chat screen
            // You can add your logic here
          },
        );
      },
    );
  }
}
