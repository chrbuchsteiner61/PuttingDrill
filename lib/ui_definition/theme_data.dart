import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get data {
    // Define light theme colors, fonts, etc.
    return ThemeData(
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.transparent,
          elevation: 1.0,
          centerTitle: false,
          color: Colors.green,
          titleTextStyle: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 208, 243, 218),
        primarySwatch: Colors.lightBlue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
          secondary: Colors.white,
        ),
        fontFamily: 'Noto',
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: 'Noto-Sans'),
          bodyMedium: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: 'Noto-Sans'),
          bodySmall: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: 'Noto-Sans'),
          headlineLarge: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
          titleLarge: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              color: Colors.black),
          titleMedium: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.black),
        ),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.lightBlue));
  }
}
