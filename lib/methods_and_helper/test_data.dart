import 'dart:math';
import 'package:myapp/methods_and_helper/database_helper.dart';

List<PuttingResult> generateTestData(int count) {
  final random = Random();
  final List<PuttingResult> testData = [];

  for (int i = 0; i < count; i++) {
    final successRate = random.nextDouble();
    
    PuttingResult puttingResult = PuttingResult(
      drillNo: random.nextInt(2) + 1,
      criteria1: random.nextInt(2),
      criteria2: 0,
      criteria3: random.nextInt(9) + 1,
      success: random.nextDouble(),
      successRate: (successRate * 100),
      dateOfPractice: DateTime.now().subtract(Duration(days: random.nextInt(30))).toIso8601String(),
    );

    testData.add(puttingResult);
      
  }

  return testData;
}
