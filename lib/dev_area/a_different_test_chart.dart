import 'package:flutter/material.dart';
import '../methods_and_helper/database_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ADifferentTestChart extends StatelessWidget {
  final int aDrillNumber;
  final PuttingResult drillData;

  const ADifferentTestChart(
      {required this.aDrillNumber, required this.drillData, super.key});

  @override
  Widget build(BuildContext context) {
    dynamic results;

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
            return ChartFromDB(results: results, aDrillNumber: aDrillNumber);
          }),
    );
  }
}

class ChartFromDB extends StatelessWidget {
  final List<PuttingResult>? results;
  final int aDrillNumber;

  const ChartFromDB(
      {required this.results, required this.aDrillNumber, super.key});

  @override
  Widget build(BuildContext context) {
    logger.d("Anzahl der Elemente ${results!.length}");

    List<double> exerciseTime = [];
    List<double> exerciseTime2 = [];
    List<int> criteriaNo1 = [];
    List<double> successRate = [];
    double dateInMillis = 0.0;
    List<List<FlSpot>> xyPoints = [[], [], [], []];

    double justNow = DateTime.now().millisecondsSinceEpoch.toDouble();
    const double factorForDays = 1000 * 60 * 60 * 24;

    for (var result in results!) {
      logger.d("Drill Nr $aDrillNumber");
      if (result.drillNo == aDrillNumber) {
        dateInMillis = DateTime.parse(result.dateOfPractice)
            .millisecondsSinceEpoch
            .toDouble();
        exerciseTime.add(dateInMillis);
        exerciseTime2.add(((dateInMillis - justNow)) / factorForDays);
        criteriaNo1.add(result.selectedDistance);
        successRate.add(result.successRate);
      }
    }

    logger.d("Anzahl der Elemente ${exerciseTime.length}");

// Anpassung für den Test
    int lengthOfList = exerciseTime.length;
    exerciseTime.sort();

    for (int i = 0; i < lengthOfList; i++) {
      logger.d(criteriaNo1[i]);
      switch (criteriaNo1[i]) {
        case 1:
          xyPoints[1].add(FlSpot(exerciseTime2[i], successRate[i]));
        case 2:
          xyPoints[2].add(FlSpot(exerciseTime2[i], successRate[i]));
        case 3:
          xyPoints[3].add(FlSpot(exerciseTime2[i], successRate[i]));
        default:
          {}
      }
    }

    LineChartBarData xyValue1 = LineChartBarData(
      spots: xyPoints[1],
      isStepLineChart: false,
      isCurved: true,
      barWidth: 8.0,
      color: Colors.red,
      belowBarData: BarAreaData(show: false, color: Colors.red),
    );

    LineChartBarData xyValue2 = LineChartBarData(
      spots: xyPoints[2],
      isStepLineChart: false,
      isCurved: true,
      barWidth: 8.0,
      color: Colors.yellow,
      belowBarData: BarAreaData(show: false, color: Colors.yellow),
    );

    LineChartBarData xyValue3 = LineChartBarData(
      spots: xyPoints[3],
      isStepLineChart: false,
      isCurved: true,
      barWidth: 8.0,
      color: Colors.blue,
      belowBarData: BarAreaData(show: false, color: Colors.blue),
    );

    return LineChart(LineChartData(
      lineBarsData: [xyValue1, xyValue2, xyValue3],
      backgroundColor: Colors.white,
      minX: exerciseTime2.first,
      maxX: exerciseTime2.last,
      minY: 0.0,
      maxY: 100.0,
      gridData: const FlGridData(show: true),
    ));
  }
}
