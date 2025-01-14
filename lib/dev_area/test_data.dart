import 'dart:math';
import 'package:myapp/methods_and_helper/database_helper.dart';

List<PuttingResult> generateTestData(int count) {
  final random = Random();
  final List<PuttingResult> testData = [];

  List<String> ofDates = [];

  for (int i = 0; i < count; i++) {
    ofDates.add(DateTime.now()
        .subtract(Duration(days: random.nextInt(1000)))
        .toIso8601String());
  }

  ofDates.sort();

  for (int i = 0; i < count; i++) {
    final successRate = random.nextDouble();
    int aDrillNo = random.nextInt(4) + 1;
    int aSelectedDistance = random.nextInt(4) + 1;

    List<int> distancesOfDrillTwo = [6, 9, 12, 15];
    if (aDrillNo == 2) {
      aSelectedDistance = distancesOfDrillTwo[random.nextInt(3)+1];
    }

    PuttingResult puttingResult = PuttingResult(
      drillNo: aDrillNo,
      selectedDistance: aSelectedDistance,
      numberOfEfforts: random.nextInt(9) + 1,
      successRate: (successRate * 100),
      dateOfPractice: ofDates[i],
    );

    testData.add(puttingResult);
  }

  return testData;
}
