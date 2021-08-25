import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({
    Key? key,
    required this.selectedColor,
  }) : super(key: key);

  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Learn flutter"), Text("200hrs")],
            ),
          ),
          StepProgressIndicator(
            totalSteps: 100,
            currentStep: 50,
            size: 10,
            padding: 0,
            selectedColor: selectedColor,
            unselectedColor: Colors.blueGrey.withOpacity(0.15),
            roundedEdges: Radius.circular(10),
          ),
        ],
      ),
    );
  }
}
