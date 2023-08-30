import 'package:fip5/utils/ui/common_views.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "Intro Screen",color: Colors.red),
    );
  }
}
