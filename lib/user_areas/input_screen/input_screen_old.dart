import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
import 'package:myapp/ui_definition/constants.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_wrap.dart';
import 'package:myapp/drills/drill.dart';
import 'package:myapp/user_areas/input_screen/input_rows/input_success/input_success.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/input_rows/input_attempts/input_attempts.dart';
import 'package:myapp/user_areas/input_screen/input_widgets/input_drop_down_widget.dart';

import 'package:logger/logger.dart';
import 'package:myapp/user_areas/input_screen/input_rows/show_success_rate/show_success_rate.dart';

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
  final Drill aDrill;
  final String errorInputMessageNonEmptyNegativ;
  final String success;

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
    required this.success,
  });

  @override
  InputScreenState createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedDistance = widget.aDrill.distances[0];
    _putts = widget.aDrill.numberOfExercises;
    _successfulPutts = widget.aDrill.success.toInt();
    _missedDistanceFeet = widget.aDrill.success;
  }

  List<int> numberOfExercises = [5, 6, 7, 8, 9, 10];
  // initialize
  int _selectedDistance = 99;
  int _putts = 99;
  int _successfulPutts = 99;
  double _missedDistanceFeet = 99.9;
  // ui
  List<double> colPosition = [130, 80, 120];

  @override
  Widget build(BuildContext context) {
    Color selectAreaColor = Theme.of(context).scaffoldBackgroundColor;
    InputDecoration inputDecoration = InputDecoration(
      border: InputBorder.none,
      fillColor: selectAreaColor,
      filled: true,
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarText)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputRowWrap(
                child: Row(
                  children: <Widget>[
                    spaceBetween,
                    InputRowBox1(
                        columnWidth: colPosition[0],
                        inputDrillCriteria1: widget.inputDrillCriteria1),
                    InputDropDownWidget(
                      boxWidth: colPosition[1],
                      inputDecoration: inputDecoration,
                      items: widget.aDrill.distances,
                      value: _selectedDistance,
                      onChanged: (value) {
                        setState(() {
                          _selectedDistance = value!;
                          widget.aDrill.selectedDistance = _selectedDistance;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return widget.errorInputMessageNonEmptyNegativ;
                        }
                        return null;
                      },
                    ),
                    spaceBetween,
                    SizedBox(
                      width: colPosition[2],
                      child: Text(
                        widget.drillInput1,
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                    ),
                  ],
                ),
              ),
              spaceAfter,
              // Replaced second InputRow with InputCriteria2
              InputAttempts(
                  inputDrillCriteria2: widget.inputDrillCriteria2,
                  errorInputMessageNonEmptyNegativ:
                      widget.errorInputMessageNonEmptyNegativ,
                  drillInput2: widget.drillInput2,
                  colPosition: colPosition,
                  inputDecoration: inputDecoration,
                  putts: _putts,
                  numberOfExercises: numberOfExercises,
                  onPuttsChanged: (value) {
                    setState(() {
                      _putts = value!;
                      widget.aDrill.numberOfExercises = _putts;
                    });
                  }),
              spaceAfter,
              // Third input row
              InputSuccess(
                aDrill: widget.aDrill,
                inputDrillCriteria3: widget.inputDrillCriteria3,
                drillInput3: widget.drillInput3,
                errorInputMessageNonEmptyNegativ:
                    widget.errorInputMessageNonEmptyNegativ,
                colPosition: colPosition,
                rowHeight: rowHeight,
                inputDecoration: inputDecoration,
                putts: _putts,
                onSuccessfullPutts: (int? value) {
                  setState(() {
                    _successfulPutts = value!;
                    widget.aDrill.success = _successfulPutts.toDouble();
                  });
                },
                onSuccessDistance: (String? value) {
                  setState(() {
                    _missedDistanceFeet = double.parse(value!);
                    widget.aDrill.success = _missedDistanceFeet;
                  });
                },
              ),
              spaceAfter,
              // show results of row 2 and row 3
              ShowSuccessRate(
                  aDrill: widget.aDrill,
                  rowHeight: rowHeight,
                  //  successfulPutts: _successfulPutts,
                  //  putts: _putts,
                  successText: widget.success,
                  colPosition: colPosition),
              spaceAfter,
              // button for save results
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 200.0,
                      height: 50.0,
                      child: ElevatedButton(
                        style: appsButtonStyle,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            widget.aDrill.selectedDistance = _selectedDistance;
                            widget.aDrill.numberOfExercises = _putts;
                            widget.aDrill.success = _successfulPutts.toDouble();
                            double successRate =
                                widget.aDrill.calculateSuccessRate();
                            PuttingResult newResult = PuttingResult(
                              drillNo: widget.aDrill.drillNo,
                              selectedDistance: _selectedDistance,
                              numberOfEfforts: _putts,
                              //unused criteria 3
                              criteria3: -99,
                              success: _successfulPutts.toDouble(),
                              successRate: successRate,
                              dateOfPractice: DateTime.now().toIso8601String(),
                            );
                            await DatabaseHelper().insertResult(newResult);

                            if (!mounted) return;
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Result saved!')),
                              );
                            }
                          }
                        },
                        child: Text(widget.buttonText),
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