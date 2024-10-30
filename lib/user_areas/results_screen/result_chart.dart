import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
import 'package:myapp/user_areas/results_screen/select_lines.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class HistogramChart extends StatefulWidget {
  final int drillNumber;
  final String drillName;
  final List<PuttingResult> results;
  final String drillInputLength;

  const HistogramChart({
    super.key,
    required this.drillNumber,
    required this.drillName,
    required this.results,
    required this.drillInputLength,
  });

  @override
  State<HistogramChart> createState() => _HistogramChartState();
}

class _HistogramChartState extends State<HistogramChart> {
  int selectedDrillLength = 0;

  void _updateSelectedLine(int newLine) {
    setState(() {
      selectedDrillLength = newLine;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Color> barColors = [
      Colors.yellow,
      Colors.red,
      Colors.blue,
    ];

    List<List<PuttingResult>> drillResults = [[], [], []];
    for (var result in widget.results) {
      if (result.drillNo == widget.drillNumber) {
        logger.d(result.criteria1);
        drillResults[result.criteria1 - 1].add(result);
      }
    }

    return Column(
      children: [
        Row(
          children: [
            spaceBetween,
            Text(widget.drillName),
            SelectLines(
              strokes: const [1, 2, 3],
              onLineSelected: _updateSelectedLine,
              currentLine: selectedDrillLength,
            ),
            spaceBetween,
            Text(widget.drillInputLength),
          ],
        ),
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
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    drawBelowEverything: true,
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < widget.results.length) {
                          return Text(
                            DateFormat('dd.MM.').format(DateTime.parse(
                                drillResults[selectedDrillLength][index].dateOfPractice)),
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
                    sideTitles: SideTitles(showTitles: false, reservedSize: 35),
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
                barGroups: drillResults[selectedDrillLength].asMap().entries.map((entry) {
                  final index = entry.key;
                  final chartData = entry.value;

                  return BarChartGroupData(
                    x: index,
                    barsSpace: 0.0,
                    barRods: [
                      BarChartRodData(
                        toY: chartData.successRate,
                        color: barColors[selectedDrillLength],
                        width: chartData.criteria3.toDouble(),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ResultChart extends StatelessWidget {
  final int drillNumber;
  final String drillName;
  final String drillInputLength;

  const ResultChart({
    super.key,
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
          return HistogramChart(
            results: results,
            drillNumber: drillNumber,
            drillName: drillName,
            drillInputLength: drillInputLength,
          );
        },
      ),
    );
  }
}