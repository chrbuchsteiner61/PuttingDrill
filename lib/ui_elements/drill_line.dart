import 'package:flutter/material.dart';
import 'package:myapp/user_areas/results_screen/result_chart.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/a_drill_icon.dart';
import 'package:myapp/user_areas/explain_screen.dart';
import 'package:myapp/user_areas/input_screen/input_screen.dart';
import 'package:myapp/methods_and_helper/drills_initial_value.dart';

import 'package:logger/logger.dart';

var logger = Logger();

class DrillLine extends StatelessWidget {
  static const _boxWidths = [130.0, 80.0, 80.0];
  static const _elementHeight = 50.0;
  static const _spacer = SizedBox(width: 8, height: _elementHeight + 18);

  final int drillNumber;
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
  final String successWord;

  const DrillLine({
    super.key,
    required this.drillNumber,
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
    required this.successWord,
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
          _buildResultsButton(context, drillNumber),
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

  Widget _buildResultsButton(BuildContext context, int aDrillNumber) {
    logger.d(aDrillNumber);
    return _DrillButton(
      width: _boxWidths[2],
      height: _elementHeight,
      style: theButtonStyle,
      onPressed: () => _navigateToResults(context, aDrillNumber),
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
          success: successWord,
          aDrill: aDrill,
          errorInputMessageNonEmptyNegativ:
              textForDrillLine["errorInputMessageNonEmptyNegativ"]!,
        ),
      ),
    );
  }

  void _navigateToResults(BuildContext context, int aDrillNumber) {
    logger.d(aDrillNumber);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultChart(
          drillNumber: aDrillNumber,
          //numberOfDrill: 2,
          drillName: drillName,
          drillInputLength: inputData.criteria3,
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
