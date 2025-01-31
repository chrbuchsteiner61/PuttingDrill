import 'package:flutter/material.dart';
import 'package:myapp/user_areas/results_screen/result_chart.dart';

import 'package:myapp/dev_area/results_test.dart';
import 'package:myapp/dev_area/a_different_test_chart.dart';
import 'package:myapp/dev_area/test_chart.dart';
import 'package:myapp/dev_area/test_data.dart';
import 'package:myapp/ui_definition/constants.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
import 'package:myapp/main.dart';

class TestScreen extends StatelessWidget {
  final DrillList initializedDrills;

  const TestScreen({super.key, required this.initializedDrills});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('This is a test screen.'),
            SizedBox(
              width: 150.0,
              height: 45.0,
              child: ElevatedButton(
                style: appsButtonStyle,
                onPressed: () async {
                  List<PuttingResult> resultsForTest = generateTestData(5000);
                  for (var result in resultsForTest) {
                    await DatabaseHelper().insertResult(result);
                  }
                },
                child: const Text('Add Test Data'),
              ),
            ),
            spaceBetween,
            SizedBox(
              width: 150.0,
              height: 45.0,
              child: ElevatedButton(
                style: appsButtonStyle,
                onPressed: () async {
                  DatabaseHelper().deleteDB();
                },
                child: const Text('Delete Database'),
              ),
            ),
            spaceBetween,
            SizedBox(
              width: 150.0,
              height: 45.0,
              child: ElevatedButton(
                style: appsButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultsTest(),
                    ),
                  );
                },
                child: const Text('Show Database'),
              ),
            ),
            spaceBetween,
            SizedBox(
              width: 150.0,
              height: 45.0,
              child: ElevatedButton(
                style: appsButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TestChart(aDrill: 1),
                    ),
                  );
                },
                child: const Text('Show chart'),
              ),
            ),
            spaceBetween,
            SizedBox(
              width: 150.0,
              height: 45.0,
              child: ElevatedButton(
                style: appsButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultChart(
                        initializedDrills: initializedDrills,
                        drillNumber: 1,
                        drillName: "Drill 1",
                        drillInputLength: "Club length",
                      ),
                    ),
                  );
                },
                child: const Text('Show histogram'),
              ),
            ),
            spaceBetween,
            SizedBox(
              width: 150.0,
              height: 45.0,
              child: ElevatedButton(
                style: appsButtonStyle,
                onPressed: () {
                  int drillNo = 1;
                  List<PuttingResult> drillData = generateTestData(10);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ADifferentTestChart(
                        aDrillNumber: drillNo,
                        drillData: drillData[drillNo],
                      ),
                    ),
                  );
                },
                child: const Text('Different approach'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
