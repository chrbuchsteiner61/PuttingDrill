import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myapp/user_areas/results_screen/the_result_chart.dart';

import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/a_drill_icon.dart';
import 'package:myapp/user_areas/explain_screen.dart';
import 'package:myapp/user_areas/input_screen/input_screen.dart';
import 'package:myapp/methods_and_helper/drills_initial_value.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class DrillLine extends StatelessWidget {
  final String drillName;
  final String thePurpose;
  final String aPreparationText;
  final String aCountingText;
  final String aTask;

  final String inputDrillCriteria1;
  final String inputDrillCriteria2;
  final String inputDrillCriteria3;
  final String inputDrillInput1;
  final String inputDrillInput2;
  final String inputDrillInput3;
  final String aPreparePic;
  final String drillPicture;

  final ButtonStyle theButtonStyle;
  final DrillsInitialValue aDrill;
  final Map<String, String> textForDrillLine;

  const DrillLine(
      {super.key,
      required this.drillName,
      required this.thePurpose,
      required this.aPreparationText,
      required this.aCountingText,
      required this.aTask,
      required this.inputDrillCriteria1,
      required this.inputDrillCriteria2,
      required this.inputDrillCriteria3,
      required this.inputDrillInput1,
      required this.inputDrillInput2,
      required this.inputDrillInput3,
      required this.drillPicture,
      required this.aPreparePic,
      required this.theButtonStyle,
      required this.aDrill,
      required this.textForDrillLine});

  @override
  Widget build(BuildContext context) {
    const double elementHeight = 50.0;
    const SizedBox aSpacer = SizedBox(width: 8, height: elementHeight + 18);

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
                      preparationText: aPreparationText,
                      countingText: aCountingText,
                      theTask: aTask,
                      preparationHeader: textForDrillLine["preparationHeader"]!,
                      countingHeader: textForDrillLine["countingHeader"]!,
                      preparePic: aPreparePic,
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
                      appBarText: textForDrillLine["inputAppBarText"]!,
                      buttonText: textForDrillLine["inputButtonText"]!,
                      inputDrillCriteria1: inputDrillCriteria1,
                      inputDrillCriteria2: inputDrillCriteria2,
                      inputDrillCriteria3: inputDrillCriteria3,
                      drillInput1: inputDrillInput1,
                      drillInput2: inputDrillInput2,
                      drillInput3: inputDrillInput3,
                      aDrill: aDrill,
                      errorInputMessageNonEmptyNegativ:
                          textForDrillLine["errorInputMessageNonEmptyNegativ"]!,
                    ),
                  ),
                );
              },
              child: Text(textForDrillLine["inputResults"]!),
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
                    builder: (context) => const TheResultChart(
                      //numberOfDrill: aDrill.drillNo,
                      //drillName: drillName,
                      //drillInputLength: inputDrillInput1,
                      // test reasons
                      numberOfDrill: 1,
                      drillName: "something",
                      drillInputLength: "beliebige Länge",
                    ),
                  ),
                );
              },
              child: Text(textForDrillLine["viewResults"]!),
            ),
          ),
        ],
      ),
    );
  }
}
