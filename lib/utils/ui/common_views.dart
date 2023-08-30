import 'package:flutter/material.dart';

class CommonViews {
  static final CommonViews _shared = CommonViews._private();

  factory CommonViews() => _shared;

  CommonViews._private();

  // singleton Ready

  AppBar getAppBar({required String title, Color? color}) {
    return AppBar(
        backgroundColor: color ?? Colors.white,
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        title: Text(title, style: TextStyle(color: Colors.black)),
        centerTitle: true);
  }
}
