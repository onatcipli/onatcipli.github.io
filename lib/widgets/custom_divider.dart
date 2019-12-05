import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomDivider extends StatelessWidget {
  final Axis direction;

  final double thickness;

  final SizingInformation sizingInformation;

  const CustomDivider({
    Key key,
    this.direction = Axis.horizontal,
    this.thickness = 1.0,
    this.sizingInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          direction == Axis.horizontal ? thickness : 300,
      width: direction == Axis.horizontal ? sizingInformation.localWidgetSize.width : thickness,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: direction == Axis.horizontal
              ? Alignment.centerLeft
              : Alignment.center,
          end: direction == Axis.horizontal
              ? Alignment(0.7, 0.0)
              : Alignment(0.0, 0.7),
          // 10% of the width, so there are ten blinds.
          colors: [Color(0xff7F7F85), Color(0xff31313A)],
          // whitish to gray
          tileMode: TileMode.clamp, // repeats the gradient over the canvas
        ),
      ),
    );
  }
}
