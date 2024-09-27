import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class HistogramChart extends StatelessWidget {
  final List<ChartData> chartData;

  const HistogramChart({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.2,
        child: BarChart(
          BarChartData(
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
                    if (index >= 0 && index < chartData.length) {
                      return Text(
                        textAlign: TextAlign.center,
                        DateFormat('dd.MM.').format(chartData[index].date),
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
            barGroups: chartData.asMap().entries.map((entry) {
              final index = entry.key;
              final chartData = entry.value;

              return BarChartGroupData(
                x: index,
                barsSpace: 0.0,
                barRods: [
                  BarChartRodData(
                    toY: chartData.result,
                    color: Colors.blue,
                    width: chartData.attempts.toDouble() * 3.0,
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
    );
  }
}

class ChartData {
  final DateTime date;
  final int attempts;
  final double result;

  ChartData({required this.date, required this.attempts, required this.result});
}

// Usage example:
class AnotherChart extends StatelessWidget {
  const AnotherChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> data = [
      ChartData(date: DateTime(2024, 9, 19), attempts: 5, result: 60),
      ChartData(date: DateTime(2024, 9, 20), attempts: 3, result: 70),
      ChartData(date: DateTime(2024, 9, 21), attempts: 7, result: 89),
      ChartData(date: DateTime(2024, 9, 21), attempts: 5, result: 89),
      ChartData(date: DateTime(2024, 9, 22), attempts: 6, result: 59),
      ChartData(date: DateTime(2024, 9, 23), attempts: 5, result: 60),
      ChartData(date: DateTime(2024, 9, 24), attempts: 7, result: 34),
      ChartData(date: DateTime(2024, 9, 24), attempts: 4, result: 56),
      ChartData(date: DateTime(2024, 9, 25), attempts: 5, result: 67),
      ChartData(date: DateTime(2024, 9, 26), attempts: 5, result: 53),
      ChartData(date: DateTime(2024, 9, 27), attempts: 6, result: 56),
      ChartData(date: DateTime(2024, 9, 27), attempts: 4, result: 64),
      ChartData(date: DateTime(2024, 9, 24), attempts: 7, result: 34),
      ChartData(date: DateTime(2024, 9, 24), attempts: 4, result: 56),
      ChartData(date: DateTime(2024, 9, 25), attempts: 5, result: 67),
      ChartData(date: DateTime(2024, 9, 26), attempts: 5, result: 53),
      ChartData(date: DateTime(2024, 9, 27), attempts: 6, result: 56),
      ChartData(date: DateTime(2024, 9, 27), attempts: 4, result: 64),
      ChartData(date: DateTime(2024, 9, 27), attempts: 5, result: 64),
      ChartData(date: DateTime(2024, 9, 27), attempts: 4, result: 64),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Histogram Chart')),
      body: Center(
        child: HistogramChart(chartData: data),
      ),
    );
  }
}
