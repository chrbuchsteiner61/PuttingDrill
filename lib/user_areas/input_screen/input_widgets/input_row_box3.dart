import 'package:flutter/material.dart';

class InputRowBox3 extends StatelessWidget {
  final String drillInput;

  const InputRowBox3({super.key, required this.drillInput});

  @override
  Widget build(BuildContext context) {
    // const double correctHeight = 8.0;
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        drillInput,
        style: Theme.of(context).textTheme.bodyMedium!,
      ),
    );
  }
}
