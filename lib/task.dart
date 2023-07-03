import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return SafeArea(
      child: Scaffold(
          body:
              //   Center(
              // child:
              // Container(
              //     color: Colors.red,
              //     width: double.infinity,
              //     height: MediaQuery.of(context).size.height / 4, // 200  411
              //     child: Row(
              //       children: [
              //         Text("Hello"),
              //         Text("Hello"),
              //         Text("Hello"),
              //         Text("Hello"),
              //       ],
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //     )
              // Column(
              //   children: [
              //     Text("Hello"),
              //     Text("Hello"),
              //     Text("Hello"),
              //     // Row(
              //     //   children: [
              //     //     Text("Hellosdfsdfsdfds"),
              //     //   ],
              //     // ),
              //     Text(
              //       "Hello",
              //       style: TextStyle(backgroundColor: Colors.green),
              //     ),
              //   ],
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              // ),

              Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.accessibility),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.accessibility),
                  Icon(Icons.accessibility),
                ],
              ),
              Icon(Icons.add),
            ],
          )
        ]),
      )
          //     Center(
          //         child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [Icon(Icons.add), Icon(Icons.add), Icon(Icons.add)],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [Icon(Icons.add), Icon(Icons.add), Icon(Icons.add)],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [Icon(Icons.add), Icon(Icons.add), Icon(Icons.add)],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [Icon(Icons.add), Icon(Icons.add), Icon(Icons.add)],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [Icon(Icons.add), Icon(Icons.add), Icon(Icons.add)],
          //     ),
          //   ],
          // )),
          ),
    );
  }
}
