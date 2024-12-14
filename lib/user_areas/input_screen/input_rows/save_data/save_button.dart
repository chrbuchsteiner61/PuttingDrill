import 'package:flutter/material.dart';
import 'package:myapp/ui_definition/constants.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
//import 'package:myapp/drills/drill.dart';

class SaveButton extends StatefulWidget {
  final int numberOfDrill;
  final int selectedDistance;
 final int putts;
//  final double successfulPutts;
 // final double missedDistanceFeet;
  final double successRate;
  final String buttonText;

  const SaveButton({
    super.key,
    required this.numberOfDrill,
    required this.selectedDistance,
    required this.putts,
 //   required this.successfulPutts,
 //   required this.missedDistanceFeet,
    required this.successRate,
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
                 
                  PuttingResult newResult = PuttingResult(
                    drillNo: widget.numberOfDrill,
                    selectedDistance: widget.selectedDistance,
                   numberOfEfforts: widget.putts,
                    //unused criteria 3
                  //  criteria3: -99,
                    
                    successRate: widget.successRate,
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
