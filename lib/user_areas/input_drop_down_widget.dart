import 'package:flutter/material.dart';

class InputDropDownWidget extends StatefulWidget {
  
  const InputDropDownWidget({super.key, });

  @override
  InputDropDownWidgetState createState() => InputDropDownWidgetState();
}

class InputDropDownWidgetState extends State<InputDropDownWidget> {
  final _formKey = GlobalKey<FormState>();
  int _selectedDistance = 0;
  List<int> numberOfExercise = [5, 6, 7, 8, 9, 10];
  int _putts = 5;
 
 
 
 SizedBox(
                      width: col2,
                      child: DropdownButtonFormField<String>(
                        style: Theme.of(context).textTheme.headlineMedium!,
                        decoration: inputDecoration,
                        value: _selectedDistance.toString(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedDistance = newValue! as int;
                          });
                        },
                        items: widget.aDrill.distance.map((int distance) {
                          return DropdownMenuItem<String>(
                            value: distance.toString(),
                            child: Text(distance.toString()),
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
                    spaceBetween,