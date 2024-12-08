import 'package:flutter/material.dart';
import 'package:myapp/drills/drill.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_wrap.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box3.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_drop_down_widget.dart';

class InputAttempts extends StatefulWidget {
  final Drill aDrill;
  final String inputDrillCriteria2;
  final String errorInputMessageNonEmptyNegativ;
  final String drillInput2;
  final List<int> numberOfExercises;
  final int putts;
  final ValueChanged<int?> onPuttsChanged;

  const InputAttempts({
    super.key,
    required this.aDrill,
    required this.inputDrillCriteria2,
    required this.errorInputMessageNonEmptyNegativ,
    required this.drillInput2,
    required this.numberOfExercises,
    required this.putts,
    required this.onPuttsChanged,
  });

  @override
  State<InputAttempts> createState() => _InputAttemptsState();
}

class _InputAttemptsState extends State<InputAttempts> {
  @override
  Widget build(BuildContext context) {
    return InputRowWrap(
      box1: InputRowBox1(inputDrillCriteria1: widget.inputDrillCriteria2),
      box2: InputDropDownWidget(
        items: widget.numberOfExercises,
        value: widget.putts,
        onChanged: widget.onPuttsChanged,
        validator: (value) {
          if (value == null) {
            return widget.errorInputMessageNonEmptyNegativ;
          }
          return null;
        },
      ),
      box3: InputRowBox3(
        drillInput: widget.drillInput2,
      ),
    );
  }
}
