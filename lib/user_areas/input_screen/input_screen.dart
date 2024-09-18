import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/input_row.dart';
import 'package:myapp/methods_and_helper/drills.dart';
import 'package:myapp/user_areas/input_screen/input_box1.dart';
import 'package:myapp/user_areas/input_screen/input_drop_down_widget.dart';

import 'package:logger/logger.dart';

var logger = Logger();

class InputScreen extends StatefulWidget {
  final String appBarText;
  final String buttonText;
  final String inputDrillCriteria1;
  final String inputDrillCriteria2;
  final String inputDrillCriteria3;
  final String drillInput1;
  final String drillInput2;
  final String drillInput3;
  final Drills aDrill;
  final String errorInputMessageNonEmptyNegativ;

  const InputScreen({
    super.key,
    required this.appBarText,
    required this.buttonText,
    required this.inputDrillCriteria1,
    required this.inputDrillCriteria2,
    required this.inputDrillCriteria3,
    required this.drillInput1,
    required this.drillInput2,
    required this.drillInput3,
    required this.aDrill,
    required this.errorInputMessageNonEmptyNegativ,
  });

  @override
  InputScreenState createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  int _selectedDistance = 0;
  List<int> numberOfExercise = [5, 6, 7, 8, 9, 10];
  int? _putts;
  int? _successfulPutts;
  double col1 = 180;
  double col2 = 70;
  double col3 = 200;

  @override
  Widget build(BuildContext context) {
    Color selectAreaColor = Theme.of(context).scaffoldBackgroundColor;
    InputDecoration inputDecoration = InputDecoration(
        border: InputBorder.none, fillColor: selectAreaColor, filled: true);

    _selectedDistance = widget.aDrill.distances[0];
    _putts = 5;

    // Build the input screen
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarText)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputRow(
                child: Row(
                  children: <Widget>[
                    spaceBetween,
                    InputBoxNo1(
                        columnWidth: col1,
                        inputDrillCriteria1: widget.inputDrillCriteria1),
                    InputDropDownWidget(
                        boxWidth: col2,
                        inputDecoration: inputDecoration,
                        choices: widget.aDrill.distances,
                        errorMessage: widget.errorInputMessageNonEmptyNegativ),
                    spaceBetween,
                    SizedBox(
                      width: col3,
                      child: Text(
                        widget.drillInput1,
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                    ),
                  ],
                ),
              ),
              spaceAfter,
              InputRow(
                child: Row(
                  children: <Widget>[
                    spaceBetween,
                    InputBoxNo1(
                        columnWidth: col1,
                        inputDrillCriteria1: widget.inputDrillCriteria2),
                    InputDropDownWidget(
                        boxWidth: col2,
                        inputDecoration: inputDecoration,
                        choices: numberOfExercise,
                        errorMessage: widget.errorInputMessageNonEmptyNegativ),
                    spaceBetween,
                    SizedBox(
                      width: col3,
                      child: Text(
                        widget.drillInput2,
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                    ),
                  ],
                ),
              ),
              spaceAfter,
              InputRow(
                child: Row(
                  children: <Widget>[
                    spaceBetween,
                    InputBoxNo1(
                        columnWidth: col1,
                        inputDrillCriteria1: widget.inputDrillCriteria3),
                    SizedBox(
                      width: col2,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.headlineMedium!,
                        decoration: inputDecoration,
                        keyboardType: TextInputType.number,
                        onSaved: (value) =>
                            _successfulPutts = int.parse(value!),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return widget.errorInputMessageNonEmptyNegativ;
                          }
                          int? successfulPutts = int.tryParse(value);
                          if (successfulPutts == null) {
                            return widget.errorInputMessageNonEmptyNegativ;
                          }
                          if (successfulPutts < 0) {
                            return widget.errorInputMessageNonEmptyNegativ;
                          }
                          if (successfulPutts > _putts!) {
                            return 'Number of successful putts cannot be more than number of putts';
                          }
                          return null;
                        },
                      ),
                    ),
                    spaceBetween,
                    SizedBox(
                      width: col3,
                      child: Text(
                        widget.drillInput3,
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                    ),
                  ],
                ),
              ),
              spaceAfter,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 125.0,
                      height: 45.0,
                      child: ElevatedButton(
                        style: appsButtonStyle,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            widget.aDrill.criteria1 = _selectedDistance;
                            widget.aDrill.numberOfExercises = _putts!;
                            widget.aDrill.success =
                                _successfulPutts!.toDouble();
                            double successRate =
                                widget.aDrill.calculateSuccessRate();
                            PuttingResult newResult = PuttingResult(
                              drillNo: widget.aDrill.drillNo,
                              criteria1: _selectedDistance,
                              criteria2: _putts!,
                              //unused criteria 3
                              criteria3: -99,
                              success: _successfulPutts!.toDouble(),
                              successRate: successRate,
                              dateOfPractice: DateTime.now().toIso8601String(),
                            );
                            await DatabaseHelper().insertResult(newResult);

                            if (!mounted) return;

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Result saved!')),
                            );
                          }
                        },
                        child: const Text('Save Result'),
                      ),
                    ),
                    spaceBetween,
                    SizedBox(
                      width: 250.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
