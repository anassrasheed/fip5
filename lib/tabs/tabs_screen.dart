import 'package:fip5/generated/l10n.dart';
import 'package:fip5/tabs/about_us_tab.dart';
import 'package:flutter/material.dart';

import 'contact_us_tab.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).tabsExample),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(S.of(context).home), // 0
              ),
              Tab(
                child: Text(S.of(context).aboutUs), // 1
              ),
              Tab(
                child: Text(S.of(context).contactUs), // 2
              ), // 2),
            ],
            controller: controller,
            enableFeedback: false,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.yellow,
            indicatorSize: TabBarIndicatorSize.tab,
            // indicator: BoxDecoration(
            //     gradient: LinearGradient(
            //         colors: [Colors.white, Colors.white, Colors.white]),
            //     borderRadius: BorderRadius.circular(50)),
            padding: EdgeInsets.all(0),
            isScrollable: false,
            indicatorWeight: 5,
            indicatorPadding: EdgeInsets.all(5),
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            getCustomWidget(Colors.red, S.of(context).home),
            AboutUsTab(),
            ContactUsTab(),
            // state management  Getx Bloc Rirverpod  provider statesrebuilder mobx widget state management    MVC  Clear Arc  MVC,MVP,MVVM
          ],
        ));
  }

  Widget getCustomWidget(Color color, String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: color,
      child: Center(child: Text(title)),
    );
  }
}
// radio buttons Done
// checkbox Done
// localization   translation     Translation   GetX  mobx   Internationalozation
