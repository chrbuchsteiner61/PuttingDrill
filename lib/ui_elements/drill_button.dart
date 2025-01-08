import 'package:flutter/material.dart';

// Reusable button widget
class DrillButton extends StatelessWidget {
  final double width;
  final double height;
  final ButtonStyle style;
  final VoidCallback onPressed;
  final String text;
  final Alignment? alignment;

  const DrillButton({
    super.key,
    required this.width,
    required this.height,
    required this.style,
    required this.onPressed,
    required this.text,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: alignment != null
            ? Align(
                alignment: alignment!,
                child: Text(text),
              )
            : Text(text),
      ),
    );
  }
}
