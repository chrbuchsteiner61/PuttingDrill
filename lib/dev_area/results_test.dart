import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../methods_and_helper/database_helper.dart';

import 'package:logger/logger.dart';

var logger = Logger();

class ResultsTest extends StatelessWidget {
  const ResultsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Putting Results')),
      body: FutureBuilder<List<PuttingResult>>(
        future: DatabaseHelper().getResults(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Loading'));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final results = snapshot.data;
          return Column(
            children: [
              Expanded(child: ResultsFromDB(results)),
            ],
          );
        },
      ),
    );
  }
}

class ResultsFromDB extends StatelessWidget {
  final List<PuttingResult>? results;

  const ResultsFromDB(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    int dateInMillis = 0;
    var exceriseDateTime = "";
    int drillNo = 0;

    int criteria1 = 0;
    int criteria2 = 0;
    double successrate = 0;

    List<String> someLines = [];

    logger.d("Anzahl der Elemente ${results!.length}");

    for (var result in results!) {
      dateInMillis =
          DateTime.parse(result.dateOfPractice).millisecondsSinceEpoch;
      exceriseDateTime = DateFormat('MM/dd, hh:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(dateInMillis));
      drillNo = result.drillNo;
      criteria1 = result.selectedDistance;
    //  criteria2 = result.numberOfEfforts;

      successrate = result.successRate.roundToDouble();
      someLines.add(
          "$exceriseDateTime Drill $drillNo Criteria1 $criteria1 Criteria2 $criteria2 Erfolg $successrate");
    }

    return Column(
      children: <Widget>[
        for (var i in someLines)
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(i, style: const TextStyle(fontSize: 11)),
          ),
      ],
    );
  }
}
