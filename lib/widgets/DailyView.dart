import 'package:flutter/material.dart';

class DailyView extends StatelessWidget {
  const DailyView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );

    // return Column(
    // children: [
    // ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: [
    //     ViewCards(
    //       offsetX: 0,
    //       offsetY: 3,
    //       topLeftRadius: 30,
    //       topRightRadius: 30,
    //       bottomLeftRadius: 30,
    //       bottomRightRadius: 30,
    //       child: Container(
    //         height: 10,
    //         width: 10,
    //         color: Colors.green,
    //       ),
    //     ),
    //   ],
    // ),
    // ],
    // );
  }
}
