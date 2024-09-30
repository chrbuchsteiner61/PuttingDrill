import 'package:flutter/material.dart';

class SelectLines extends StatelessWidget {
  const SelectLines({super.key});

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(onPressed: onPressed, child: const Text("1 m")),
        ElevatedButton(onPressed: onPressed, child: const Text("2 m")),
        ElevatedButton(onPressed: onPressed, child: const Text("3 m")),
      ],
    );
  }
}
