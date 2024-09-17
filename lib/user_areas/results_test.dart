import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../methods_and_helper/database_helper.dart';

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
            return const Center(child: CircularProgressIndicator());
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
    double success = 0;
    int criteria1 = 0;
    int criteria2 = 0;
    //int criteria3 = 0;
    double successrate = 0;

    List<String> someLines = [];

    for (var result in results!) {
      dateInMillis =
          DateTime.parse(result.dateOfPractice).millisecondsSinceEpoch;
      exceriseDateTime = DateFormat('MM/dd/yyyy, hh:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(dateInMillis));
      drillNo = result.drillNo;
      criteria1 = result.criteria1;
      criteria2 = result.criteria2;
     // criteria3 = result.criteria3;
      success = result.success;
      successrate = result.successRate;
      someLines.add(
          "$exceriseDateTime\n$drillNo\n$criteria1\n$criteria2\n$success\n$successrate");
    }

    return Column(
      children: <Widget>[
        for (var i in someLines)
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Text(i),
          ),
      ],
    );
  }
}
