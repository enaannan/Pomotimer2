import 'package:pomotimer2/data/models/pomodoro.dart';

class User {
  late String _firstName; // holds firstname of user
  late String _otherNames; //holds other names of user
  late String _email; //holds email of user
  late List<Pomodoro> _pomodoros = []; // holds a list of pomodoros

  User.fromJson(Map<String, dynamic> parsedJson) {
    // print(parsedJson);
    _firstName = parsedJson['other_Names'];
    _otherNames = parsedJson['last_Name'];
    _email = parsedJson['email'];

    for (var i = 0; i < parsedJson['pomodoros'].length; i++) {
      _pomodoros.add(Pomodoro(
          pomodoroName: parsedJson['pomodoros'][i]['name'],
          isActive: parsedJson['pomodoros'][i]['isActive'],
          currentSession: parsedJson['pomodoros'][i]['currentSession'],
          targetSession: parsedJson['pomodoros'][i]['targetSession']));
    }
  }

  String get firstName => _firstName;

  String get otherNames => _otherNames;

  String get email => _email;

  List<Pomodoro> get pomodoros => _pomodoros;
}
