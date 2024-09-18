import 'package:flutter/material.dart';

class InputDropDownWidget extends StatefulWidget {
  final double boxWidth;
  final InputDecoration inputDecoration;
  final List<int> choices;
  final String errorMessage;

  const InputDropDownWidget(
      {super.key,
      required this.boxWidth,
      required this.inputDecoration,
      required this.choices,
      required this.errorMessage});

  @override
  InputDropDownWidgetState createState() => InputDropDownWidgetState();
}

class InputDropDownWidgetState extends State<InputDropDownWidget> {
  int theDropDownValue = 0;

  @override
  Widget build(BuildContext context) {
    theDropDownValue = widget.choices[0];
    return SizedBox(
      width: widget.boxWidth,
      child: DropdownButtonFormField<int>(
        style: Theme.of(context).textTheme.headlineMedium!,
        decoration: widget.inputDecoration,
        value: theDropDownValue,
        onChanged: (int? newValue) {
          setState(() {
            theDropDownValue = newValue!;
          });
        },
        items: widget.choices.map((int aChoice) {
          return DropdownMenuItem<int>(
            value: aChoice,
            child: Text(aChoice.toString()),
          );
        }).toList(),
        validator: (value) {
          if (value == null) {
            return widget.errorMessage;
          }
          return null;
        },
      ),
    );
  }
}
