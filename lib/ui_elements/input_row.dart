import "package:flutter/material.dart";
import 'package:myapp/methods_and_helper/constants.dart';

class InputRow extends StatelessWidget {
  final Widget child;
  final double aHeight;

  const InputRow({super.key, required this.aHeight, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: aHeight,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: theBorderRadius,
          border: Border.all(width: 3.0, color: Colors.green)),
      child: child,
    );
  }
}
