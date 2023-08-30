import 'package:fip5/old/builders/griv_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../tabs/tabs_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int index = 0;

  List<TabModel> _tabs = [
    TabModel(title: "Home", view: GridViewExample()),
    TabModel(title: "My Account", view: TabScreen()),
    TabModel(title: "Settings", view: Container()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _persistantTabbar(),
      // column (header   divider    payment information   car information)
    );
  }

  Widget _persistantTabbar() {
    return PersistentTabView(
      context,
      screens: _tabs.map((e) => e.view).toList(),
      navBarHeight: 100,
      confineInSafeArea: true,
      navBarStyle: NavBarStyle.style16,
      items: [
        PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            title: "Home",
            activeColorPrimary: index == 0 ? Colors.red : Colors.blue),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.person),
            title: "My Account",
            activeColorPrimary: index == 1 ? Colors.red : Colors.blue),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.settings),
            title: "Settings",
            activeColorPrimary: index == 2 ? Colors.red : Colors.blue),
      ],
      popActionScreens: PopActionScreensType.all,
      popAllScreensOnTapOfSelectedTab: true,
      // optional
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      onItemSelected: (value) {
        index = value;
        if (mounted) setState(() {});
      },
      // onWillPop: (v) async {
      //   return true;
      // },
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
    );
  }
}

class TabModel {
  String title;
  Widget view;
  Widget? icon;

  TabModel({required this.title, required this.view, this.icon});
}
