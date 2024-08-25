import 'package:flutter/material.dart';

const String version = '0.80/ 21.08.2024';

const infoDrawerBackgroundColor = Colors.lightBlueAccent;

const SizedBox spaceBetween = SizedBox(width: 16);

const double thePadding = 8.0;

ButtonStyle appsButtonStyle = const ButtonStyle(
  padding: WidgetStatePropertyAll(EdgeInsets.all(thePadding)),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
      side: BorderSide(color: Colors.white, width: 2),
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
