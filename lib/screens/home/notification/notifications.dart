// ignore_for_file: prefer_const_constructors

import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Sample list of notifications
  final List<String> notifications = [
    'You have a new message.',
    'You have a new friend request.',
    'Today is a special day!',
    'Don\'t forget to complete your tasks.',
    'Your post received 100 likes.',
    'Event reminder: Meeting at 3 PM.',
    'New product available in the store.',
  ];

  final List<String> avatarUrls = [
    'assets/images/fitman.webp',
    'assets/images/fitman.webp',
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
      appBar: CommonViews().getAppBar(title: "Notofications"),
      body: isLoading
          ? _buildShimmerListView()
          : _buildNotificationListView(),
    );
  }

  Widget _buildShimmerListView() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: Duration(seconds: 2),
      child: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrls[index]), // Replace with your avatar URLs
            ),
            title: Text('Loading...'), // Placeholder text
          );
        },
      ),
    );
  }

  Widget _buildNotificationListView() {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(avatarUrls[index]), // Replace with your avatar URLs
          ),
          title: Text(notifications[index]), // Notification message
          onTap: () {
            // Handle tapping on a notification, e.g., navigate to a specific page
            // You can add your logic here
          },
        );
      },
    );
  }
}
