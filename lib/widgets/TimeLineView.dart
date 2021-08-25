import 'package:flutter/material.dart';
import 'SizedBoxTrasparent.dart';
import 'ViewCards.dart';

class TimeLineView extends StatelessWidget {
  const TimeLineView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBoxTrasparent(),
        ViewCards(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Focus sessions"),
                    Container(
                      child: Row(
                        children: [
                          Text("This week"),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Container(
                  color: Colors.green,
                ))
              ],
            ),
          ),
        ),
        SizedBoxTrasparent(),
        ViewCards(
          offsetX: 0,
          offsetY: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Productivity"),
                    Row(
                      children: [
                        Text("This week"),
                        Icon(Icons.arrow_drop_down),
                      ],
                    )
                  ],
                ),
                Expanded(
                    child: Container(
                  color: Colors.blue,
                ))
              ],
            ),
          ),
        ),
        SizedBoxTrasparent(
          height: 1,
        ),
      ],
    );
  }
}
