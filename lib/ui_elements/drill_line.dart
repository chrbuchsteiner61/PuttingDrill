import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myapp/dev_area/the_result_chart.dart';

import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/a_drill_icon.dart';
import 'package:myapp/user_areas/explain_screen.dart';
import 'package:myapp/user_areas/input_screen/input_screen.dart';
import 'package:myapp/methods_and_helper/drills_initial_value.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class DrillLine extends StatelessWidget {
  final Map<String, String> drillTexts;

  final String aPreparePic;
  final String drillPicture;

  final ButtonStyle theButtonStyle;
  final DrillsInitialValue aDrill;
  final Map<String, String> textForDrillLine;

  const DrillLine(
      {super.key,
      required this.drillTexts,
      required this.drillPicture,
      required this.aPreparePic,
      required this.theButtonStyle,
      required this.aDrill,
      required this.textForDrillLine});

  @override
  Widget build(BuildContext context) {
    const double elementHeight = 50.0;
    const SizedBox aSpacer = SizedBox(width: 8, height: elementHeight + 8);

    //final localizations = AppLocalizations.of(context);

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
                      drillName: drillTexts["drillName"]!,
                      drillPurpose: drillTexts["thePurpose"]!,
                      preparationText: drillTexts["aPreparationText"]!,
                      countingText: drillTexts["aCountingText"]!,
                      theTask: drillTexts["aTask"]!,
                      preparationHeader: drillTexts["preparationHeader"]!,
                      countingHeader: drillTexts["countingHeader"]!,
                      preparePic: aPreparePic,
                    ),
                  ),
                );
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(drillTexts["drillName"]!),
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
                      inputDrillCriteria1: drillTexts["inputDrillCriteria1"]!,
                      inputDrillCriteria2: drillTexts["inputDrillCriteria2"]!,
                      inputDrillCriteria3: drillTexts["inputDrillCriteria3"]!,
                      drillInput1: drillTexts["inputDrillInput1"]!,
                      drillInput2: drillTexts["inputDrillInput2"]!,
                      drillInput3: drillTexts["inputDrillInput3"]!,
                      aDrill: aDrill,
                      errorInputMessageNonEmptyNegativ:
                          textForDrillLine["errorInputMessageNonEmptyNegativ"]!,
                    ),
                  ),
                );
              },
              child: Text(drillTexts["inputResults"]!),
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
                    builder: (context) => TheResultChart(
                      numberOfDrill: aDrill.drillNo,
                      drillName: drillTexts["drillName"]!,
                      drillInputLength: drillTexts["drillInputLength"]!,
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
