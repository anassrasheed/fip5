import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ListView Example"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green, // mainAxisSize.min
        child: ListView(
            children: [
              Text("Anas"),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
              _buildItem(context),
            ],
            padding: EdgeInsets.all(4),
            shrinkWrap: true,scrollDirection: Axis.horizontal,
            reverse: false,
            physics: ClampingScrollPhysics()),
      ),
    ));
  }

  Container _buildItem(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset("assets/normal_logo.jpg")),
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "\$ 26.25",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Brow Woman Bag",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Jackets",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _counter++;
                });
              },
              child: Icon(
                Icons.add,
                color: Colors.grey.shade600,
                size: 23,
              ),
            ),
            Container(
              width: 33,
              height: 33,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green),
              child: Center(
                  child: Text(
                "$_counter",
                style: const TextStyle(color: Colors.white),
              )),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (_counter > 0) _counter--;
                });
              },
              child: Icon(
                Icons.remove,
                color: Colors.grey.shade600,
                size: 23,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
