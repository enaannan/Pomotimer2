import 'package:flutter/material.dart';
import 'LinearProgressBar.dart';
import 'SizedBoxTrasparent.dart';

import 'ViewCards.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBoxTrasparent(),
        ViewCards(
          topLeftRadius: 30.0,
          topRightRadius: 30.0,
          offsetX: 0,
          offsetY: -3,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5),
                    child: Text(
                      "Task Statistics",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20),
                    child: Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Container(
                height: 50,
                color: Colors.green,
              ),
              Expanded(
                child: ListView(
                  children: [
                    LinearProgressBar(
                      selectedColor: Colors.red,
                    ),
                    LinearProgressBar(
                      selectedColor: Colors.yellow,
                    ),
                    LinearProgressBar(selectedColor: Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
