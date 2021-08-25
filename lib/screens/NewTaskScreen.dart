import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomotimer2/widgets/BlueCard.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBar(),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Web design practice"),
                      Icon(Icons.rate_review)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Project settings"),
              ),
            ),
            Expanded(
              child: SettingsCard(
                child: ListView(
                  children: [
                    ListTile(
                      children: [
                        Text("Short break"),
                        Row(
                          children: [
                            Text("5 min"),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    ListTile(
                      children: [
                        Text("Long break"),
                        Row(
                          children: [
                            Text("25 min"),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        )
                      ],
                    ),
                    Divider(),
                    ListTile(
                      children: [
                        Text("Working sessions"),
                        Row(
                          children: [
                            Text("6 times"),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        )
                      ],
                    ),
                    Divider(),
                    ListTile(
                      children: [
                        Text("Automatic breaks"),
                        Switch(
                          value: true,
                          onChanged: (bool value) {
                            print('toggled!!!!');
                          },
                        )
                      ],
                    ),
                    Divider(),
                    ListTile(
                      children: [
                        Text("Sound"),
                        Switch(
                            value: true,
                            onChanged: (bool value) {
                              print('toggled!!!!');
                            }),
                      ],
                    )
                  ],
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
                    print("Project created");
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(milliseconds: 500),
                        content: Text("Project created"),
                      ),
                    );
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

class ListTile extends StatelessWidget {
  const ListTile({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ));
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey[200]!,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, -1))
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          child: child),
    );
  }
}
