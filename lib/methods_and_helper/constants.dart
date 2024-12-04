import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

//String formattedDateNow = DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now());

String version = '0.923 / 04.12.204, 12:05';

const infoDrawerBackgroundColor = Colors.lightBlue;

const SizedBox spaceBetween = SizedBox(width: 8);
const SizedBox spaceAfter = SizedBox(height: 16);
const double theMargin = 8.0;
const double thePadding = 6.0;
const BorderRadius theBorderRadius = BorderRadius.all(Radius.circular(6.0));
const double theElevation = 10.0;

const ButtonStyle appsButtonStyle = ButtonStyle(
  padding: WidgetStatePropertyAll(EdgeInsets.all(thePadding)),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: theBorderRadius,
      side: BorderSide(color: Colors.white, width: 3),
    ),
  ),
  backgroundColor: WidgetStatePropertyAll(Colors.green),
  foregroundColor: WidgetStatePropertyAll(Colors.white),
  elevation: WidgetStatePropertyAll(theElevation),
  textStyle: WidgetStatePropertyAll(
    TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
  ),
);

class ParameterForChart {
  final String drillName;
  final int drillNumber;
  final String drillInputLength;

  ParameterForChart(
      {required this.drillName,
      required this.drillNumber,
      required this.drillInputLength});
}

const List<Color> barColors = [
  Colors.yellow,
  Colors.red,
  Colors.blue,
];

// Data class for input-related properties
class DrillInputData {
  final String criteria1;
  final String criteria2;
  final String criteria3;
  final String input1;
  final String input2;
  final String input3;

  const DrillInputData({
    required this.criteria1,
    required this.criteria2,
    required this.criteria3,
    required this.input1,
    required this.input2,
    required this.input3,
  });
}
