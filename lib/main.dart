import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:myapp/user_areas/the_info_drawer.dart';
import 'package:myapp/methods_and_helper/language_helper.dart';
import 'package:myapp/ui_elements/drill_line.dart';
import 'package:myapp/methods_and_helper/constants.dart';

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
                thePurpose: localizations.purpose1,
                drillPicture: "asset/pics/Symbol_Drill1.png",
                aPreparationText: localizations.thePreparation_1,
                aCountingText: localizations.theExplainCounting_1,
                aPreparePicName: "asset/pics/thePreparePic1.jpg",
                anExercisePicName: "asset/pics/theExercisePic1.png",
                theButtonStyle: appsButtonStyle,
                buttonInputResultsText: localizations.inputResults,
                buttonViewResultsText: localizations.viewResults,
                // for screens of drills
                inputAppBarText: localizations.inputAppBarText,
                inputButtonText: localizations.inputButtonText,
                // no 1
                inputDrillCriteria1: localizations.inputDrill1Criteria1,
                inputDrillCriteria2: localizations.inputDrill1Criteria2,
                inputDrillCriteria3: localizations.inputDrill1Criteria3,

                inputDrillInput1: localizations.inputDrill1Input1,
                inputDrillInput2: localizations.inputDrill1Input2,
                inputDrillInput3: localizations.inputDrill1Input3,
              ),
              DrillLine(
                drillName: localizations.drillTwoName,
                thePurpose: localizations.purpose2,
                drillPicture: "asset/pics/Symbol_Drill2.png",
                aPreparationText: localizations.thePreparation_2,
                aCountingText: localizations.theExplainCounting_2,
                aPreparePicName: "asset/pics/thePreparePic2.jpg",
                anExercisePicName: "asset/pics/theExercisePic2.png",
                theButtonStyle: appsButtonStyle,
                buttonInputResultsText: localizations.inputResults,
                buttonViewResultsText: localizations.viewResults,
                // for screens of drills
                inputAppBarText: localizations.inputAppBarText,
                inputButtonText: localizations.inputButtonText,
                // no 2
                inputDrillCriteria1: localizations.inputDrill2Criteria1,
                inputDrillCriteria2: localizations.inputDrill2Criteria2,
                inputDrillCriteria3: localizations.inputDrill2Criteria3,

                inputDrillInput1: localizations.inputDrill2Input1,
                inputDrillInput2: localizations.inputDrill2Input2,
                inputDrillInput3: localizations.inputDrill2Input3,
              ),
              DrillLine(
                drillName: localizations.drillThreeName,
                thePurpose: localizations.purpose3,
                drillPicture: "asset/pics/Symbol_Drill3.png",
                aPreparationText: localizations.thePreparation_3,
                aCountingText: localizations.theExplainCounting_3,
                aPreparePicName: "asset/pics/thePreparePic3.jpg",
                anExercisePicName: "asset/pics/theExercisePic3.png",
                theButtonStyle: appsButtonStyle,
                buttonInputResultsText: localizations.inputResults,
                buttonViewResultsText: localizations.viewResults,
                // for screens of drills
                inputAppBarText: localizations.inputAppBarText,
                inputButtonText: localizations.inputButtonText,
                // no 3
                inputDrillCriteria1: localizations.inputDrill3Criteria1,
                inputDrillCriteria2: localizations.inputDrill3Criteria2,
                inputDrillCriteria3: localizations.inputDrill3Criteria3,

                inputDrillInput1: localizations.inputDrill3Input1,
                inputDrillInput2: localizations.inputDrill3Input2,
                inputDrillInput3: localizations.inputDrill3Input3,
              ),
              DrillLine(
                drillName: localizations.drillFourName,
                thePurpose: localizations.purpose4,
                drillPicture: "asset/pics/Symbol_Drill4.png",
                aPreparationText: localizations.thePreparation_4,
                aCountingText: localizations.theExplainCounting_4,
                aPreparePicName: "asset/pics/thePreparePic4.jpg",
                anExercisePicName: "asset/pics/theExercisePic4.png",
                theButtonStyle: appsButtonStyle,
                buttonInputResultsText: localizations.inputResults,
                buttonViewResultsText: localizations.viewResults,
                // for screens of drills
                inputAppBarText: localizations.inputAppBarText,
                inputButtonText: localizations.inputButtonText,
                // no 4
                inputDrillCriteria1: localizations.inputDrill4Criteria1,
                inputDrillCriteria2: localizations.inputDrill4Criteria2,
                inputDrillCriteria3: localizations.inputDrill4Criteria3,

                inputDrillInput1: localizations.inputDrill4Input1,
                inputDrillInput2: localizations.inputDrill4Input2,
                inputDrillInput3: localizations.inputDrill4Input3,
              ),
              DrillLine(
                drillName: localizations.drillFiveName,
                thePurpose: localizations.purpose5,
                drillPicture: "asset/pics/Symbol_Drill5.png",
                aPreparationText: localizations.thePreparation_5,
                aCountingText: localizations.theExplainCounting_5,
                aPreparePicName: "asset/pics/thePreparePic5.jpg",
                anExercisePicName: "asset/pics/theExercisePic5.png",
                theButtonStyle: appsButtonStyle,
                buttonInputResultsText: localizations.inputResults,
                buttonViewResultsText: localizations.viewResults,
                // for screens of drills
                inputAppBarText: localizations.inputAppBarText,
                inputButtonText: localizations.inputButtonText,
                // no 5
                inputDrillCriteria1: localizations.inputDrill5Criteria1,
                inputDrillCriteria2: localizations.inputDrill5Criteria2,
                inputDrillCriteria3: localizations.inputDrill5Criteria3,

                inputDrillInput1: localizations.inputDrill5Input1,
                inputDrillInput2: localizations.inputDrill5Input2,
                inputDrillInput3: localizations.inputDrill5Input3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
