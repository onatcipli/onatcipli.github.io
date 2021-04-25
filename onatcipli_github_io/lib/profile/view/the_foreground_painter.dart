import 'package:flutter/material.dart';

class TheForegroundPainter extends CustomPainter {
  TheForegroundPainter(
    this.strokeWidth,
    this.removeOffsets, {
    required this.color,
  });

  final List<Offset> removeOffsets;

  final double strokeWidth;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(null, Paint());

    var paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color;

    canvas.drawRect(
      Rect.fromPoints(
        Offset.zero,
        Offset(
          size.width,
          size.height,
        ),
      ),
      paint,
    );
    final _removePaint = Paint()
      ..color = Colors.transparent
      ..blendMode = BlendMode.src;
    for (final offset in removeOffsets) {
      canvas.drawCircle(offset, strokeWidth, _removePaint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
