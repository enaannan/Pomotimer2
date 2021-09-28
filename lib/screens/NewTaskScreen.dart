import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomotimer2/widgets/BlueCard.dart';
import 'package:flutter/foundation.dart';
import 'package:pomotimer2/widgets/SettingsUI.dart';

import 'PomodoroSettingsScreen.dart';
import 'TimeScreen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key,}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              title: Text("Add a new Pomodoro"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> PomodroSettingsScreen()));
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey[200]!,
                      spreadRadius: 0.01,
                      blurRadius: 10,
                      offset: Offset(0, 10))
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text("Create new Task",
                      //TODO:fix all font families used in the app to load locally
                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Project name"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey[200]!, offset: Offset(0, 1))
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Pomodoro name here"
                      ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Description"
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                child: BlueCard(
                  textName: "Create new project",
                  action: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 500),
                        content: Text("Project created"),
                      ),
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> TimeScreen()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



