import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

getResultsData(
    List<FlSpot> points1, List<FlSpot> points2, List<FlSpot> points3) {
  double lineWidth = 3;

  return [
    LineChartBarData(
      spots: points1,
      isStepLineChart: true,
      barWidth: lineWidth,
      color: Colors.yellow,
      belowBarData: BarAreaData(show: false),
    ),
    LineChartBarData(
      spots: points2,
      isStepLineChart: true,
      //isCurved: true,
      barWidth: lineWidth,
      color: Colors.red,
      belowBarData: BarAreaData(show: false),
    ),
    LineChartBarData(
      spots: points3,
      isStepLineChart: true,
      //isCurved: true,
      barWidth: lineWidth,
      color: Colors.blue,
      belowBarData: BarAreaData(show: false),
    ),
  ];
}
