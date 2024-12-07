import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/drill.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_drop_down_widget.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box3.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_wrap.dart';

class InputDistance extends StatefulWidget {
  final Drill aDrill;
  final String inputDrillCriteria1;
  final String errorInputMessageNonEmptyNegativ;
  final String drillInput1;

  const InputDistance({
    super.key,
    required this.aDrill,
    required this.inputDrillCriteria1,
    required this.errorInputMessageNonEmptyNegativ,
    required this.drillInput1,
  });

  @override
  InputDistanceState createState() => InputDistanceState();
}

class InputDistanceState extends State<InputDistance> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputRowWrap(
      box1: InputRowBox1(inputDrillCriteria1: widget.inputDrillCriteria1),
      box2: InputDropDownWidget(
        items: widget.aDrill.distances,
        value: widget.aDrill.selectedDistance,
        onChanged: (value) {
          setState(() {
            widget.aDrill.selectedDistance = value!;
          });
        },
        validator: (value) {
          if (value == null) {
            return widget.errorInputMessageNonEmptyNegativ;
          }
          return null;
        },
      ),
      box3: InputRowBox3(
        drillInput: widget.drillInput1,
      ),
    );
  }
}
