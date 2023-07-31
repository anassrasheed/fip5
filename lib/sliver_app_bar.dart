import 'package:flutter/material.dart';

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({Key? key}) : super(key: key);

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text("Anas"),
            expandedHeight: 300,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                width: 50,
                height: 50,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              )
            ],
            backgroundColor: Colors.red,
            shape: Border.all(width: 4, color: Colors.grey),
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              "assets/normal_logo.jpg",
              fit: BoxFit.fill,
            )),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      ListTile(title: Text("item $index Hello , sorry")),
                  childCount: 30))
        ],
      ),
    );
  }
}
