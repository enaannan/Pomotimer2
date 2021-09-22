import 'package:flutter/material.dart';
import 'package:pomotimer2/bloc/UsersInfoBloc.dart';
import 'package:pomotimer2/data/models/pomodoro.dart';
import 'package:pomotimer2/data/models/user.dart';

List<String> pomodoroNames = [
  'drink tea',
  'dance',
  'drink tea',
  'dance',
  ' have fun'
];

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('My Pomodoros'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: StreamBuilder(
        stream: bloc.allUsersAndPomodoros,
        builder: (context, AsyncSnapshot<User> snapshot){
          if (snapshot.hasData && snapshot.data!.pomodoros!.isNotEmpty) {
            return buildListView(snapshot.data!.pomodoros!);
          } else
          if (snapshot.hasError) {
            Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      )
//      buildListView(),
    );
  }

  ListView buildListView(List<Pomodoro> pomodoros) {
print("adadasda");
    return ListView.builder(
      itemCount: pomodoros.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(pomodoros[index].name!),
          leading: Container(
            color: Colors.amber,
            width: 4,
          ),
          trailing: InkWell(
            child: Icon(
              Icons.play_circle_outline_outlined,
              color: Colors.grey,
            ),
            onTap: () {
              print("started timer as position $index");
              Navigator.of(context).pop();
              //TODO:start pomodoro timer
            },
          ),
        ),
      ),
    );
  }
}
