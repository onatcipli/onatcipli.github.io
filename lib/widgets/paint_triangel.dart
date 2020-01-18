import 'package:flutter/cupertino.dart';

class PaintTriangle extends CustomPainter {
  final Color backgroundColor;

  PaintTriangle({
    @required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height;
    final x = size.width;

    final paint = Paint()..color = backgroundColor;
    final path = Path();

    path
      ..moveTo(0, y)
      ..lineTo(0, y / 1.2)
      ..lineTo((x / 2), y / 2)
      ..lineTo(x, y / 1.2)
      ..lineTo(x, y);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
