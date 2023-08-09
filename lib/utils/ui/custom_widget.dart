import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final Color color;
  final String title;

  const CustomWidget({Key? key, required this.color, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: color,
      child: Center(child: Text(title)),
    );
  }
}