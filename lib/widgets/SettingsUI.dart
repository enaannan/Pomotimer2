import 'package:flutter/material.dart';

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

enum BreakLength{short, long}

class OptionsDialog extends StatefulWidget {

  @override
  _OptionsDialogState createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {
  BreakLength? _breakLength = BreakLength.short;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("This is the title"),
      actions: [
        RadioListTile<BreakLength>(
            title: Text("long break"),
            value: BreakLength.long,
            groupValue: _breakLength,
            onChanged: (BreakLength? value){
        setState((){
        _breakLength = value;
        });
        }),
        RadioListTile<BreakLength>(
            title: Text("short break"),
            value: BreakLength.short,
            groupValue: _breakLength,
            onChanged: (BreakLength? value){
        setState((){
        _breakLength = value;
        });
        })
      ],
    );
  }
}


//todo refactor options dialoge so it can be reused