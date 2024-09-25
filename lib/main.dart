import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:myapp/dev_area/test_screen.dart';
import 'package:myapp/methods_and_helper/drills.dart';

import 'package:myapp/user_areas/the_info_drawer.dart';
import 'package:myapp/methods_and_helper/language_helper.dart';
import 'package:myapp/ui_elements/drill_line.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/methods_and_helper/theme_data.dart';

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
        // Locale('de'),
        // Locale('fr'),
        // Locale('es'),
        // Locale('it'),
        // Locale('da'),
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

    Drills drill1 = Drills(1, 0, 5, 5);
    Drills drill2 = DrillDistancePutt(2, 0, 5, 5);
    Drills drill3 = Drills(2, 0, 5, 5);
    Drills drill4 = Drills(4, 0, 5, 5);
    Drills drill5 = Drills(5, 0, 5, 5);

    const String preParePics = "asset/pics/preparePics/thePreparePic";
    const String iconPath = "asset/pics/icons_page1/Drill";

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
            image: AssetImage("asset/pics/page1_background.png"),
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
                drillPicture: "${iconPath}1.svg",
                aPreparationText: localizations.thePreparation_1,
                aCountingText: localizations.theExplainCounting_1,
                aPreparePic: "${preParePics}1.svg",
                theButtonStyle: appsButtonStyle,
                // no 1
                aTask: localizations.task1,
                inputDrillCriteria1: localizations.inputDrill1Criteria1,
                inputDrillCriteria2: localizations.inputDrill1Criteria2,
                inputDrillCriteria3: localizations.inputDrill1Criteria3,
                inputDrillInput1: localizations.inputDrill1Input1,
                inputDrillInput2: localizations.inputDrill1Input2,
                inputDrillInput3: localizations.inputDrill1Input3,
                aDrill: drill1,
              ),
              DrillLine(
                drillName: localizations.drillTwoName,
                thePurpose: localizations.purpose2,
                drillPicture: "${iconPath}2.svg",
                aPreparationText: localizations.thePreparation_2,
                aCountingText: localizations.theExplainCounting_2,
                aPreparePic: "${preParePics}2.svg",
                theButtonStyle: appsButtonStyle,
                // no 2
                aTask: localizations.task2,
                inputDrillCriteria1: localizations.inputDrill2Criteria1,
                inputDrillCriteria2: localizations.inputDrill2Criteria2,
                inputDrillCriteria3: localizations.inputDrill2Criteria3,
                inputDrillInput1: localizations.inputDrill2Input1,
                inputDrillInput2: localizations.inputDrill2Input2,
                inputDrillInput3: localizations.inputDrill2Input3,
                aDrill: drill2,
              ),
              DrillLine(
                drillName: localizations.drillThreeName,
                thePurpose: localizations.purpose3,
                drillPicture: "${iconPath}3.svg",
                aPreparationText: localizations.thePreparation_3,
                aCountingText: localizations.theExplainCounting_3,
                aPreparePic: "${preParePics}3.svg",
                theButtonStyle: appsButtonStyle,
                // no 3
                aTask: localizations.task3,
                inputDrillCriteria1: localizations.inputDrill3Criteria1,
                inputDrillCriteria2: localizations.inputDrill3Criteria2,
                inputDrillCriteria3: localizations.inputDrill3Criteria3,
                inputDrillInput1: localizations.inputDrill3Input1,
                inputDrillInput2: localizations.inputDrill3Input2,
                inputDrillInput3: localizations.inputDrill3Input3,
                aDrill: drill3,
              ),
              DrillLine(
                drillName: localizations.drillFourName,
                thePurpose: localizations.purpose4,
                drillPicture: "${iconPath}4.svg",
                aPreparationText: localizations.thePreparation_4,
                aCountingText: localizations.theExplainCounting_4,
                aPreparePic: "${preParePics}4.svg",
                theButtonStyle: appsButtonStyle,
                // no 4
                aTask: localizations.task4,
                inputDrillCriteria1: localizations.inputDrill4Criteria1,
                inputDrillCriteria2: localizations.inputDrill4Criteria2,
                inputDrillCriteria3: localizations.inputDrill4Criteria3,
                inputDrillInput1: localizations.inputDrill4Input1,
                inputDrillInput2: localizations.inputDrill4Input2,
                inputDrillInput3: localizations.inputDrill4Input3,
                aDrill: drill4,
              ),
              DrillLine(
                drillName: localizations.drillFiveName,
                thePurpose: localizations.purpose5,
                drillPicture: "${iconPath}5.svg",
                aPreparationText: localizations.thePreparation_5,
                aCountingText: localizations.theExplainCounting_5,
                aPreparePic: "${preParePics}5.svg",
                theButtonStyle: appsButtonStyle,
                // no 5
                aTask: localizations.task5,
                inputDrillCriteria1: localizations.inputDrill5Criteria1,
                inputDrillCriteria2: localizations.inputDrill5Criteria2,
                inputDrillCriteria3: localizations.inputDrill5Criteria3,
                inputDrillInput1: localizations.inputDrill5Input1,
                inputDrillInput2: localizations.inputDrill5Input2,
                inputDrillInput3: localizations.inputDrill5Input3,
                aDrill: drill5,
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
            ],
          ),
        ),
      ),
    );
  }
}
