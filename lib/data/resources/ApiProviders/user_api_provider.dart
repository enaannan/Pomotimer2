import '../../models/user.dart';
//TODO: implement networkcall here

//dummy data returned from netwrok call
Map<String, dynamic> responseBody = {
  'last_Name': 'bra-nhii',
  'other_Names': 'Annan',
  'pomodoros': [
    {
      'name': 'learn flutter',
      'isActive': false,
      'targetSession': 4,
      'currentSession': 1
    },
    {
      'name': 'read a book ',
      'isActive': false,
      'targetSession': 5,
      'currentSession': 4
    },
    {
      'name': 'dance',
      'isActive': false,
      'targetSession': 6,
      'currentSession': 6
    },
    {
      'name': 'pray',
      'isActive': false,
      'targetSession': 6,
      'currentSession': 4
    },
    {
      'name': 'learn flutter',
      'isActive': true,
      'targetSession': 4,
      'currentSession': 1
    },
  ]
};

class UserApiProvider {
  User fetchUserInfo() {
    return User.fromJson(responseBody);
  }
}
