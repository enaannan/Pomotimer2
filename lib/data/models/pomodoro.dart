class Pomodoro {
  String? _name;
  bool? _isActive;
  int? _targetSession;
  int? _currentSession;

  String? get name => _name;
  bool? get isActive => _isActive;
  int? get targetSession => _targetSession;
  int? get currentSession => _currentSession;

  Pomodoro({
    String? name,
    bool? isActive,
    int? targetSession,
    int? currentSession}){
    _name = name;
    _isActive = isActive;
    _targetSession = targetSession;
    _currentSession = currentSession;
  }

  Pomodoro.fromJson(dynamic json) {
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