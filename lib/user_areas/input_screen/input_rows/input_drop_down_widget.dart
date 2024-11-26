import 'package:flutter/material.dart';

class InputDropDownWidget<int> extends StatelessWidget {
  final double boxWidth;
  final InputDecoration inputDecoration;
  final List<int> items;
  final int value;
  final void Function(int?) onChanged;
  final String? Function(int?)? validator;

  const InputDropDownWidget({
    super.key,
    required this.boxWidth,
    required this.inputDecoration,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      child: DropdownButtonFormField<int>(
        style: Theme.of(context).textTheme.headlineMedium!,
        decoration: inputDecoration,
        value: value,
        onChanged: onChanged,
        validator: validator,
        isExpanded: true,
        items: items.map((int aChoice) {
          return DropdownMenuItem<int>(
            value: aChoice,
            child: Text(aChoice.toString()),
          );
        }).toList(),
      ),
    );
  }
}
