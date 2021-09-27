import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pomotimer2/widgets/SettingsUI.dart';
import 'package:flutter/services.dart';

import 'NewTaskScreen.dart';

class PomodroSetingsScreen extends StatefulWidget {
  @override
  _PomodroSetingsScreenState createState() => _PomodroSetingsScreenState();
}

class _PomodroSetingsScreenState extends State<PomodroSetingsScreen> {
  var _selectedValue = BreakLength.short;
  bool _automaticBreaks = false;

  updateSelectedValue (var currentValue){
    setState(() {
      _selectedValue = currentValue;
    });
  }
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
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
                              Text(describeEnum(_selectedValue)),
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
                                    callback: updateSelectedValue,
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
                                callback: updateSelectedValue,
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
                                    callback: updateSelectedValue,
                                  ); // comment sound was kept to two options for simplicity
                                });
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }}



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