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

class TwoOptionsDialog extends StatefulWidget {
   final String dialogTitle;
   final String radioListOneTitle;
   final String radioListTwoTitle;
   final tileOneValue;
   final tileTwoValue;
   final Function (Object) callback;

  TwoOptionsDialog({
    required this.dialogTitle,
    required this.radioListOneTitle,
    required this.radioListTwoTitle,
    required this.tileOneValue,
    required this.tileTwoValue,
    required this.callback
  });

   @override
  _TwoOptionsDialogState createState() => _TwoOptionsDialogState(
     dialogTitle: dialogTitle,
     radioListOneTitle: radioListOneTitle,
     radioListTwoTitle: radioListTwoTitle,
     tileOneValue: tileOneValue,
     tileTwoValue: tileTwoValue,
     callback: callback
  );
}

class _TwoOptionsDialogState extends State<TwoOptionsDialog> {
  var _selectedValue;

  final String dialogTitle;
  final String radioListOneTitle;
  final String radioListTwoTitle;
  final tileOneValue;
  final tileTwoValue;
  final Function (Object) callback;

_TwoOptionsDialogState({
  required this.dialogTitle,
  required this.radioListOneTitle,
  required this.radioListTwoTitle,
  required this.tileOneValue,
  required this.tileTwoValue,
  required this.callback
});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(dialogTitle),
      actions: [
        RadioListTile<Object>(
            title: Text(radioListOneTitle),
            value: tileOneValue,
            groupValue: _selectedValue,
            onChanged: (value){
        setState((){
        _selectedValue = value;
        widget.callback(value!);
        });
        }),
        RadioListTile<Object>(
            title: Text(radioListTwoTitle),
            value: tileTwoValue,
            groupValue: _selectedValue,
            onChanged: (value){
        setState((){
        _selectedValue = value;
          widget.callback(value!);

        });
        })
      ],
    );
  }
}
//todo refactor options dialog so it can be reused

