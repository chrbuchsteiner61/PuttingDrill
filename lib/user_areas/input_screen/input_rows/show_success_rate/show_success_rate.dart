import 'package:flutter/material.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_wrap.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box3.dart';

class ShowSuccessRate extends StatelessWidget {
  final String successText;
  final double successRate;

  const ShowSuccessRate({
    super.key,
    required this.successText,
    required this.successRate,
  });

  @override
  Widget build(BuildContext context) {
    return InputRowWrap(
      box1: InputRowBox1(inputDrillCriteria1: successText),
      box2: Text(successRate.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodyMedium!),
      box3: const InputRowBox3(
        drillInput: "%",
      ),
    );
  }
}
