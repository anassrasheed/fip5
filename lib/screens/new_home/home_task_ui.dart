import 'package:fip5/screens/new_home/home_task.dart';
import 'package:fip5/screens/new_home/profile_task.dart';
import 'package:fip5/screens/new_home/sitting_task.dart';
import 'package:flutter/material.dart';

class HomeTaskUi extends StatefulWidget {
  const HomeTaskUi({super.key});

  @override
  State<HomeTaskUi> createState() => _HomeTaskUiState();
}

class _HomeTaskUiState extends State<HomeTaskUi> {
  int currentTab = 0;
  final List<Widget> screens = [
    const HomeTask(),
    const SettingTask(),
        const ProfileTask(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFC12323),
        unselectedItemColor: const Color(0xFF777777),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Sitting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
          
        ],
      ),
    );
  }
}