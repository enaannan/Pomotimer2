class User {
  String? _lastName;
  String? _otherNames;
  List<Pomodoros>? _pomodoros;

  String? get lastName => _lastName;
  String? get otherNames => _otherNames;
  List<Pomodoros>? get pomodoros => _pomodoros;

  User({
      String? lastName, 
      String? otherNames, 
      List<Pomodoros>? pomodoros}){
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
        _pomodoros?.add(Pomodoros.fromJson(v));
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

class Pomodoros {
  String? _name;
  bool? _isActive;
  int? _targetSession;
  int? _currentSession;

  String? get name => _name;
  bool? get isActive => _isActive;
  int? get targetSession => _targetSession;
  int? get currentSession => _currentSession;

  Pomodoros({
      String? name, 
      bool? isActive, 
      int? targetSession, 
      int? currentSession}){
    _name = name;
    _isActive = isActive;
    _targetSession = targetSession;
    _currentSession = currentSession;
}

  Pomodoros.fromJson(dynamic json) {
    _name = json['name'];
    _isActive = json['isActive'];
    _targetSession = json['targetSession'];
    _currentSession = json['currentSession'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['isActive'] = _isActive;
    map['targetSession'] = _targetSession;
    map['currentSession'] = _currentSession;
    return map;
  }

}