import 'package:flutter/material.dart';

class BlueCard extends StatelessWidget {
  BlueCard({required this.textName, required this.action});

  final String textName;
  // final Widget nextScreen;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:action,
      child: Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            height: 60.0,
            
            child:
             Text(
              textName,
              style: TextStyle(
                  color: Colors.white, fontSize: 17.0, letterSpacing: 1.5),
            ),
          ),
        ),
        color: Color(0xff548ee5),
      ),
    );
  }

  // AnimatedBuilder here(Animation<double> animation) {
  //   return AnimatedBuilder(
  //       animation: animation,
  //       builder: (context, child) {
  //         return SlideTransition(
  //           position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
  //               .animate(animation),
  //         );
  //       },
  //       child: nextScreen);
  // }
}






//TODO: Next couple of code is cut out from here so push funtion is broken,

//  () => Navigator.push(
//           context,
//           PageRouteBuilder(
//             pageBuilder: (context, animation, secondaryAnimation) {
//               // return here(animation);fix from here
//               return nextScreen;
//             },
//             transitionDuration: Duration(seconds: 1),
//           ))