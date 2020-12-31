import 'package:flutter/material.dart';

class KLDashLine extends StatelessWidget {
  final Axis rDirection;
  final double rWidth;
  final double rHeight;
  final int rCount;
  final Color rColor;

  const KLDashLine(
      {Key key,
      this.rDirection = Axis.horizontal,
      this.rWidth = 5,
      this.rHeight = 1.0,
      this.rCount = 20,
      this.rColor = Colors.red})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: rDirection,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(rCount, (_) {
        return SizedBox(
          width: rWidth,
          height: rHeight,
          child: DecoratedBox(decoration: BoxDecoration(color: rColor)),
        );
      }),
    );
  }
}
