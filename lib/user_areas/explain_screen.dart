import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExplainScreen extends StatelessWidget {
  final String drillName;
  final String preparationText;
  final String countingText;
  final String preparePicName;
  final String exercisePicName;
  final String drillPurpose;

  const ExplainScreen(
      {super.key,
      required this.drillName,
      required this.preparationText,
      required this.countingText,
      required this.preparePicName,
      required this.exercisePicName,
      required this.drillPurpose});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(drillName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              drillPurpose,
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              localizations!.preparationHeader,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              preparationText,
              style: const TextStyle(fontSize: 16.0),
            ),
            Row(
              children: [
                Image(
                  image: AssetImage(preparePicName),
                  width: 200,
                  height: 100,
                ),
                Image(
                  image: AssetImage(exercisePicName),
                  width: 200,
                  height: 100,
                ),
              ],
            ),
            Text(
              localizations.countingHeader,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              countingText,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
