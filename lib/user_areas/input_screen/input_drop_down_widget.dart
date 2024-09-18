import 'package:flutter/material.dart';

class InputDropDownWidget extends StatelessWidget {
  final double boxWidth;
  final InputDecoration inputDecoration;
  final List<int> choices;
  final String errorMessage;

  const InputDropDownWidget({
    super.key,
    required this.boxWidth,
    required this.inputDecoration,
    required this.choices,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    int theDropDownValue = 0;
    theDropDownValue = choices[0];
    return SizedBox(
      width: boxWidth,
      child: DropdownButtonFormField<int>(
        style: Theme.of(context).textTheme.headlineMedium!,
        decoration: inputDecoration,
        value: theDropDownValue,
        onChanged: (value) {
          if (value != null) {
            theDropDownValue = value;
          }
        },
        items: choices.map((int aChoice) {
          return DropdownMenuItem<int>(
            value: aChoice,
            child: Text(aChoice.toString()),
          );
        }).toList(),
        validator: (value) {
          if (value == null) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
}
