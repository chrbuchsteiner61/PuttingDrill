import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/input_row.dart';
import 'package:myapp/user_areas/input_screen/helper_widgets/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/helper_widgets/input_row_box3.dart';
import 'package:myapp/user_areas/input_screen/input_rows/input_drop_down_widget.dart';

class InputNumberOfAttemptsRow2 extends StatefulWidget {
  final String inputDrillCriteria2;
  final String errorInputMessageNonEmptyNegativ;
  final String drillInput2;
  final List<double> colPosition;
  final InputDecoration inputDecoration;
  final int putts;
  final List<int> numberOfExercises;
  final ValueChanged<int?> onPuttsChanged;
  final double rowHeight;

  const InputNumberOfAttemptsRow2({
    super.key,
    required this.inputDrillCriteria2,
    required this.errorInputMessageNonEmptyNegativ,
    required this.drillInput2,
    required this.colPosition,
    required this.inputDecoration,
    required this.putts,
    required this.numberOfExercises,
    required this.onPuttsChanged,
    required this.rowHeight,
  });

  @override
  State<InputNumberOfAttemptsRow2> createState() =>
      _InputNumberOfAttemptsRow2State();
}

class _InputNumberOfAttemptsRow2State extends State<InputNumberOfAttemptsRow2> {
  @override
  Widget build(BuildContext context) {
    return InputRow(
      aHeight: widget.rowHeight,
      child: Row(
        children: <Widget>[
          spaceBetween,
          InputRowBox1(
              columnWidth: widget.colPosition[0],
              inputDrillCriteria1: widget.inputDrillCriteria2),
          InputDropDownWidget(
            boxWidth: widget.colPosition[1],
            inputDecoration: widget.inputDecoration,
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
          spaceBetween,
          InputRowBox3(
            rowHeight: widget.rowHeight,
            drillInput: widget.drillInput2,
            colPosition: widget.colPosition[2],
          ),
        ],
      ),
    );
  }
}
