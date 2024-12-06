import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextWidget<int> extends StatelessWidget {
  final double boxWidth;
  final InputDecoration inputDecoration;
 // final int value;
  final void Function(String?) onChanged;
  final String? Function(int?)? validator;

  const InputTextWidget({
    super.key,
    required this.boxWidth,
    required this.inputDecoration,
   // required this.value,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      child: TextField(
        style: Theme.of(context).textTheme.headlineMedium!,
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: onChanged,
      ),
    );
  }
}
