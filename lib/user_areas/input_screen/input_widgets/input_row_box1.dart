import 'package:flutter/material.dart';

class InputRowBox1 extends StatelessWidget {
  final String inputDrillCriteria1;

  const InputRowBox1({super.key, required this.inputDrillCriteria1});

  @override
  Widget build(BuildContext context) {
    return Text(
      inputDrillCriteria1,
      style: Theme.of(context).textTheme.titleMedium!,
    );
  }
}
