import 'package:flutter/material.dart';

const String version = '0.911/ 16.10.2024, 14:20';

const infoDrawerBackgroundColor = Colors.lightBlue;

const SizedBox spaceBetween = SizedBox(width: 8);
const SizedBox spaceAfter = SizedBox(height: 16);
const double theMargin = 8.0;
const double thePadding = 6.0;
const BorderRadius theBorderRadius = BorderRadius.all(Radius.circular(6.0));
const double theElevation = 10.0;

ButtonStyle appsButtonStyle = const ButtonStyle(
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
