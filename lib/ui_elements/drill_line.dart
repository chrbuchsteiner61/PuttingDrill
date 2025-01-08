import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/user_areas/input_screen/input_screen.dart';
import 'package:myapp/user_areas/results_screen/result_chart.dart';
import 'package:myapp/ui_definition/constants.dart';
import 'package:myapp/user_areas/explain_screen/explain_screen.dart';
import 'package:myapp/drills/drill.dart';
import 'package:myapp/ui_elements/drill_button.dart';

class DrillLine extends StatelessWidget {
  static const _boxWidths = [140.0, 100.0, 100.0];
  static const _elementHeight = 50.0;
  static const _spacer = SizedBox(width: 1, height: _elementHeight + 18);

  final DrillList initializedDrills;
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
  final ButtonStyle theDrillButtonStyle;
  final Drill aDrill;
  final Map<String, String> textForDrillLine;
  final String successWord;

  const DrillLine({
    super.key,
    required this.initializedDrills,
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
    required this.theDrillButtonStyle,
    required this.aDrill,
    required this.textForDrillLine,
    required this.successWord,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //_spacer,
            _spacer,
            _buildExplainButton(context),
            spaceBetween,
            _buildInputButton(context),
            spaceBetween,
            _buildResultsButton(context, drillNumber),
            _spacer,
          ],
        ),
      ),
    );
  }

  Widget _buildExplainButton(BuildContext context) {
    return DrillButton(
      width: _boxWidths[0],
      height: _elementHeight,
      style: theDrillButtonStyle,
      onPressed: () => _navigateToExplain(context),
      alignment: Alignment.centerLeft,
      text: drillName,
    );
  }

  Widget _buildInputButton(BuildContext context) {
    return DrillButton(
      width: _boxWidths[1],
      height: _elementHeight,
      style: theButtonStyle,
      onPressed: () => _navigateToInput(context),
      text: textForDrillLine["inputResults"]!,
    );
  }

  Widget _buildResultsButton(BuildContext context, int aDrillNumber) {
    //logger.d(aDrillNumber);
    return DrillButton(
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
          successText: successWord,
          aDrill: aDrill,
          errorInputMessageNonEmptyNegativ:
              textForDrillLine["errorInputMessageNonEmptyNegativ"]!,
        ),
      ),
    );
  }

  void _navigateToResults(BuildContext context, int aDrillNumber) {
    //logger.d(aDrillNumber);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultChart(
          initializedDrills: initializedDrills,
          drillNumber: aDrillNumber,
          drillName: drillName,
          drillInputLength: inputData.criteria3,
        ),
      ),
    );
  }
}
