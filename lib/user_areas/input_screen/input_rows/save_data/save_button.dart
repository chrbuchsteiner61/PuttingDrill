import 'package:flutter/material.dart';
import 'package:myapp/ui_definition/constants.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
import 'package:myapp/drills/drill.dart';

class SaveButton extends StatefulWidget {
  final Drill aDrill;
  final String buttonText;

  const SaveButton({
    super.key,
    required this.aDrill,
    required this.buttonText,
  });

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  double successRate = calculateSuccessRate();
    return Padding(
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
                  // widget.aDrill.selectedDistance = _selectedDistance;
                  //  widget.aDrill.numberOfExercises = _putts;
                  //  widget.aDrill.success = _successfulPutts.toDouble();
                  double successRate = widget.aDrill.calculateSuccessRate();
                  PuttingResult newResult = PuttingResult(
                    drillNo: widget.aDrill.drillNo,
                    selectedDistance: widget.aDrill.selectedDistance,
                    numberOfEfforts: widget.aDrill.numberOfExercises,
                    //unused criteria 3
                    criteria3: -99,
                    success: widget.aDrill.success,
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
    );
  }
}
