import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/drill.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_wrap.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box3.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_drop_down_widget.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_text_widget.dart';

class InputSuccess extends StatefulWidget {
  final Drill aDrill;
  final String inputDrillCriteria3;
  final String drillInput3;
  final String errorInputMessageNonEmptyNegativ;

  final int putts;
  final Function(int?) onSuccessfullPutts;
  final Function(String?) onSuccessDistance;

  const InputSuccess({
    super.key,
    required this.aDrill,
    required this.inputDrillCriteria3,
    required this.drillInput3,
    required this.errorInputMessageNonEmptyNegativ,
    required this.putts,
    required this.onSuccessfullPutts,
    required this.onSuccessDistance,
  });

  @override
  InputSuccessState createState() => InputSuccessState();
}

class InputSuccessState extends State<InputSuccess> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> potentialSuccess = [];
    potentialSuccess = widget.aDrill.calculatePotentialSuccess();

    return InputRowWrap(
      box1: InputRowBox1(inputDrillCriteria1: widget.inputDrillCriteria3),
      box2: (widget.aDrill.isDropDown)
          ? InputDropDownWidget(
              items: potentialSuccess,
              value: widget.putts,
              onChanged: widget.onSuccessfullPutts,
              validator: (value) {
                if (value == null) {
                  return widget.errorInputMessageNonEmptyNegativ;
                }
                return null;
              },
            )
          : InputTextWidget(
              onChanged: widget.onSuccessDistance,
              validator: (value) {
                if (value == null) {
                  return widget.errorInputMessageNonEmptyNegativ;
                }
                return null;
              },
            ),
      box3: InputRowBox3(
        drillInput: widget.drillInput3,
      ),
    );
  }
}
