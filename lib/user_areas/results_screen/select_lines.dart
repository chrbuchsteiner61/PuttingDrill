import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class SelectLines extends StatefulWidget {
  final List<int> strokes;
  final Function(int) onLineSelected; // Callback function
  final int currentLine; // Current line from parent

  const SelectLines(
      {super.key,
      required this.strokes,
      required this.onLineSelected,
      required this.currentLine});

  @override
    SelectLinesState createState() => SelectLinesState();
}

class SelectLinesState extends State<SelectLines> {
  int lineNo = 0;

  @override
  Widget build(BuildContext context) {
    const SizedBox spaceBetween = SizedBox(width: 5.0);

    logger.d(lineNo);
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 5.0, 1.0, 1.0),
      child: Row(
        children: [
          SizedBox(
            height: 36.0,
            width: 60.0,
            child: ElevatedButton(
              onPressed: () {
                widget.onLineSelected(0);
              },
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                ),
                elevation: const WidgetStatePropertyAll(5.0),
                foregroundColor: const WidgetStatePropertyAll(Colors.black),
                backgroundColor: const WidgetStatePropertyAll(Colors.yellow),
              ),
              child: Text(widget.strokes[0].toString()),
            ),
          ),
          spaceBetween,
          SizedBox(
            height: 36.0,
            width: 60.0,
            child: ElevatedButton(
              onPressed: () {
               widget.onLineSelected(1);
              },
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
                widget.strokes[1].toString(),
              ),
            ),
          ),
          spaceBetween,
          SizedBox(
            height: 36.0,
            width: 60.0,
            child: ElevatedButton(
              onPressed: () {
                widget.onLineSelected(2);
              },
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
                widget.strokes[2].toString(),
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
