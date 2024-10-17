import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ExplainScreen extends StatelessWidget {
  final String drillName;
  final String preparationHeader;
  final String countingHeader;
  final String preparationText;
  final String clubLength;
  final String countingText;
  final String preparePic;
  final String drillPurpose;
  final String theTask;

  const ExplainScreen(
      {super.key,
      required this.drillName,
      required this.preparationHeader,
      required this.countingHeader,
      required this.preparationText,
      required this.clubLength,
      required this.countingText,
      required this.preparePic,
      required this.drillPurpose,
      required this.theTask});

  @override
  Widget build(BuildContext context) {
    const pictureWidth = 350.0;
    const pictureHeight = 175.0;

    logger.d(drillName);

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
            SizedBox(
              height: pictureHeight,
              width: pictureWidth,
              child: SvgPicture.asset(
                preparePic,
                semanticsLabel: 'show preparation',
                fit: BoxFit.fill,
                width: pictureWidth,
                height: pictureHeight,
              ),
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
            spaceAfter,
            Text(clubLength, style: Theme.of(context).textTheme.bodySmall!)
          ],
        ),
      ),
    );
  }
}
