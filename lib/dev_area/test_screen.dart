import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:myapp/dev_area/test_data.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';

var logger = Logger();

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

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
                  List<PuttingResult> resultsForTest = generateTestData(50);
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
          ],
        ),
      ),
    );
  }
}
