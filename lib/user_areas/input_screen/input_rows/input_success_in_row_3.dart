import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/methods_and_helper/drills_the_standard.dart';
import 'package:myapp/ui_elements/input_row.dart';
import 'package:myapp/user_areas/input_screen/helper_widgets/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/helper_widgets/input_row_box3.dart';
import 'package:myapp/user_areas/input_screen/input_rows/input_drop_down_widget.dart';
import 'package:myapp/user_areas/input_screen/input_rows/input_text_widget.dart';

class InputSuccessInRow3 extends StatefulWidget {
  final DrillTheStandard aDrill;
  final String inputDrillCriteria3;
  final String drillInput3;
  final String errorInputMessageNonEmptyNegativ;
  final List<double> colPosition;
  final InputDecoration inputDecoration;
  final double rowHeight;
  final int putts;
  final ValueChanged<int?> onSuccessfulls;

  const InputSuccessInRow3({
    super.key,
    required this.aDrill,
    required this.inputDrillCriteria3,
    required this.drillInput3,
    required this.errorInputMessageNonEmptyNegativ,
    required this.colPosition,
    required this.inputDecoration,
    required this.rowHeight,
    required this.putts,
    required this.onSuccessfulls,
  });

  @override
  InputSuccessInRow3State createState() => InputSuccessInRow3State();
}

class InputSuccessInRow3State extends State<InputSuccessInRow3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> potentialSuccess = [];
    potentialSuccess = widget.aDrill.calculatePotentialSuccess();

    return InputRow(
      aHeight: widget.rowHeight,
      child: Row(
        children: <Widget>[
          spaceBetween,
          InputRowBox1(
              columnWidth: widget.colPosition[0],
              inputDrillCriteria1: widget.inputDrillCriteria3),
          (widget.aDrill.isDropDown)
              ? InputDropDownWidget(
                  boxWidth: widget.colPosition[1],
                  inputDecoration: widget.inputDecoration,
                  items: potentialSuccess,
                  value: widget.putts,
                  onChanged: widget.onSuccessfulls,
                  validator: (value) {
                    if (value == null) {
                      return widget.errorInputMessageNonEmptyNegativ;
                    }
                    return null;
                  },
                )
              : InputTextWidget(
                  boxWidth: widget.colPosition[1],
                  inputDecoration: widget.inputDecoration,
                  value: 12,
                  onChanged: widget.onSuccessfulls,
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
