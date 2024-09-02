import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/constants.dart';

class ExplainScreen extends StatelessWidget {
  final String drillName;
  final String preparationHeader;
  final String countingHeader;
  final String preparationText;
  final String countingText;
  final String preparePicName;
  final String exercisePicName;
  final String drillPurpose;
  final String theTask;

  const ExplainScreen(
      {super.key,
      required this.drillName,
      required this.preparationHeader,
      required this.countingHeader,
      required this.preparationText,
      required this.countingText,
      required this.preparePicName,
      required this.exercisePicName,
      required this.drillPurpose,
      required this.theTask});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          drillName,
          style: Theme.of(context).textTheme.headlineLarge!,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              drillPurpose,
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
            spaceAfter,
            Text(theTask),
            spaceAfter,
            Text(
              preparationHeader,
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
            spaceAfter,
            Text(
              preparationText,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
            spaceAfter,
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
            spaceAfter,
            Text(
              countingHeader,
              style: Theme.of(context).textTheme.bodyLarge!,
            ),
            spaceAfter,
            Text(
              countingText,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
        ),
      ),
    );
  }
}
