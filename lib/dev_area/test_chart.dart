import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import '../methods_and_helper/database_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class TestChart extends StatelessWidget {
  final int aDrill;
  const TestChart({required this.aDrill, super.key});

  @override
  Widget build(BuildContext context) {
    dynamic results;
    //int aDrill = 1;
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
            results = snapshot.data;
            // Expanded(child: ChartFromDB(results: results, aDrill: aDrill));
            return ChartFromDB(results: results, aDrill: aDrill);
          }),
    );
  }
}

class ChartFromDB extends StatelessWidget {
  final List<PuttingResult>? results;
  final int aDrill;

  const ChartFromDB({required this.results, required this.aDrill, super.key});

  @override
  Widget build(BuildContext context) {
    logger.d("Anzahl der Elemente ${results!.length}");

    List<double> exerciseTime = [];
    double logExerciseTime = 0;
    double deltaExerciseTime = 0.0;
    List<double> successRate = [];
    double dateInMillis = 0.0;
    List<FlSpot> xyPoints = [];

    for (var result in results!) {
      logger.d("Drill Nr $aDrill");
      if (result.drillNo == aDrill) {
        dateInMillis = DateTime.parse(result.dateOfPractice)
            .millisecondsSinceEpoch
            .toDouble();
        exerciseTime.add(dateInMillis);
        successRate.add(result.successRate);
      }
    }

    logger.d("Anzahl der Elemente ${exerciseTime.length}");

// Anpassung für den Test
    int lengthOfList = exerciseTime.length;
    exerciseTime.sort();
    deltaExerciseTime = exerciseTime.last - exerciseTime.first;

    for (int i = 0; i < lengthOfList; i++) {
      logExerciseTime = exerciseTime.last *
          (1 - log((exerciseTime.last - exerciseTime[i]) / deltaExerciseTime));
     
logger.d("logExerciseTime ${logExerciseTime}");

      xyPoints.add(FlSpot(logExerciseTime, successRate[i]));
    }

    LineChartBarData xyValue = LineChartBarData(
      spots: xyPoints,
      isStepLineChart: false,
      isCurved: true,
      barWidth: 2.0,
      color: Colors.yellow,
      belowBarData: BarAreaData(show: false),
    );

    return LineChart(LineChartData(
      lineBarsData: [xyValue],
      backgroundColor: Colors.white,
      minX: exerciseTime.first,
      maxX: exerciseTime.last,
      minY: 0.0,
      maxY: 100.0,
      gridData: const FlGridData(show: true),
    ));
  }
}
