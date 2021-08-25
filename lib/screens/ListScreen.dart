import 'package:flutter/material.dart';

List<String> pomodoroNames = [
  'drink tea',
  'dance',
  'drink tea',
  'dance',
  ' have fun'
];

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

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
      body: ListView.builder(
        itemCount: pomodoroNames.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(pomodoroNames[index]),
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
      ),
    );
  }
}
