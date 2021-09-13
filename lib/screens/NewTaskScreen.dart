import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomotimer2/widgets/BlueCard.dart';
import 'package:flutter/foundation.dart';
import 'package:pomotimer2/widgets/SettingsUI.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key,}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

enum AlarmNames{ginger , caramel}
enum BreakLength{short, long}
enum WorkingSessions{two, four}

class _NewTaskScreenState extends State<NewTaskScreen> {
bool _automaticBreaks = false;
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
                padding: const EdgeInsets.all(8.0),
                child: Text("Project settings"),
              ),
            ),
            Expanded(
              child: SettingsCard(
                child: ListView(
                  children: [
                  ListTile(
                    title: Text("Break length"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(describeEnum(BreakLength.short)),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  onTap: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return TwoOptionsDialog(
                                dialogTitle:"Break length title",
                                radioListOneTitle: describeEnum(BreakLength.short),
                                radioListTwoTitle: describeEnum(BreakLength.long),
                              tileOneValue: BreakLength.short,
                              tileTwoValue: BreakLength.long,
                            );
                          });
                    }),
                  Divider(),
                    ListTile(
                        title: Text("Working sessions"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(describeEnum(WorkingSessions.two)),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                        onTap: (){
                         showDialog(context: context, builder: (BuildContext context){
                           return TwoOptionsDialog(
                               dialogTitle: "Working sessions title",
                               radioListOneTitle: describeEnum(WorkingSessions.two),
                               radioListTwoTitle: describeEnum(WorkingSessions.four),
                             tileOneValue: WorkingSessions.two,
                             tileTwoValue: WorkingSessions.four,
                           );
                         });
                        }),
                  Divider(),
                  SwitchListTile(
                      title: Text("Automatic breaks"),
                      value: _automaticBreaks,
                      onChanged: (bool value){
                            setState((){
                            _automaticBreaks = value;
                            });
                      }),
                  Divider(),
                  ListTile(
                      title: Text("Sound"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(describeEnum(AlarmNames.ginger)),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return TwoOptionsDialog(
                                dialogTitle: "Sound Title",
                                  radioListOneTitle: describeEnum(AlarmNames.caramel),
                                  radioListTwoTitle: describeEnum(AlarmNames.ginger),
                                tileOneValue: AlarmNames.caramel,
                                tileTwoValue: AlarmNames.ginger,
                              ); // comment sound was kept to two options for simplicity
                            });
                      }),
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
