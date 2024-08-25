import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:myapp/user_areas/the_info_drawer.dart';
import 'package:myapp/methods_and_helper/language_helper.dart';
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
        scaffoldBackgroundColor: const Color.fromARGB(255, 208, 243, 218),
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
              fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations!.page1Header,
          style: Theme.of(context).textTheme.headlineLarge!,
        ),
        backgroundColor: Colors.green,
      ),
      drawer: const TheInfoDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("asset/pics/putting_green.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DrillLine(
                  drillName: localizations.drillOneName,
                  drillPicture: "asset/pics/Symbol_Drill1.png",
                  aPreparationText: localizations.thePreparation_1,
                  aCountingText: localizations.theExplainCounting_1,
                  aPreparePicName: "asset/pics/thePreparePic1.jpg",
                  anExercisePicName: "asset/pics/theExercisePic1.png"),
              DrillLine(
                  drillName: localizations.drillTwoName,
                  drillPicture: "asset/pics/Symbol_Drill2.png",
                  aPreparationText: localizations.thePreparation_2,
                  aCountingText: localizations.theExplainCounting_2,
                  aPreparePicName: "asset/pics/thePreparePic2.jpg",
                  anExercisePicName: "asset/pics/theExercisePic2.png"),
              DrillLine(
                  drillName: localizations.drillThreeName,
                  drillPicture: "asset/pics/Symbol_Drill3.png",
                  aPreparationText: localizations.thePreparation_3,
                  aCountingText: localizations.theExplainCounting_3,
                  aPreparePicName: "asset/pics/thePreparePic3.jpg",
                  anExercisePicName: "asset/pics/theExercisePic3.png"),
              DrillLine(
                  drillName: localizations.drillFourName,
                  drillPicture: "asset/pics/Symbol_Drill4.png",
                  aPreparationText: localizations.thePreparation_4,
                  aCountingText: localizations.theExplainCounting_4,
                  aPreparePicName: "asset/pics/thePreparePic4.jpg",
                  anExercisePicName: "asset/pics/theExercisePic4.png"),
              DrillLine(
                  drillName: localizations.drillFiveName,
                  drillPicture: "asset/pics/Symbol_Drill5.png",
                  aPreparationText: localizations.thePreparation_5,
                  aCountingText: localizations.theExplainCounting_5,
                  aPreparePicName: "asset/pics/thePreparePic5.jpg",
                  anExercisePicName: "asset/pics/theExercisePic5.png"),
            ],
          ),
        ),
      ),
    );
  }
}
