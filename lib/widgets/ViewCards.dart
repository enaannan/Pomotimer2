import 'package:flutter/material.dart';

class ViewCards extends StatelessWidget {
  const ViewCards({
    Key? key,
    this.topLeftRadius = 0.0,
    this.topRightRadius = 0.0,
    this.bottomLeftRadius = 0.0,
    this.bottomRightRadius = 0.0,
    required this.child,
    this.offsetX = 0,
    this.offsetY = 5.0,
  }) : super(key: key);

//Radius for the card default has been set to zero
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;

  final Widget child;
  final double offsetX;
  final double offsetY;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeftRadius),
                  topRight: Radius.circular(topRightRadius),
                  bottomLeft: Radius.circular(bottomLeftRadius),
                  bottomRight: Radius.circular(bottomRightRadius)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    offset: Offset(offsetX, offsetY),
                    blurRadius: 7,
                    spreadRadius: 5)
              ]),
          child: child),
    );
  }
}
