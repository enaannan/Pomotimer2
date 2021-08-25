import 'package:pomotimer2/data/models/user.dart';
import 'package:pomotimer2/data/resources/Respository.dart';

import 'package:rxdart/rxdart.dart';

class UsersInfoBloc {
  final _repository = Repository();
  final _userFetcher = PublishSubject<User>(); // Stream controller that has both a source and a sink

  Stream<User> get allUsers => _userFetcher.stream;

  //fetch user information from user repository
  fetchUserInfoFromBloc() async {
    // only add to sink of streamContoller if it is not closed
    if (!_userFetcher.isClosed) {
      User user = await _repository.fetchUserInfo();
      _userFetcher.sink
          .add(user); // data from the repository enters through this sink
    } else
      print(
          "Stream is closed. Figure out where you are calling the close method on the stream ");
  }

  dispose() {
    _userFetcher.close();
  }
}

final bloc = UsersInfoBloc();
