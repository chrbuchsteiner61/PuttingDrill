import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/database_helper.dart';
import 'package:myapp/methods_and_helper/constants.dart';

enum DistanceLabel {
  one('1 ', 1),
  two('2 ', 2),
  three('3 ', 3);

  final String label;
  final int value;

  const DistanceLabel(this.label, this.value);
}

class InputScreen extends StatefulWidget {
  final String appBarText;
  final String inputDrillCriteria1;
  final String inputDrillDistanceText;
  final String inputDrillCriteria2;
  final String inputDrillCriteria3;
  final String buttonText;
  final String drillInput1;
  final String drillInput2;
  final String drillInput3;

  const InputScreen({
    super.key,
    required this.appBarText,
    required this.buttonText,
    required this.inputDrillCriteria1,
    required this.inputDrillDistanceText,
    required this.inputDrillCriteria2,
    required this.inputDrillCriteria3,
    required this.drillInput1,
    required this.drillInput2,
    required this.drillInput3,
  });

  @override
  InputScreenState createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  DistanceLabel? _selectedDistance = DistanceLabel.one;
  int _putts = 5;
  int? _successfulPutts;

  @override
  Widget build(BuildContext context) {
    //  final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarText)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  spaceBetween,
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.inputDrillCriteria1,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                    child: DropdownButtonFormField<DistanceLabel>(
                      decoration: const InputDecoration(
                          // labelText: widget.inputDrillDistanceText,
                          fillColor: Colors.white,
                          filled: true),
                      value: _selectedDistance,
                      onChanged: (DistanceLabel? newValue) {
                        setState(() {
                          _selectedDistance = newValue!;
                        });
                      },
                      items: DistanceLabel.values.map((DistanceLabel distance) {
                        return DropdownMenuItem<DistanceLabel>(
                          value: distance,
                          child: Text(distance.label),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a distance';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.inputDrillDistanceText,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  spaceBetween,
                  SizedBox(
                      width: 200,
                      child: Text(
                        widget.inputDrillCriteria2,
                        style: Theme.of(context).textTheme.bodyMedium!,
                      )),
                  SizedBox(
                    width: 100.0,
                    child: DropdownButtonFormField<int>(
                      decoration: const InputDecoration(
                          fillColor: Colors.white, filled: true),
                      value: _putts,
                      onChanged: (int? newValue) {
                        setState(() {
                          _putts = newValue!;
                        });
                      },
                      items: [5, 6, 7, 8, 9, 10].map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  spaceBetween,
                  ColoredBox(
                    color: Colors.white,
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        widget.inputDrillCriteria3,
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onSaved: (value) => _successfulPutts = int.parse(value!),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the number of successful putts';
                        }
                        int? successfulPutts = int.tryParse(value);
                        if (successfulPutts == null) {
                          return 'Please enter a valid number';
                        }
                        if (successfulPutts < 0) {
                          return 'Number of successful putts cannot be negative';
                        }
                        if (successfulPutts > _putts) {
                          return 'Number of successful putts cannot be more than number of putts';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      double successRate = (_successfulPutts! / _putts) * 100;
                      PuttingResult newResult = PuttingResult(
                        distance: _selectedDistance!.value,
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
            ],
          ),
        ),
      ),
    );
  }
}
