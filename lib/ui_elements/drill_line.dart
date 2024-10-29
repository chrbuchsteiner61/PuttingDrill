import 'package:flutter/material.dart';
import 'package:myapp/user_areas/results_screen/the_result_chart.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/a_drill_icon.dart';
import 'package:myapp/user_areas/explain_screen.dart';
import 'package:myapp/user_areas/input_screen/input_screen.dart';
import 'package:myapp/methods_and_helper/drills_initial_value.dart';

class DrillLine extends StatelessWidget {
  static const _boxWidths = [130.0, 80.0, 80.0];
  static const _elementHeight = 50.0;
  static const _spacer = SizedBox(width: 8, height: _elementHeight + 18);

  final String drillName;
  final String thePurpose;
  final String aPreparationText;
  final String aCountingText;
  final String aTask;
  final DrillInputData inputData;
  final String aPreparePic;
  final String drillPicture;
  final String theClubLength;
  final ButtonStyle theButtonStyle;
  final DrillsInitialValue aDrill;
  final Map<String, String> textForDrillLine;

  const DrillLine({
    super.key,
    required this.drillName,
    required this.thePurpose,
    required this.aPreparationText,
    required this.aCountingText,
    required this.aTask,
    required this.inputData,
    required this.drillPicture,
    required this.theClubLength,
    required this.aPreparePic,
    required this.theButtonStyle,
    required this.aDrill,
    required this.textForDrillLine,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _spacer,
          _spacer,
          ADrillIcon(elementHeight: _elementHeight, drillPicture: drillPicture),
          spaceBetween,
          _buildExplainButton(context),
          spaceBetween,
          _buildInputButton(context),
          spaceBetween,
          _buildResultsButton(context),
        ],
      ),
    );
  }

  Widget _buildExplainButton(BuildContext context) {
    return _DrillButton(
      width: _boxWidths[0],
      height: _elementHeight,
      style: theButtonStyle,
      onPressed: () => _navigateToExplain(context),
      alignment: Alignment.centerLeft,
      text: drillName,
    );
  }

  Widget _buildInputButton(BuildContext context) {
    return _DrillButton(
      width: _boxWidths[1],
      height: _elementHeight,
      style: theButtonStyle,
      onPressed: () => _navigateToInput(context),
      text: textForDrillLine["inputResults"]!,
    );
  }

  Widget _buildResultsButton(BuildContext context) {
    return _DrillButton(
      width: _boxWidths[2],
      height: _elementHeight,
      style: theButtonStyle,
      onPressed: () => _navigateToResults(context),
      text: textForDrillLine["viewResults"]!,
    );
  }

  void _navigateToExplain(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExplainScreen(
          drillName: drillName,
          drillPurpose: thePurpose,
          preparationText: aPreparationText,
          clubLength: theClubLength,
          countingText: aCountingText,
          theTask: aTask,
          preparationHeader: textForDrillLine["preparationHeader"]!,
          countingHeader: textForDrillLine["countingHeader"]!,
          preparePic: aPreparePic,
        ),
      ),
    );
  }

  void _navigateToInput(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputScreen(
          appBarText: textForDrillLine["inputAppBarText"]!,
          buttonText: textForDrillLine["inputButtonText"]!,
          inputDrillCriteria1: inputData.criteria1,
          inputDrillCriteria2: inputData.criteria2,
          inputDrillCriteria3: inputData.criteria3,
          drillInput1: inputData.input1,
          drillInput2: inputData.input2,
          drillInput3: inputData.input3,
          aDrill: aDrill,
          errorInputMessageNonEmptyNegativ:
              textForDrillLine["errorInputMessageNonEmptyNegativ"]!,
        ),
      ),
    );
  }

  void _navigateToResults(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TheResultChart(
          numberOfDrill: aDrill.drillNumber,
          drillName: drillName,
          drillInputLength: theClubLength,
        ),
      ),
    );
  }
}

// Reusable button widget
class _DrillButton extends StatelessWidget {
  final double width;
  final double height;
  final ButtonStyle style;
  final VoidCallback onPressed;
  final String text;
  final Alignment? alignment;

  const _DrillButton({
    required this.width,
    required this.height,
    required this.style,
    required this.onPressed,
    required this.text,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: alignment != null
            ? Align(
                alignment: alignment!,
                child: Text(text),
              )
            : Text(text),
      ),
    );
  }
}
