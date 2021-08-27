import 'package:pomotimer2/data/models/user.dart';

import 'ApiProviders/user_api_provider.dart';

class Repository {
  //connects to provider for fetching details about users
  final userApiProvider = UserApiProvider();

  Future <User> fetchUserAndPomodoros() => userApiProvider.fetchUserInfo();
}

// import 'dart:math';

// abstract class TaskRepository {
//   Future<List<Task>> fetchTasks(String clientID);
// }

// class FakeTasksRepository implements TaskRepository {
// // list of tasks
// List<Task> tasks = [
//   Task('learn flutter', 2, 4),
//   Task('read a book ', 2, 3),
//   Task('update my portfolio site', 1, 2),
//   Task('Debut side project', 0, 5),
//   Task('write a blog', 4, 4),
//   ];

// //simulate a network delay
//   @override
//   Future<List<Task>> fetchTasks(String clientID) {
//     return Future.delayed(Duration(seconds: 1), () {
//       final random = Random();

//       //simulate network esceptions
//       if (random.nextBool()) {
//         throw Exception();
//       }

//       //on success
//       return tasks;
//     });
//   }

// }
