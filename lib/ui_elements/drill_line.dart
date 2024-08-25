import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myapp/user_areas/explain_screen.dart';

import 'package:myapp/user_areas/input_screen.dart';
import 'package:myapp/user_areas/results_screen.dart';
import 'package:myapp/methods_and_helper/constants.dart';

class DrillLine extends StatelessWidget {
  final String drillName;
  final String drillPicture;
  final String aPreparationText;
  final String aCountingText;
  final String aPreparePicName;
  final String anExercisePicName;

  const DrillLine({
    super.key,
    required this.drillName,
    required this.drillPicture,
    required this.aPreparationText,
    required this.aCountingText,
    required this.aPreparePicName,
    required this.anExercisePicName,
  });

  @override
  Widget build(BuildContext context) {
    const double theMargin = 8.0;
    final localizations = AppLocalizations.of(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(theMargin),
            child: Image(
              image: AssetImage(drillPicture),
              width: 40,
              height: 40,
            ),
          ),
          TextButton(
            style: appsButtonStyle,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExplainScreen(
                          drillName: drillName,
                          preparationText: aPreparationText,
                          countingText: aCountingText,
                          preparePicName: aPreparePicName,
                          exercisePicName: anExercisePicName,
                        )),
              );
            },
            child: Text(drillName),
          ),
          Container(
            margin: const EdgeInsets.only(left: theMargin),
            child: ElevatedButton(
              style: appsButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InputScreen()),
                );
              },
              child: Text(localizations!.inputResults),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: theMargin),
            child: ElevatedButton(
              style: appsButtonStyle,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResultsScreen()),
                );
              },
              child: Text(localizations.viewResults),
            ),
          ),
        ],
      ),
    );
  }
}
