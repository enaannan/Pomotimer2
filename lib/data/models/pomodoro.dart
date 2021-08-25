//TODO:fix this
//  List<_Pomodoro> _pomodoros = []; // contains tasks defined by the user
// int _totalPomodoros; // total number of pomodoros a user has added

//promdoro class model
import 'package:flutter/cupertino.dart';

class Pomodoro {
  late String _pomodoroName;
  late bool _isActive;
  late int _targetSession;
  late int _currentSession;

  Pomodoro(
      {required pomodoroName,
      required isActive,
      required targetSession,
      required currentSession}) {
    this._currentSession = currentSession;
    this._isActive = isActive;
    this._targetSession = targetSession;
    this._pomodoroName = pomodoroName;
  }

  String get pomodoroName => _pomodoroName;

  int get targetSession => _targetSession;

  bool get isActive => _isActive;

  int get currentSession => _currentSession;
}

//   List<_Pomodoro> get pomodoros => _pomodoros;

//     List<_Pomodoro> temp = [];

// /* loop through pomodoro list,create pomodoro instances
// based on data from network call and push all into a list called _pomodoro
// */
//     for (var i = 0; i < parsedJson['pomodoros'].length; i++) {
//       _Pomodoro _pomodoro = _Pomodoro(parsedJson['pomodoros'][i]);
//       temp.add(_pomodoro);
//     }

//     _pomodoros = temp;
//   }
