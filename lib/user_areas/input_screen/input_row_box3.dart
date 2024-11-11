import 'package:flutter/material.dart';

class InputRowBox3 extends StatelessWidget {
  final String drillInput;
  final double colPosition;
  final double rowHeight;

  const InputRowBox3(
      {super.key,
      required this.drillInput,
      required this.colPosition,
      required this.rowHeight});

  @override
  Widget build(BuildContext context) {
    const double correctHeight = 8.0;
    return Column(
      children: [
        SizedBox(
          width: colPosition,
          height: rowHeight - correctHeight,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              drillInput,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ),
        ),
      ],
    );
  }
}
