import 'package:flutter/material.dart';

class InputBoxNo1 extends StatelessWidget {
  final double columnWidth;
  final String inputDrillCriteria1;

  const InputBoxNo1(
      {super.key,
      required this.columnWidth,
      required this.inputDrillCriteria1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: columnWidth,
      child: Text(
        inputDrillCriteria1,
        style: Theme.of(context).textTheme.titleMedium!,
      ),
    );
  }
}
