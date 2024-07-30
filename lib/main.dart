import 'package:flutter/material.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myapp/methods_and_helper/language_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'ui_elements/drill_line.dart';

void main() => runApp(const PuttingDrillApp());

class PuttingDrillApp extends StatefulWidget {
  const PuttingDrillApp({super.key});

  @override
  PuttingDrillAppState createState() => PuttingDrillAppState();

  // Define the 'of' method
  static PuttingDrillAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<PuttingDrillAppState>();
  }
}

class PuttingDrillAppState extends State<PuttingDrillApp> {
  LanguageService languageService = LanguageService();
  Locale _locale = const Locale('es');

  Future<void> initialLocale() async {
    String? aLanguageKey = await languageService.loadLanguage();
    setState(() {
      _locale = Locale(aLanguageKey ?? 'de');
    });
  }

  void setLocale(String locale) {
    setState(() {
      _locale = Locale(locale);
    });
  }

  Locale get currentLocale => _locale;

  @override
  Widget build(BuildContext context) {
    initialLocale();
    return MaterialApp(
      title: 'Putting Drill Diary',
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        // Locale('de'),
        // Locale('fr'),
        // Locale('es'),
        // Locale('it'),
        // Locale('da'),
        // Locale('sv'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: 'Noto-Sans'),
          bodyMedium: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: 'Noto-Sans'),
          headlineLarge: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
          headlineMedium: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
          titleLarge: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.black54),
          titleMedium: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.black54),
        ),
      ),
      home: const StartingPage(),
      locale: _locale,
    );
  }
}

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final String localizedTitle = localizations!.page1Header;
    return Scaffold(
      appBar: AppBar(title: Text(localizedTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DrillLine(
                drillName: localizations.drillOneName,
                drillPicture: "asset/pics/Drill1.png"),
            DrillLine(
                drillName: localizations.drillTwoName,
                drillPicture: "asset/pics/Drill2.png"),
            DrillLine(
                drillName: localizations.drillThreeName,
                drillPicture: "asset/pics/Drill.3png"),
            DrillLine(
                drillName: localizations.drillFourName,
                drillPicture: "asset/pics/Drill4.png"),
            DrillLine(
                drillName: localizations.drillFiveName,
                drillPicture: "asset/pics/Drill5.png"),
          ],
        ),
      ),
    );
  }
}
