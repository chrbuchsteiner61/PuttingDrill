import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myapp/dev_area/test_screen.dart';
import 'package:myapp/methods_and_helper/drills_initial_value.dart';
//import 'package:myapp/methods_and_helper/initialize_drills.dart';

import 'package:myapp/user_areas/the_info_drawer.dart';
import 'package:myapp/methods_and_helper/language_helper.dart';
import 'package:myapp/ui_elements/drill_line.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/methods_and_helper/theme_data.dart';

import 'package:logger/logger.dart';

var logger = Logger();

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
  Locale _locale = const Locale('en');

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
        Locale('de'),
        Locale('fr'),
        Locale('es'),
        // Locale('it'),
        Locale('da'),
        // Locale('sv'),
      ],
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
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

    List<DrillsInitialValue> drillsInitials = initializeDrills();

    const String preParePics = "assets/pics/preparePics/thePreparePic";
    const String iconPath = "assets/pics/icons_page1/Drill";

    Text bottomText = Text(
      version,
      style: Theme.of(context).textTheme.bodyMedium,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations!.page1Header,
        ),
      ),
      drawer: const Drawer(child: TheInfoDrawer()),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/pics/page1_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int numberOfDrill = 1; numberOfDrill <= 5; numberOfDrill++)
                DrillLine(
                  // no 1
                  textForDrillLine: {
                    "inputAppBarText": localizations.inputAppBarText,
                    "inputButtonText": localizations.inputButtonText,
                    "preparationHeader": localizations.preparationHeader,
                    "countingHeader": localizations.countingHeader,
                    "errorInputMessageNonEmptyNegativ":
                        localizations.errorInputMessageNonEmptyNegativ,
                    "viewResults": localizations.viewResults,
                    "inputResults": localizations.inputResults,
                  },
                  drillPicture: "$iconPath$numberOfDrill.svg",
                  aPreparePic: "$preParePics$numberOfDrill.svg",
                  theClubLength: localizations.clubLength,
                  theButtonStyle: appsButtonStyle,
                  aDrill: drillsInitials[numberOfDrill - 1],
                  drillName:
                      localizations.getDrillTexts(numberOfDrill)["drill"]!,
                  thePurpose:
                      localizations.getDrillTexts(numberOfDrill)["purpose"]!,
                  aPreparationText: localizations
                      .getDrillTexts(numberOfDrill)["preparation"]!,
                  aCountingText:
                      localizations.getDrillTexts(numberOfDrill)["counting"]!,
                  aTask: localizations.getDrillTexts(numberOfDrill)["task"]!,
                  inputDrillCriteria1: localizations
                      .getDrillTexts(numberOfDrill)["inputDrillCriteria1"]!,
                  inputDrillCriteria2: localizations
                      .getDrillTexts(numberOfDrill)["inputDrillCriteria2"]!,
                  inputDrillCriteria3: localizations
                      .getDrillTexts(numberOfDrill)["inputDrillCriteria3"]!,
                  inputDrillInput1: localizations
                      .getDrillTexts(numberOfDrill)["inputDrillInput1"]!,
                  inputDrillInput2: localizations
                      .getDrillTexts(numberOfDrill)["inputDrillInput2"]!,
                  inputDrillInput3: localizations
                      .getDrillTexts(numberOfDrill)["inputDrillInput3"]!,
                ),

              // kill for production
              const SizedBox(width: 10.0, height: 40.0),
              SizedBox(
                width: 150.0,
                height: 45.0,
                child: ElevatedButton(
                  style: appsButtonStyle,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestScreen(),
                      ),
                    );
                  },
                  child: const Text('Manage Test Data'),
                ),
              ),
              //  const Text(version),
            ],
          ),
        ),
      ),
      bottomSheet: bottomText,
    );
  }
}

extension on AppLocalizations {
  Map<String, String> getDrillTexts(int numberOfDrill) {
    switch (numberOfDrill) {
      case 1:
        return {
          "drill": drillName1,
          "task": task1,
          "purpose": purpose1,
          "preparation": thePreparation_1,
          "counting": theExplainCounting_1,
          "inputDrillCriteria1": inputDrill1Criteria1,
          "inputDrillCriteria2": inputDrill1Criteria2,
          "inputDrillCriteria3": inputDrill1Criteria3,
          "inputDrillInput1": inputDrill1Input1,
          "inputDrillInput2": inputDrill1Input2,
          "inputDrillInput3": inputDrill1Input3,
        };
      case 2:
        return {
          "drill": drillName2,
          "task": task2,
          "purpose": purpose2,
          "preparation": thePreparation_2,
          "counting": theExplainCounting_2,
          "inputDrillCriteria1": inputDrill2Criteria1,
          "inputDrillCriteria2": inputDrill2Criteria2,
          "inputDrillCriteria3": inputDrill2Criteria3,
          "inputDrillInput1": inputDrill2Input1,
          "inputDrillInput2": inputDrill2Input2,
          "inputDrillInput3": inputDrill2Input3,
        };
      case 3:
        return {
          "drill": drillName3,
          "task": task3,
          "purpose": purpose3,
          "preparation": thePreparation_3,
          "counting": theExplainCounting_3,
          "inputDrillCriteria1": inputDrill3Criteria1,
          "inputDrillCriteria2": inputDrill3Criteria2,
          "inputDrillCriteria3": inputDrill3Criteria3,
          "inputDrillInput1": inputDrill3Input1,
          "inputDrillInput2": inputDrill3Input2,
          "inputDrillInput3": inputDrill3Input3,
        };
      case 4:
        return {
          "drill": drillName4,
          "task": task4,
          "purpose": purpose4,
          "preparation": thePreparation_4,
          "counting": theExplainCounting_4,
          "inputDrillCriteria1": inputDrill4Criteria1,
          "inputDrillCriteria2": inputDrill4Criteria2,
          "inputDrillCriteria3": inputDrill4Criteria3,
          "inputDrillInput1": inputDrill4Input1,
          "inputDrillInput2": inputDrill4Input2,
          "inputDrillInput3": inputDrill4Input3,
        };
      case 5:
        return {
          "drill": drillName5,
          "task": task1,
          "purpose": purpose5,
          "preparation": thePreparation_5,
          "counting": theExplainCounting_1,
          "inputDrillCriteria1": inputDrill5Criteria1,
          "inputDrillCriteria2": inputDrill5Criteria2,
          "inputDrillCriteria3": inputDrill5Criteria3,
          "inputDrillInput1": inputDrill5Input1,
          "inputDrillInput2": inputDrill5Input2,
          "inputDrillInput3": inputDrill5Input3,
        };
      default:
        return {
          "drill": error,
          "task": error,
          "purpose": error,
          "preparation": error,
          "counting": error,
          "inputDrillCriteria1": error,
          "inputDrillCriteria2": error,
          "inputDrillCriteria3": error,
          "inputDrillInput1": error,
          "inputDrillInput2": error,
          "inputDrillInput3": error,
        };
    }
  }
}

List<DrillsInitialValue> initializeDrills() {
  return [
    DrillsInitialValue(1, 0, 5, 5),
    DrillDistancePutt(2, 0, 5, 5),
    DrillsInitialValue(3, 0, 5, 5),
    DrillsInitialValue(4, 0, 5, 5),
    DrillsInitialValue(5, 0, 5, 5)
  ];
}
