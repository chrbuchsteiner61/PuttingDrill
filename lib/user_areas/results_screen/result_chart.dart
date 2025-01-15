import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
import 'package:logger/logger.dart';
import 'package:myapp/user_areas/results_screen/histogram_chart.dart';

import 'package:myapp/main.dart';

var logger = Logger();

class ResultChart extends StatelessWidget {
  final DrillList initializedDrills;
  final int drillNumber;
  final String drillName;
  final String drillInputLength;
  final String numberOfResultsText;

  const ResultChart({
    super.key,
    required this.initializedDrills,
    required this.drillNumber,
    required this.drillInputLength,
    required this.drillName,
    required this.numberOfResultsText,
  });

  int findDistanceIndex(int distance, List<int> theDistanceOfTheDrill) {
    return theDistanceOfTheDrill.indexOf(distance);
  }

  @override
  Widget build(BuildContext context) {
    const maximumNumberOfResultsPerDistance = 30;

    return Scaffold(
      appBar: AppBar(title: const Text('Putting Results')),
      body: FutureBuilder<List<PuttingResult>>(
          future: DatabaseHelper().getResults(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Connection is waiting'));
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No results found.'));
            }

            final results = snapshot.data!;

            final int numberOfDifferentDistances =
                initializedDrills[drillNumber - 1].howManyDistancesOfADrill();

            final List<int> theDistancesOfTheDrill =
                initializedDrills[drillNumber - 1].distances;

            List<List<PuttingResult>> resultsOfADrill = [[]];
            for (int i = 1; i < numberOfDifferentDistances; i++) {
              resultsOfADrill.add([]);
            }

            for (var result in results) {
              if (result.drillNo == drillNumber) {
                int indexOfDistance = findDistanceIndex(
                    result.selectedDistance, theDistancesOfTheDrill);
                resultsOfADrill[indexOfDistance].add(result);
              }
            }

            // deliver max number of results per distance to the chart
            List<PuttingResult> distanceList = [];
            for (int i = 0; i < resultsOfADrill[i].length; i++) {
              distanceList = resultsOfADrill[i];
              if (distanceList.length > maximumNumberOfResultsPerDistance) {
                resultsOfADrill[i] = distanceList.sublist(
                    distanceList.length - maximumNumberOfResultsPerDistance);
                logger.d("i " + i.toString());
                logger.d(distanceList);
              }
            }
            return HistogramChart(
              numberOfDifferentDistances: numberOfDifferentDistances,
              theDistancesOfTheDrill: theDistancesOfTheDrill,
              drillResults: resultsOfADrill,
              drillName: drillName,
              numberOfResultsText: numberOfResultsText,
            );
          }),
    );
  }
}
