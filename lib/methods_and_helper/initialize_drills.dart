import 'package:myapp/methods_and_helper/drills_standard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<DrillStandard> initializeDrills() {
  return [
    DrillStandard(1, 0, 5, 5),
    DrillDistancePutt(2, 0, 5, 5),
    DrillStandard(3, 0, 5, 5),
    DrillStandard(4, 0, 5, 5),
    DrillStandard(5, 0, 5, 5)
  ];
}

Map<String, String> getTextsForDrillLine(AppLocalizations? localizations) {
  return {
    "inputAppBarText": localizations!.inputAppBarText,
    "inputButtonText": localizations.inputButtonText,
    "errorInputMessageNonEmptyNegativ":
        localizations.errorInputMessageNonEmptyNegativ,
    "viewResults": localizations.viewResults,
  };
}

List<Map<String, String>> getTranslatedTexts(AppLocalizations? localizations) {
  List<Map<String, String>> translatedDrillTexts = [{}, {}, {}, {}, {}];
// Drill 1

  translatedDrillTexts[0] = ({
    "drillName": localizations!.drillName1,
    "thePurpose": localizations.purpose1,
    "aPreparationText": localizations.thePreparation_1,
    "aCountingText": localizations.theExplainCounting_1,
    "aTask": localizations.task1,
    "inputDrillCriteria1": localizations.inputDrill1Criteria1,
    "inputDrillCriteria2": localizations.inputDrill1Criteria2,
    "inputDrillCriteria3": localizations.inputDrill1Criteria3,
    "inputDrillInput1": localizations.inputDrill1Input1,
    "inputDrillInput2": localizations.inputDrill1Input2,
    "inputDrillInput3": localizations.inputDrill1Input3
  });
// Drill 2
  translatedDrillTexts[1] = ({
    "drillName": localizations.drillName2,
    "thePurpose": localizations.purpose2,
    "aPreparationText": localizations.thePreparation_2,
    "aCountingText": localizations.theExplainCounting_2,
    "aTask": localizations.task2,
    "inputDrillCriteria1": localizations.inputDrill2Criteria1,
    "inputDrillCriteria2": localizations.inputDrill2Criteria2,
    "inputDrillCriteria3": localizations.inputDrill2Criteria3,
    "inputDrillInput1": localizations.inputDrill2Input1,
    "inputDrillInput2": localizations.inputDrill2Input2,
    "inputDrillInput3": localizations.inputDrill2Input3
  });
  // Drill 3
  translatedDrillTexts[2] = ({
    "drillName": localizations.drillName3,
    "thePurpose": localizations.purpose3,
    "aPreparationText": localizations.thePreparation_3,
    "aCountingText": localizations.theExplainCounting_3,
    "aTask": localizations.task3,
    "inputDrillCriteria1": localizations.inputDrill3Criteria1,
    "inputDrillCriteria2": localizations.inputDrill3Criteria2,
    "inputDrillCriteria3": localizations.inputDrill3Criteria3,
    "inputDrillInput1": localizations.inputDrill3Input1,
    "inputDrillInput2": localizations.inputDrill3Input2,
    "inputDrillInput3": localizations.inputDrill3Input3
  });
  // Drill 4
  translatedDrillTexts[3] = ({
    "drillName": localizations.drillName4,
    "thePurpose": localizations.purpose4,
    "aPreparationText": localizations.thePreparation_4,
    "aCountingText": localizations.theExplainCounting_4,
    "aTask": localizations.task4,
    "inputDrillCriteria1": localizations.inputDrill4Criteria1,
    "inputDrillCriteria2": localizations.inputDrill4Criteria2,
    "inputDrillCriteria3": localizations.inputDrill4Criteria3,
    "inputDrillInput1": localizations.inputDrill4Input1,
    "inputDrillInput2": localizations.inputDrill4Input2,
    "inputDrillInput3": localizations.inputDrill4Input3
  });
  // Drill 5
  translatedDrillTexts[4] = ({
    "drillName": localizations.drillName5,
    "thePurpose": localizations.purpose5,
    "aPreparationText": localizations.thePreparation_5,
    "aCountingText": localizations.theExplainCounting_5,
    "aTask": localizations.task5,
    "inputDrillCriteria1": localizations.inputDrill5Criteria1,
    "inputDrillCriteria2": localizations.inputDrill5Criteria2,
    "inputDrillCriteria3": localizations.inputDrill5Criteria3,
    "inputDrillInput1": localizations.inputDrill5Input1,
    "inputDrillInput2": localizations.inputDrill5Input2,
    "inputDrillInput3": localizations.inputDrill5Input3
  });

  return translatedDrillTexts;
}
