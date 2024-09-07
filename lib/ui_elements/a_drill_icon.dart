import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ADrillIcon extends StatelessWidget {
  final double elementHeight;
  final String drillPicture;

  const ADrillIcon(
      {super.key, required this.elementHeight, required this.drillPicture});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: elementHeight,
      width: elementHeight,
      child: SvgPicture.asset(
        drillPicture,
        semanticsLabel: 'Icon for Drill',
        fit: BoxFit.fill,
        width: elementHeight,
        height: elementHeight,
      ),
    );
  }
}
