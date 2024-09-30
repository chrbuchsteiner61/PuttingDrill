import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
import 'package:myapp/user_areas/results_screen/select_lines.dart';

class HistogramChart extends StatelessWidget {
  // final List<ChartData> chartData;
  final int aDrill;
  final List<PuttingResult> results;

  const HistogramChart(
      {super.key, required this.aDrill, required this.results});

  @override
  Widget build(BuildContext context) {
    List<List<PuttingResult>> drillResults = [];
    for (var result in results) {
      if (result.drillNo == aDrill) {
        drillResults[result.criteria3].add(result);
      }
    }

    return Column(children: [
      Row(children: [
        Text("Drill number: $aDrill"),
        const SelectLines(),
      ]),
      const SizedBox(height: 15.0),
      Expanded(
        child: AspectRatio(
          aspectRatio: 1.2,
          child: BarChart(
            BarChartData(
              barTouchData: BarTouchData(enabled: false),
              groupsSpace: 0.0,
              alignment: BarChartAlignment.spaceAround,
              maxY: 100,
              titlesData: FlTitlesData(
                show: true,
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                  drawBelowEverything: true,
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < results.length) {
                        return Text(
                          textAlign: TextAlign.center,
                          DateFormat('dd.MM.').format(DateTime.parse(
                              drillResults[1][index].dateOfPractice)),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 20,
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 35,
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                checkToShowHorizontalLine: (value) => value % 20 == 0,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    color: Colors.black12,
                    strokeWidth: 1,
                  );
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.black, width: 1),
              ),
              barGroups: drillResults.asMap().entries.map((entry) {
                final index = entry.key;
                final chartData = entry.value;

                return BarChartGroupData(
                  x: index,
                  barsSpace: 0.0,
                  barRods: [
                    BarChartRodData(
                      toY: chartData.successRate,
                      color: Colors.blue,
                      width: chartData.criteria3.toDouble(),
                      borderRadius: BorderRadius.circular(0),
                      gradient: const LinearGradient(
                        colors: [Colors.lightBlueAccent, Colors.blue],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    ]);
  }
}

class AnotherChart extends StatelessWidget {
  final int numberOfDrill;
  const AnotherChart({super.key, required this.numberOfDrill});

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
            return HistogramChart(results: results, aDrill: numberOfDrill);
          }),
    );
  }
}
