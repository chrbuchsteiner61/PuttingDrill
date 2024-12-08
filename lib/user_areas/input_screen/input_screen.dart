import 'package:flutter/material.dart';
import 'package:myapp/drills/drill.dart';
import 'package:myapp/user_areas/input_screen/input_rows/input_attempts/input_attempts.dart';
import 'package:myapp/user_areas/input_screen/input_rows/input_distance/input_distance.dart';
import 'package:myapp/user_areas/input_screen/input_rows/input_success/input_success.dart';
import 'package:myapp/user_areas/input_screen/input_rows/save_data/save_button.dart';
import 'package:myapp/user_areas/input_screen/input_rows/show_success_rate/show_success_rate.dart';

class InputScreen extends StatefulWidget {
  final String appBarText;
  final Drill aDrill;
  final String inputDrillCriteria1;
  final String inputDrillCriteria2;
  final String inputDrillCriteria3;
  final String drillInput1;
  final String drillInput2;
  final String drillInput3;
  final String errorInputMessageNonEmptyNegativ;
  final String buttonText;
  final String successText;

  const InputScreen({
    super.key,
    required this.appBarText,
    required this.aDrill,
    required this.inputDrillCriteria1,
    required this.inputDrillCriteria2,
    required this.inputDrillCriteria3,
    required this.drillInput1,
    required this.drillInput2,
    required this.drillInput3,
    required this.errorInputMessageNonEmptyNegativ,
    required this.buttonText,
    required this.successText,
  });

  @override
  InputScreenState createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
  @override
  void initState() {
    super.initState();
    _selectedDistance = widget.aDrill.distances[0];
    _putts = widget.aDrill.numberOfExercises;
    _successfulPutts = widget.aDrill.success;
    _missedDistanceFeet = widget.aDrill.success;
  }

  List<int> numberOfExercises = [5, 6, 7, 8, 9, 10];
  // initialize
  int _selectedDistance = 99;
  int _putts = 99;
  double _successfulPutts = 99.9;
  double _missedDistanceFeet = 99.9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarText)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InputDistance(
                  aDrill: widget.aDrill,
                  inputDrillCriteria1: widget.inputDrillCriteria1,
                  drillInput1: widget.drillInput1,
                  errorInputMessageNonEmptyNegativ:
                      widget.errorInputMessageNonEmptyNegativ,
                  onDistanceChanged: (value) {
                    setState(() {
                      _selectedDistance = value!;
                      widget.aDrill.selectedDistance = _selectedDistance;
                    });
                  },
                  selectedDistance: _selectedDistance,
                ),
                InputAttempts(
                    aDrill: widget.aDrill,
                    inputDrillCriteria2: widget.inputDrillCriteria2,
                    drillInput2: widget.drillInput2,
                    errorInputMessageNonEmptyNegativ:
                        widget.errorInputMessageNonEmptyNegativ,
                    numberOfExercises: numberOfExercises,
                    putts: _putts,
                    onPuttsChanged: (value) {
                      setState(() {
                        _putts = value!;
                        widget.aDrill.numberOfExercises = _putts;
                      });
                    }),
                InputSuccess(
                  aDrill: widget.aDrill,
                  inputDrillCriteria3: widget.inputDrillCriteria3,
                  drillInput3: widget.drillInput3,
                  errorInputMessageNonEmptyNegativ:
                      widget.errorInputMessageNonEmptyNegativ,
                  putts: _putts,
                  onSuccessfullPutts: (int? value) {
                    setState(() {
                      _successfulPutts = value!.toDouble();
                      widget.aDrill.success = _successfulPutts;
                    });
                  },
                  onSuccessDistance: (String? value) {
                    setState(() {
                      _missedDistanceFeet = double.parse(value!);
                      widget.aDrill.success = _missedDistanceFeet;
                    });
                  },
                ),
                ShowSuccessRate(
                  aDrill: widget.aDrill,
                  putts: _putts,
                  selectedDistance: _selectedDistance,
                  successfulPutts: _successfulPutts,
                  missedDistanceFeet: _missedDistanceFeet,
                  successText: widget.successText,
                ),
                SaveButton(
                  aDrill: widget.aDrill,
                  buttonText: widget.buttonText,
                  selectedDistance: _selectedDistance,
                  putts: _putts,
                  successfulPutts: _successfulPutts,
                  missedDistanceFeet: _missedDistanceFeet,
                )
              ]),
        ),
      ),
    );
  }
}
