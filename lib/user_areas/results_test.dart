import 'package:flutter/material.dart';
import '../methods_and_helper/database_helper.dart';

class ResultsTest extends StatelessWidget {
  const ResultsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Putting Results')),
      body: FutureBuilder<List<PuttingResult>>(
        future: DatabaseHelper().getResults(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final results = snapshot.data;
          return Column(
            children: [
              Expanded(child: ResultsFromDB(results)),
            ],
          );
        },
      ),
    );
  }
}

class ResultsFromDB extends StatelessWidget {
  final List<PuttingResult>? results;

  const ResultsFromDB(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    double dateInMillis = 0;
    double success = 0;
    String criteria1 = "";
    String criteria2 = "";
    String criteria3 = "";

    for (var result in results!) {
      dateInMillis = DateTime.parse(result.dateOfPractice)
          .millisecondsSinceEpoch
          .toDouble();
      criteria1 = result.criteria1;
      criteria2 = result.criteria2;
      criteria3 = result.criteria3;

      success = result.success;
    }

    return Padding(
      padding: const EdgeInsets.all(36.0),
      child:
          Text("$dateInMillis\n$criteria1 \n$criteria2\n$criteria3\n$success"),
    );
  }
}
