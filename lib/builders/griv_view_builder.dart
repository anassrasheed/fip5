import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
  const GridViewExample({Key? key}) : super(key: key);

  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  List<CardItem> _cities = [];

  @override
  void initState() {
    _fillPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Grid view"), centerTitle: true),
        body: Center(child: _buildGridView()),
      ),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: Card(
            elevation: 4,
            shadowColor: _cities[index].shadowColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_cities[index].cityName),
                Text(_cities[index].cityDesc),
                Text(_cities[index].cityCountry),
              ],
            )),
          ),
        );
      },
      itemCount: _cities.length,
    );
  }

  void _fillPlaces() {
    _cities = [
      CardItem(
          cityName: "Amman",
          cityDesc: "Amman is the capital of jordan",
          cityCountry: "Jordan",
          shadowColor: Colors.brown),
      CardItem(
          cityName: "Paris",
          cityDesc: "Amman is the capital of France",
          cityCountry: "France",
          shadowColor: Colors.red),
      CardItem(
          cityName: "Madrid",
          cityDesc: "Amman is the capital of Spain",
          cityCountry: "Spain",
          shadowColor: Colors.yellow),
      CardItem(
          cityName: "Paris",
          cityDesc: "Amman is the capital of France",
          cityCountry: "France",
          shadowColor: Colors.red),
      CardItem(
          cityName: "Madrid",
          cityDesc: "Amman is the capital of Spain",
          cityCountry: "Spain",
          shadowColor: Colors.yellow),
      CardItem(
          cityName: "Amman",
          cityDesc: "Amman is the capital of jordan",
          cityCountry: "Jordan",
          shadowColor: Colors.brown),
      CardItem(
          cityName: "Madrid",
          cityDesc: "Amman is the capital of Spain",
          cityCountry: "Spain",
          shadowColor: Colors.yellow),
      CardItem(
          cityName: "Paris",
          cityDesc: "Amman is the capital of France",
          cityCountry: "France",
          shadowColor: Colors.red),
      CardItem(
          cityName: "Amman",
          cityDesc: "Amman is the capital of jordan",
          cityCountry: "Jordan",
          shadowColor: Colors.brown),
      CardItem(
          cityName: "Amman",
          cityDesc: "Amman is the capital of jordan",
          cityCountry: "Jordan",
          shadowColor: Colors.brown),
      CardItem(
          cityName: "Madrid",
          cityDesc: "Amman is the capital of Spain",
          cityCountry: "Spain",
          shadowColor: Colors.yellow),
      CardItem(
          cityName: "Paris",
          cityDesc: "Amman is the capital of France",
          cityCountry: "France",
          shadowColor: Colors.red),
      CardItem(
          cityName: "Amman",
          cityDesc: "Amman is the capital of jordan",
          cityCountry: "Jordan",
          shadowColor: Colors.brown),
      CardItem(
          cityName: "Amman",
          cityDesc: "Amman is the capital of jordan",
          cityCountry: "Jordan",
          shadowColor: Colors.brown),
      CardItem(
          cityName: "Madrid",
          cityDesc: "Amman is the capital of Spain",
          cityCountry: "Spain",
          shadowColor: Colors.yellow),
      CardItem(
          cityName: "Paris",
          cityDesc: "Amman is the capital of France",
          cityCountry: "France",
          shadowColor: Colors.red),
      CardItem(
          cityName: "Amman",
          cityDesc: "Amman is the capital of jordan",
          cityCountry: "Jordan",
          shadowColor: Colors.brown),
    ];
  }
}

class CardItem {
  String cityName;
  String cityDesc;
  String cityCountry;
  Color shadowColor;

  CardItem(
      {required this.cityName,
      required this.cityDesc,
      required this.cityCountry,
      required this.shadowColor});
}
