import 'dart:math';
import 'package:myapp/methods_and_helper/database_helper.dart';

List<PuttingResult> generateTestData(int count) {
  final random = Random();
  final List<PuttingResult> testData = [];

  List<String> ofDates = [];

  for (int i = 0; i < count; i++) {
    ofDates.add(DateTime.now()
        .subtract(Duration(days: random.nextInt(30)))
        .toIso8601String());
  }

  ofDates.sort();

  for (int i = 0; i < count; i++) {
    final successRate = random.nextDouble();

    PuttingResult puttingResult = PuttingResult(
      drillNo: random.nextInt(4) + 1,
      selectedDistance: random.nextInt(3) + 1,
      numberOfEfforts: random.nextInt(9) + 1,
      successRate: (successRate * 100),
      dateOfPractice: ofDates[i],
    );

    testData.add(puttingResult);
  }

  return testData;
}
