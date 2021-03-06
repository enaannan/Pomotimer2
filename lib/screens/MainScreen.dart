import 'package:flutter/material.dart';

import 'NewTaskScreen.dart';
import 'ProfileScreen.dart';
import 'StatisticsScreen.dart';
import 'TimeScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: [
            TimeScreen(),
            NewTaskScreen(),
            StatisticsScreen(),
            ProfileScreen(),
            SafeArea(
                child: AppBar(
              title: Text("rere"),
            ))
          ],
        ),
        bottomNavigationBar: TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blue,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(icon: Icon(Icons.alarm)),
              Tab(icon: Icon(Icons.slideshow)),
              Tab(icon: Icon(Icons.bar_chart)),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.settings)),
            ]),
      ),
    );
  }
}
