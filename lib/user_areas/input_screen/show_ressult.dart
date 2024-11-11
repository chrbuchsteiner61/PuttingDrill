import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/input_row.dart';
import 'package:myapp/user_areas/input_screen/input_row_box1.dart';
import 'package:myapp/user_areas/input_screen/input_row_box3.dart';

class ShowRessult extends StatefulWidget {
  final int successfulPutts;
  final int putts;
  final String success;
  final List<double> colPosition;
  final double rowHeight;

  const ShowRessult({
    super.key,
    required this.successfulPutts,
    required this.putts,
    required this.success,
    required this.colPosition,
    required this.rowHeight
  });

  @override
  State<ShowRessult> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowRessult> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputRow(
      aHeight: widget.rowHeight,
      child: Row(
        children: [
          spaceBetween,
          InputRowBox1(
              columnWidth: widget.colPosition[0],
              inputDrillCriteria1: widget.success),
          spaceBetween,
          SizedBox(
            width: widget.colPosition[1],
            child: Text(
                (widget.successfulPutts.toDouble() /
                        widget.putts.toDouble() *
                        100.0)
                    .toStringAsFixed(2),
                style: Theme.of(context).textTheme.bodyMedium!),
          ),
          spaceBetween,
          InputRowBox3(
            rowHeight: widget.rowHeight,
            colPosition: widget.colPosition[2],
            drillInput: "%",
          ),
        ],
      ),
    );
  }
}
