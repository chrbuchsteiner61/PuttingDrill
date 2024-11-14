import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/input_row.dart';
import 'package:myapp/user_areas/input_screen/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/input_row_box3.dart';
import 'package:myapp/user_areas/input_screen/input_drop_down_widget.dart';

class InputRow3 extends StatefulWidget {
  final String inputDrillCriteria3;
  final String drillInput3;
  final String errorInputMessageNonEmptyNegativ;
  final List<double> colPosition;
  final InputDecoration inputDecoration;
  final double rowHeight;
  final int putts;
  final List<int> numberOfExercises;
  final ValueChanged<int?> onExercisesChanged;

  const InputRow3({
    super.key,
    required this.inputDrillCriteria3,
    required this.drillInput3,
    required this.errorInputMessageNonEmptyNegativ,
    required this.colPosition,
    required this.inputDecoration,
    required this.rowHeight,
    required this.putts,
    required this.numberOfExercises,
    required this.onExercisesChanged,
  });

  @override
  InputRow3State createState() => InputRow3State();
}

class InputRow3State extends State<InputRow3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputRow(
      aHeight: widget.rowHeight,
      child: Row(
        children: <Widget>[
          spaceBetween,
          InputRowBox1(
              columnWidth: widget.colPosition[0],
              inputDrillCriteria1: widget.inputDrillCriteria3),
          InputDropDownWidget(
            boxWidth: widget.colPosition[1],
            inputDecoration: widget.inputDecoration,
            items: widget.numberOfExercises,
            value: widget.putts,
            onChanged: (value) {
              setState(() {
                var putts = value!;
              });
            },
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
            drillInput: widget.drillInput3,
            colPosition: widget.colPosition[2],
          ),
        ],
      ),
    );
  }
}
