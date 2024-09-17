import 'package:flutter/material.dart';

import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/a_drill_icon.dart';
import 'package:myapp/user_areas/explain_screen.dart';
import 'package:myapp/user_areas/input_screen.dart';
//import 'package:myapp/user_areas/results_screen.dart';
import 'package:myapp/user_areas/results_test.dart';
import 'package:myapp/methods_and_helper/drills.dart';

class DrillLine extends StatelessWidget {
  final String drillName;
  final String thePurpose;
  final String drillPicture;
  final String preparationHeader;
  final String countingHeader;
  final String aPreparationText;
  final String aCountingText;
  final String aPreparePicName;
  final String anExercisePicName;
  final ButtonStyle theButtonStyle;
  final String buttonInputResultsText;
  final String buttonViewResultsText;
  final String inputAppBarText;
  final String inputButtonText;
  final String aTask;
  final String inputDrillCriteria1;
  final String inputDrillCriteria2;
  final String inputDrillCriteria3;
  final String inputDrillInput1;
  final String inputDrillInput2;
  final String inputDrillInput3;
  final Drills aDrill;
  final String errorInputMessageNonEmptyNegativ;

  const DrillLine({
    super.key,
    required this.drillName,
    required this.thePurpose,
    required this.drillPicture,
    required this.preparationHeader,
    required this.countingHeader,
    required this.aPreparationText,
    required this.aCountingText,
    required this.aPreparePicName,
    required this.anExercisePicName,
    required this.theButtonStyle,
    required this.buttonInputResultsText,
    required this.buttonViewResultsText,
    required this.inputAppBarText,
    required this.inputButtonText,
    required this.aTask,
    required this.inputDrillCriteria1,
    required this.inputDrillCriteria2,
    required this.inputDrillCriteria3,
    required this.inputDrillInput1,
    required this.inputDrillInput2,
    required this.inputDrillInput3,
    required this.aDrill,
    required this.errorInputMessageNonEmptyNegativ,
  });

  @override
  Widget build(BuildContext context) {
    const double elementHeight = 50.0;
    const SizedBox aSpacer = SizedBox(width: 8, height: elementHeight + 8);

    // final localizations = AppLocalizations.of(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          aSpacer,
          ADrillIcon(elementHeight: elementHeight, drillPicture: drillPicture),
          spaceBetween,
          SizedBox(
            width: 120,
            height: elementHeight,
            child: TextButton(
              style: theButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExplainScreen(
                      drillName: drillName,
                      drillPurpose: thePurpose,
                      theTask: aTask,
                      preparationHeader: preparationHeader,
                      countingHeader: countingHeader,
                      preparePicName: aPreparePicName,
                      exercisePicName: anExercisePicName,
                      preparationText: aPreparationText,
                      countingText: aCountingText,
                    ),
                  ),
                );
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(drillName),
              ),
            ),
          ),
          spaceBetween,
          SizedBox(
            height: elementHeight,
            width: 70.0,
            child: ElevatedButton(
              style: theButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputScreen(
                      appBarText: inputAppBarText,
                      buttonText: inputButtonText,
                      inputDrillCriteria1: inputDrillCriteria1,
                      inputDrillCriteria2: inputDrillCriteria2,
                      inputDrillCriteria3: inputDrillCriteria3,
                      drillInput1: inputDrillInput1,
                      drillInput2: inputDrillInput2,
                      drillInput3: inputDrillInput3,
                      aDrill: aDrill,
                      errorInputMessageNonEmptyNegativ:
                          errorInputMessageNonEmptyNegativ,
                    ),
                  ),
                );
              },
              child: Text(buttonInputResultsText),
            ),
          ),
          spaceBetween,
          SizedBox(
            height: elementHeight,
            width: 70.0,
            child: ElevatedButton(
              style: theButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResultsTest()),
                );
              },
              child: Text(buttonViewResultsText),
            ),
          ),
        ],
      ),
    );
  }
}
