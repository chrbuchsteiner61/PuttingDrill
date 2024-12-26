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

  const ResultChart({
    super.key,
    required this.initializedDrills,
    required this.drillNumber,
    required this.drillInputLength,
    required this.drillName,
  });

  @override
  Widget build(BuildContext context) {
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

          List<List<PuttingResult>> resultsOfADrill = [[], [], []];
          for (var result in results) {
            if (result.drillNo == drillNumber) {
              // für 15m wird das 14.Array gesucht, was es nicht gibt
              resultsOfADrill[result.selectedDistance - 1].add(result);
            }
          }

          return HistogramChart(
            drillResults: resultsOfADrill,
            drillName: drillName,
          );
        },
      ),
    );
  }
}
