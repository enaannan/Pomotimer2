import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AlarmNames{ginger, caramel}
enum BreakLength{short, long}
enum WorkingSessions{two, four}

class PomodroSettingsScreen extends StatefulWidget {
  @override
  _PomodroSettingsScreenState createState() => _PomodroSettingsScreenState();
}

class _PomodroSettingsScreenState extends State<PomodroSettingsScreen> {
  BreakLength? _breakLengthSelectedValue = BreakLength.short;
  WorkingSessions? _workingSessionsSelectedValue = WorkingSessions.two;
  AlarmNames? _alarmNamesSelectedValue = AlarmNames.ginger;
  bool _automaticBreaks = false;

  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Project settings")),
          body: Container(
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
                child: ListView(
                  children: [
                    ListTile(
                        title: Text("Break length"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(describeEnum(_breakLengthSelectedValue!)),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("Break length title"),
                                  actions: [
                                    RadioListTile<BreakLength>(
                                        title: Text(describeEnum(BreakLength.short)),
                                        value: BreakLength.short,
                                        groupValue: _breakLengthSelectedValue,
                                        onChanged: (BreakLength? value){
                                          print(value);
                                    setState((){
                                    _breakLengthSelectedValue = value;
                                    });
                                    }),
                                    RadioListTile<BreakLength>(
                                        title: Text( describeEnum(BreakLength.long)),
                                        value: BreakLength.long,
                                        groupValue: _breakLengthSelectedValue,
                                        onChanged: (BreakLength? value){
                                    print(value);
                                          setState((){
                                    _breakLengthSelectedValue = value!;

                                    });
                                    })
                                  ],
                                );
                              });
                        }),
                    Divider(),
                    ListTile(
                        title: Text("Working sessions"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(describeEnum(_workingSessionsSelectedValue!)),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                        onTap: (){
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                                title: Text("Working sessions title"),
                                actions: [
                            RadioListTile<WorkingSessions>(
                            title: Text(describeEnum(WorkingSessions.two)),
                            value: WorkingSessions.two,
                            groupValue: _workingSessionsSelectedValue,
                            onChanged: (WorkingSessions? value){
                            setState((){
                            _workingSessionsSelectedValue = value;
                            });
                            }),
                            RadioListTile<WorkingSessions?>(
                            title: Text(describeEnum(WorkingSessions.four)),
                            value: WorkingSessions.four,
                            groupValue: _workingSessionsSelectedValue,
                            onChanged: (WorkingSessions? value){
                            setState((){
                            _workingSessionsSelectedValue = value;
                            });
                            })
                            ],
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
                            Text(describeEnum(_alarmNamesSelectedValue!)),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("Sound"),
                                  actions: [
                                    RadioListTile<AlarmNames>(
                                        title: Text(describeEnum(AlarmNames.ginger)),
                                        value: AlarmNames.ginger,
                                        groupValue: _alarmNamesSelectedValue,
                                        onChanged: (AlarmNames? value){
                                    setState((){
                                    _alarmNamesSelectedValue = value;
                                    });
                                    }),
                                    RadioListTile<AlarmNames>(
                                        title: Text(describeEnum(AlarmNames.caramel)),
                                        value: AlarmNames.caramel,
                                        groupValue: _alarmNamesSelectedValue,
                                        onChanged: (value){
                                          setState((){
                                            _alarmNamesSelectedValue = value;
                                          });
                                        })
                                  ],
                                );// comment sound was kept to two options for simplicity
                              });
                        }),
                  ],
                ),),
          )
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