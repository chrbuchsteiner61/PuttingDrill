import 'package:flutter/material.dart';
import 'package:myapp/user_areas/explain_screen.dart';
import 'package:myapp/user_areas/input_screen.dart';
import 'package:myapp/user_areas/results_screen.dart';

class DrillLine extends StatelessWidget {
  final String drillName;
  final String thePurpose;
  final String drillPicture;
  final String aPreparationText;
  final String aCountingText;
  final String aPreparePicName;
  final String anExercisePicName;
  final ButtonStyle theButtonStyle;
  final String buttonInputResultsText;
  final String buttonViewResultsText;
  final String inputAppBarText;
  final String inputButtonText;
  final String inputDrillCriteria1;
  final String inputDrillCriteria2;
  final String inputDrillCriteria3;
  final String inputDrillInput1;
  final String inputDrillInput2;
  final String inputDrillInput3;

  const DrillLine({
    super.key,
    required this.drillName,
    required this.thePurpose,
    required this.drillPicture,
    required this.aPreparationText,
    required this.aCountingText,
    required this.aPreparePicName,
    required this.anExercisePicName,
    required this.theButtonStyle,
    required this.buttonInputResultsText,
    required this.buttonViewResultsText,
    required this.inputAppBarText,
    required this.inputButtonText,
    required this.inputDrillCriteria1,
    required this.inputDrillCriteria2,
    required this.inputDrillCriteria3,
    required this.inputDrillInput1,
    required this.inputDrillInput2,
    required this.inputDrillInput3,
  });

  @override
  Widget build(BuildContext context) {
    const double theMargin = 8.0;
    // final localizations = AppLocalizations.of(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(theMargin),
            child: Image(
              image: AssetImage(drillPicture),
              width: 50,
              height: 50,
            ),
          ),
          SizedBox(
            width: 80,
            child: TextButton(
              style: theButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExplainScreen(
                            drillName: drillName,
                            drillPurpose: thePurpose,
                            preparationText: aPreparationText,
                            countingText: aCountingText,
                            preparePicName: aPreparePicName,
                            exercisePicName: anExercisePicName,
                          )),
                );
              },
              child: Text(drillName),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: theMargin),
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
                    ),
                  ),
                );
              },
              child: Text(buttonInputResultsText),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: theMargin),
            child: ElevatedButton(
              style: theButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResultsScreen()),
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
