import 'package:flutter/material.dart';

class SelectLines extends StatefulWidget {
  final List<int> strokes;
  final Function(int) onLineSelected; // Callback function
  final int currentLine; // Current line from parent

  const SelectLines({
    super.key,
    required this.strokes,
    required this.onLineSelected,
    required this.currentLine,
  });

  @override
  SelectLinesState createState() => SelectLinesState();
}

class SelectLinesState extends State<SelectLines> {
  @override
  Widget build(BuildContext context) {
    const SizedBox spaceBetween = SizedBox(width: 5.0);

    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 5.0, 1.0, 1.0),
      child: Row(
        children: [
          _buildButton(0, Colors.yellow),
          spaceBetween,
          _buildButton(1, Colors.red),
          spaceBetween,
          _buildButton(2, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildButton(int index, Color color) {
    return SizedBox(
      height: 30.0,
      width: 30.0,
      child: ElevatedButton(
        onPressed: () {
          widget.onLineSelected(index);
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          ),
          elevation: WidgetStateProperty.all(5.0),
          foregroundColor: WidgetStateProperty.all(Colors.black),
          backgroundColor: WidgetStateProperty.all(color),
          alignment: Alignment.center,
          padding: WidgetStateProperty.all(const EdgeInsets.all(0.0)),
        ),
        child: Text(widget.strokes[index].toString(), textAlign: TextAlign.center),
      ),
    );
  }
}
