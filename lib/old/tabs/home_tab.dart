import 'package:flutter/material.dart';

import '../utils/ui/custom_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return const CustomWidget(color: Colors.red, title: "Home Screen");
  }
}
