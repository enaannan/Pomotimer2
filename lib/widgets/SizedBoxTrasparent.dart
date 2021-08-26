import 'package:flutter/material.dart';

class SizedBoxTrasparent extends StatelessWidget {
  const SizedBoxTrasparent({
    Key? key,
    this.height = 10.0,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}
