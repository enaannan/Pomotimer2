import 'package:pomotimer2/data/resources/Respository.dart';
import 'package:pomotimer2/data/models/user.dart';

import 'package:rxdart/rxdart.dart';

class UsersInfoBloc {
  final _repository = Repository();
  final _userPomodorosStreamController = PublishSubject<User>(); // Stream controller that has both a source and a sink

  Stream<User> get allUsersAndPomodoros => _userPomodorosStreamController.stream;

  //fetch user information from user repository
  fetchUserAndPomodorosFromBloc() async {
    // only add to sink of streamContoller if it is not closed
    if (!_userPomodorosStreamController.isClosed) {
      User user = await _repository.fetchUserAndPomodoros();
      _userPomodorosStreamController.sink.add(user); // data from the repository enters through this sink
    } else
      print("Stream is closed. Figure out where you are calling the close method on the stream ");
  }

  dispose() {
    _userPomodorosStreamController.close();
  }
}

final bloc = UsersInfoBloc();
