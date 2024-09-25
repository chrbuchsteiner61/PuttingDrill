import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/user_areas/results_screen/get_results_data.dart';
import '../../methods_and_helper/database_helper.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ResultsScreen extends StatelessWidget {
  final int numberOfDrill;

  const ResultsScreen({super.key, required this.numberOfDrill});

  @override
  Widget build(BuildContext context) {
    dynamic results;
    return Scaffold(
      appBar: AppBar(title: const Text('Putting Results')),
      body: FutureBuilder<List<PuttingResult>>(
        future: DatabaseHelper().getResults(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading..."));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          results = snapshot.data;
          return ResultsChart(
            results: results,
            drillNo: numberOfDrill,
          );
        },
      ),
    );
  }
}

class ResultsChart extends StatelessWidget {
  final List<PuttingResult>? results;
  final int drillNo;

  const ResultsChart({required this.results, required this.drillNo, super.key});
  // const ResultsChart(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> pointsCriteria11 = [];
    List<FlSpot> pointsCriteria12 = [];
    List<FlSpot> pointsCriteria13 = [];

    int drillNo = 1;
    int criteria1 = 0;
    double successRate = 0.0;

    logger.d("Anzahl Ergebnisse  ${results!.length}");

    for (var result in results!) {
      if (result.drillNo == drillNo) {
        double dateInMillis = DateTime.parse(result.dateOfPractice)
            .millisecondsSinceEpoch
            .toDouble();
        criteria1 = result.criteria1;
        successRate = result.successRate;

        switch (criteria1) {
          case 1:
            pointsCriteria11.add(FlSpot(dateInMillis, successRate));
          case 2:
            pointsCriteria12.add(FlSpot(dateInMillis, successRate));
          case 3:
            pointsCriteria13.add(FlSpot(dateInMillis, successRate));
          default:
            {}
        }
      }
    }

    logger.d("Laenge 1 ${pointsCriteria11.length}");
    logger.d("Laenge 2 ${pointsCriteria12.length}");
    logger.d("Laenge 3 ${pointsCriteria13.length}");

    return Padding(
      padding: const EdgeInsets.all(36.0),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1.0,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 8.0,
                    child: Text(
                      DateFormat('dd.MM, hh:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(value.toInt())),
                      style: const TextStyle(color: Colors.black, fontSize: 8),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 8.0,
                    child: Text(
                      value.toInt().toString(),
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  );
                },
                reservedSize: 40,
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: getResultsData(
              pointsCriteria11, pointsCriteria12, pointsCriteria13),
        ),
      ),
    );
  }
}
