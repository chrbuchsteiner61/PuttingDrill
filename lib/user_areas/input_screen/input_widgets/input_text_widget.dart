import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextWidget<int> extends StatelessWidget {
  final void Function(String?) onChanged;
  final String? Function(int?)? validator;

  const InputTextWidget({
    super.key,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.headlineMedium!,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onChanged,
    );
  }
}
