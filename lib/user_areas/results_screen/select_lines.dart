import 'package:flutter/material.dart';
import 'package:myapp/ui_definition/constants.dart';

class SelectLines extends StatefulWidget {
  final List<int> distancesToSelectFrom;
  final Function(int) onLineSelected; // Callback function
  final int currentLine; // Current line from parent

  const SelectLines({
    super.key,
    required this.distancesToSelectFrom,
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
    int numberOfButtons = widget.distancesToSelectFrom.length;

    List<Widget> selectColorButton = [];

    for (int i = 0; i < numberOfButtons; i++) {
      selectColorButton.add(_buildButton(i, barColors[i]));
      selectColorButton.add(spaceBetween);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 5.0, 1.0, 1.0),
      child: Row(
        children: selectColorButton,
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
        child: Text(widget.distancesToSelectFrom[index].toString(),
            textAlign: TextAlign.center),
      ),
    );
  }
}
