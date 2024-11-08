import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/input_row.dart';
import 'package:myapp/user_areas/input_screen/input_box1.dart';
import 'package:myapp/user_areas/input_screen/input_drop_down_widget.dart';

class InputCriteria2 extends StatefulWidget {
  final String inputDrillCriteria2;
  final String errorInputMessageNonEmptyNegativ;
  final String drillInput2;
  final List<double> colPosition;
  final InputDecoration inputDecoration;

  const InputCriteria2({
    super.key,
    required this.inputDrillCriteria2,
    required this.errorInputMessageNonEmptyNegativ,
    required this.drillInput2,
    required this.colPosition, 
    required this.inputDecoration,
  });

  @override
  State<InputCriteria2> createState() => _InputCriteria2State();
}

class _InputCriteria2State extends State<InputCriteria2> {
  @override
  Widget build(BuildContext context) {
    return InputRow(
      child: Row(
        children: <Widget>[
          spaceBetween,
          InputBoxNo1(
              columnWidth: widget.colPosition[0],
              inputDrillCriteria1: widget.inputDrillCriteria2),
          InputDropDownWidget(
            boxWidth: widget.colPosition[1],
            inputDecoration: widget.inputDecoration,
            items: numberOfExercise,
            value: _putts,
            onChanged: (value) {
              setState(() {
                _putts = value!;
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
          SizedBox(
            width: widget.colPosition[2],
            child: Text(
              widget.drillInput2,
              style: Theme.of(context).textTheme.bodySmall!,
            ),
          ),
        ],
      ),
    );
  }
}
