import 'package:flutter/material.dart';
import 'package:myapp/drills/drill.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_wrap.dart';
// import 'package:myapp/methods_and_helper/initialize_drills.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box3.dart';

class ShowSuccessRate extends StatefulWidget {
  final String successText;

  final Drill aDrill;
  final int selectedDistance;
  final int putts;
  final double successfulPutts;
  final double missedDistanceFeet;

  const ShowSuccessRate({
    super.key,
    required this.successText,
    required this.aDrill,
    required this.selectedDistance,
    required this.putts,
    required this.successfulPutts,
    required this.missedDistanceFeet,
  });

  @override
  State<ShowSuccessRate> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowSuccessRate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double successRate = 0.99;

    successRate = widget.aDrill.calculateSuccessRate(widget.selectedDistance,
        widget.putts, widget.successfulPutts, widget.missedDistanceFeet);

    return InputRowWrap(
      box1: InputRowBox1(inputDrillCriteria1: widget.successText),
      box2: Text(successRate.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodyMedium!),
      box3: const InputRowBox3(
        drillInput: "%",
      ),
    );
  }
}
