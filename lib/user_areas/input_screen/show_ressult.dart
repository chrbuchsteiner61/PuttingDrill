import 'package:flutter/material.dart';
import 'package:myapp/methods_and_helper/constants.dart';
import 'package:myapp/ui_elements/input_row.dart';
import 'package:myapp/user_areas/input_screen/input_box1.dart';

class ShowRessult extends StatefulWidget {
  final int successfulPutts;
  final int putts;
  final String success;
  final List<double> colPosition;

  const ShowRessult({
    super.key,
    required this.successfulPutts,
    required this.putts,
    required this.success,
    required this.colPosition,
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
      child: Row(
        children: [
          spaceBetween,
          InputBoxNo1(columnWidth: widget.colPosition[0], inputDrillCriteria1: widget.success),
          spaceBetween,
          SizedBox(
            width: widget.colPosition[1],
            child: Text(
                (widget.successfulPutts.toDouble() /
                        widget.putts.toDouble() *
                        100.0)
                    .toString(),
                style: Theme.of(context).textTheme.bodyMedium!),
          ),
          spaceBetween,
          SizedBox(
            width: widget.colPosition[2],
            child: Text(
              "%",
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ),
        ],
      ),
    );
  }
}
