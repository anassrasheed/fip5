import 'package:flutter/material.dart';

class ExpandedExampleScreen extends StatelessWidget {
  const ExpandedExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: buildWrap(context),
    ));
  }

  Center buildCenter() {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          Container(
            color: Colors.brown,
            width: 60,
            height: 50,
          ),
          Container(
            color: Colors.red,
            width: 60,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 60,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 60,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 60,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 60,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 60,
            height: 50,
          ),
          Container(
            color: Colors.blue,
            width: 60,
            height: 50,
          ),
          Container(
            color: Colors.black,
            width: 60,
            height: 50,
          ),
          // Expanded(
          //   flex: 2,
          //   child: Container(
          //     color: Colors.deepOrangeAccent,
          //     height: 50,
          //   ),
          // ),
          // Expanded(
          //   flex: 4,
          //   child: Container(
          //     color: Colors.deepPurple,
          //     height: 50,
          //   ),
          // )
          // Spacer(),
          // Container(
          //   color: Colors.black,
          //   width: 60,
          //   height: 50,
          // ),
        ]),
      ),
    );
  }

  // listView

  Widget buildWrap(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Wrap( // chips
        direction: Axis.horizontal, // row
        // row column
        alignment: WrapAlignment.center,  // mainAxisAlignmrnt
        crossAxisAlignment: WrapCrossAlignment.center, // crossAxisAlignmrnt
        runAlignment: WrapAlignment.center, // animation
        spacing: 10,
        children: [
          Container(
            color: Colors.red,
            width: 40,
            height: 200,
          ),
          Container(
            color: Colors.blue,
            width: 40,
            height: 200,
          ),
          Container(
            color: Colors.green,
            width: 40,
            height: 200,
          ),
        ],
      ),
    );
  }

  Widget buildColumn(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(), // Always Never Bonucing
      child: Column(children: [
        Container(
          color: Colors.blueGrey,
          width: MediaQuery.of(context).size.width,
          height: 200,
        ),
        Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: 200,
        ), // 50%
        Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: 200,
        ), // 50%
        Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: 200,
        ), // 50%
        Container(
          color: Colors.white10,
          width: MediaQuery.of(context).size.width,
          height: 200,
        ), // 50%
        Container(
          color: Colors.green,
          width: MediaQuery.of(context).size.width,
          height: 200,
        ), // 50%
        Transform.rotate(
          //todo learn who to use transform.translate and transform.scale.
          //todo get a picture to use boxFit attribute     location
          angle: 90,
          child: Container(
            color: Colors.yellow,
            width: MediaQuery.of(context).size.width / 2,
            height: 200,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Icon(
          Icons.add,
          size: 40,
        ),
        const SizedBox(
          width: 300,
          height: 200,
          child: Card(
            color: Colors.green,
          ),
        )
        // 50%
        // Expanded(
        //   // 50%/3
        //   flex: 2, // 2/6
        //   child: Container(
        //     color: Colors.blue,
        //     width: MediaQuery.of(context).size.width,
        //   ),
        // ),
        // Expanded(
        //   // 50%/3
        //   flex: 3, // 3/6
        //   child: Container(
        //     color: Colors.green,
        //     width: MediaQuery.of(context).size.width,
        //   ),
        // ),
        // Expanded(
        //   // 50%/3
        //   flex: 1, // 1/6
        //   child: Container(
        //     color: Colors.brown,
        //     width: MediaQuery.of(context).size.width,
        //   ),
        // )
        // Spacer(), // available space
        // Container(
        //   color: Colors.yellow,
        //   width: MediaQuery.of(context).size.width,
        //   height: 20,
        // ),
        // Container(
        //   color: Colors.deepOrange,
        //   width: MediaQuery.of(context).size.width,
        //   height: 20,
        // ),
      ]),
    );
  }
}
