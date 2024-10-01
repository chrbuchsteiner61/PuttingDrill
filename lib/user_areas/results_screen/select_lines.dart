import 'package:flutter/material.dart';

class SelectLines extends StatelessWidget {
  final List<int> strokes;

  const SelectLines({super.key, required this.strokes});

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    const SizedBox spaceBetween = SizedBox(width: 5.0);
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 5.0, 1.0, 1.0),
      child: Row(
        children: [
          SizedBox(
            height: 36.0,
            width: 60.0,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                ),
                elevation: const WidgetStatePropertyAll(5.0),
                foregroundColor: const WidgetStatePropertyAll(Colors.black),
                backgroundColor: const WidgetStatePropertyAll(Colors.yellow),
              ),
              child: Text(strokes[0].toString()),
            ),
          ),
          spaceBetween,
          SizedBox(
            height: 36.0,
            width: 60.0,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                ),
                elevation: const WidgetStatePropertyAll(5.0),
                foregroundColor: const WidgetStatePropertyAll(Colors.black),
                backgroundColor: const WidgetStatePropertyAll(Colors.red),
              ),
              child: Text(
                strokes[1].toString(),
              ),
            ),
          ),
          spaceBetween,
          SizedBox(
            height: 36.0,
            width: 60.0,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                ),
                elevation: const WidgetStatePropertyAll(5.0),
                foregroundColor: const WidgetStatePropertyAll(Colors.black),
                backgroundColor: const WidgetStatePropertyAll(Colors.blue),
              ),
              child: Text(
                strokes[2].toString(),
              ),
            ),
          ),
          spaceBetween,
          const Text("Club length"),
        ],
      ),
    );
  }
}
