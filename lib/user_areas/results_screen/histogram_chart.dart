import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:myapp/ui_definition/constants.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
import 'package:myapp/user_areas/results_screen/select_lines.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class HistogramChart extends StatefulWidget {
  final int numberOfDifferentDistances;
  final List<int> theDistancesOfTheDrill;
  final String drillName;
  final List<List<PuttingResult>> drillResults;

  const HistogramChart({
    super.key,
    required this.numberOfDifferentDistances,
    required this.theDistancesOfTheDrill,
    required this.drillName,
    required this.drillResults,
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
    return Column(
      children: [
        Row(
          children: [
            spaceBetween,
            Text(widget.drillName),
            SelectLines(
              distancesToSelectFrom: const [1, 2, 3],
              onLineSelected: _updateSelectedLine,
              currentLine: selectedDrillLength,
            ),
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
                        if (index >= 0 && index < widget.drillResults.length) {
                          return Text(
                            DateFormat('dd.MM.').format(DateTime.parse(widget
                                .drillResults[selectedDrillLength][index]
                                .dateOfPractice)),
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
                barGroups: widget.drillResults[selectedDrillLength]
                    .asMap()
                    .entries
                    .map((entry) {
                  final index = entry.key;
                  logger.d(index);
                  final chartData = entry.value;
                  logger.d(entry.value.successRate);

                  return BarChartGroupData(
                    x: index,
                    barsSpace: 0.0,
                    barRods: [
                      BarChartRodData(
                        toY: chartData.successRate,
                        color: barColors[selectedDrillLength],
                        width: chartData.numberOfEfforts.toDouble(),
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
