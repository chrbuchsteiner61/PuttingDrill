import "package:flutter/material.dart";
import 'package:myapp/methods_and_helper/constants.dart';

class InputRowWrap extends StatelessWidget {
  final Widget box1;
  final Widget box2;
  final Widget box3;

  const InputRowWrap(
      {super.key, required this.box1, required this.box2, required this.box3});

  @override
  Widget build(BuildContext context) {
    const double aHeight = 75;
    const List<double> colWidth = [130, 80, 120];
    return Container(
      height: aHeight,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: theBorderRadius,
          border: Border.all(width: 3.0, color: Colors.green)),
      margin: const EdgeInsets.only(top: 12.0),
      child: Row(
        children: <Widget>[
          spaceBetween,
          SizedBox(
            width: colWidth[0],
            child: box1,
          ),
          SizedBox(
            width: colWidth[1],
            child: box2,
          ),
          spaceBetween,
          SizedBox(
            width: colWidth[2],
            child: box3,
          ),
        ],
      ),
    );
  }
}
