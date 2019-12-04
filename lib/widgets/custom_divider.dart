import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.7, 0.0),
          // 10% of the width, so there are ten blinds.
          colors: [Color(0xff7F7F85), Color(0xff31313A)],
          // whitish to gray
          tileMode: TileMode.clamp, // repeats the gradient over the canvas
        ),
      ),
    );
  }
}
