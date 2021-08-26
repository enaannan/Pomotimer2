import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomotimer2/bloc/UsersInfoBloc.dart';
import 'package:pomotimer2/data/models/user.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'ListScreen.dart';
import 'NewTaskScreen.dart';

class TimeScreen extends StatefulWidget {
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  @override
  void initState() {
    super.initState();
    bloc.fetchUserInfoFromBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            children: [
            AppBar(
            elevation: 0.0,
            centerTitle: true,
            actions: [
        Padding(
        padding: const EdgeInsets.all(10.0),
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => {
            Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => NewTaskScreen()),
        ),
        }),)
    ],
    leading: IconButton(icon: Icon(Icons.list_rounded),
    onPressed:()=>Navigator.of(context).push(
      MaterialPageRoute(
        builder:(context)=>ListScreen()
        )
    ),
    ),
    title:Text("PomoTimer"),
    ),
//          StreamBuilder(
//              stream: bloc.allUsers,
//              builder: (context, AsyncSnapshot<User> snapshot) {
//                if (snapshot.hasData) {
//                  DisplayPomoTimer();
//                } else if (snapshot.hasError) {
//                  //display error
//                }
//                return Center(child: CircularProgressIndicator());
//              }),
    ],
    ),
    );
  }
}

class DisplayPomoTimer extends StatelessWidget {
  const DisplayPomoTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              "Current Task",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              "Place Task name here",
              style: GoogleFonts.ptSans(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Text("Stay focused for " + "timed" + " mins"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {},
                shape: CircleBorder(),
                child: Icon(
                  Icons.replay,
                  color: Colors.grey,
                ),
                fillColor: Colors.white,
              ),
              Container(
                width: 50.0,
                height: 100.0,
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.pause,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white,
                ),
              ),
              RawMaterialButton(
                shape: CircleBorder(),
                onPressed: () {},
                child: Icon(
                  Icons.stop,
                  color: Colors.grey,
                ),
                fillColor: Colors.white,
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: CircularStepProgressIndicator(
                totalSteps: 100,
                stepSize: 2,
                selectedColor: Colors.red,
                unselectedColor: Colors.grey[200],
                unselectedStepSize: 15,
                currentStep: 10,
                selectedStepSize: 15,
                roundedCap: (_, __) => true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "12:58",
                      style: TextStyle(
                          fontSize: 70.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2 out of 4 sessions",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
