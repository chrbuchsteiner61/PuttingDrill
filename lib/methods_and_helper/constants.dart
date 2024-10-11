import 'package:flutter/material.dart';

const String version = '0.90/ 11.10.2024, 12:15';

const infoDrawerBackgroundColor = Colors.lightBlue;

const SizedBox spaceBetween = SizedBox(width: 8);
const SizedBox spaceAfter = SizedBox(height: 16);
const double theMargin = 8.0;
const double thePadding = 6.0;
const BorderRadius theBorderRadius = BorderRadius.all(Radius.circular(6.0));

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
  textStyle: WidgetStatePropertyAll(
    TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
);
