import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/input_row.dart';
import 'package:myapp/user_areas/input_screen/input_box1.dart';
import 'package:myapp/user_areas/input_screen/input_drop_down_widget.dart';

class InputCriteria3 extends StatefulWidget {
  final String inputDrillCriteria3;
  final String drillInput3;
  final String errorInputMessageNonEmptyNegativ;
  final List<double> colPosition;

  const InputCriteria3({
    super.key,
    required this.inputDrillCriteria3,
    required this.drillInput3,
    required this.errorInputMessageNonEmptyNegativ,
    required this.colPosition,
  });

  @override
  InputCriteria3State createState() => InputCriteria3State();
}

class InputCriteria3State extends State<InputCriteria3> {

  @override
  void initState() {
    super.initState();
  }

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
            inputDecoration: inputDecoration,
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
