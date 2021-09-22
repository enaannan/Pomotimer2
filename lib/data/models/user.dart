import 'pomodoro.dart';

class User {
  String? _lastName;
  String? _otherNames;
  List<Pomodoro>? _pomodoros;

  String? get lastName => _lastName;
  String? get otherNames => _otherNames;
  List<Pomodoro>? get pomodoros => _pomodoros;

   addPomodoro(Pomodoro pomodoro){
    this._pomodoros!.add(pomodoro);
  }

  User({
      String? lastName, 
      String? otherNames, 
      List<Pomodoro>? pomodoros}){
    _lastName = lastName;
    _otherNames = otherNames;
    _pomodoros = pomodoros;
}

  User.fromJson(dynamic json) {
    _lastName = json['last_Name'];
    _otherNames = json['other_Names'];
    if (json['pomodoros'] != null) {
      _pomodoros = [];
      json['pomodoros'].forEach((v) {
        _pomodoros?.add(Pomodoro.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['last_Name'] = _lastName;
    map['other_Names'] = _otherNames;
    if (_pomodoros != null) {
      map['pomodoros'] = _pomodoros?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

