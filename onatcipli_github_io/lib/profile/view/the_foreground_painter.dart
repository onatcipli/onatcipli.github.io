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
      ..strokeWidth=strokeWidth* 2
      ..blendMode = BlendMode.src;
    for (var i = 0; i < removeOffsets.length; i++) {
      final offset = removeOffsets.elementAt(i);
      canvas.drawCircle(offset, strokeWidth, _removePaint);
      if (i + 1 != removeOffsets.length) {
        final nextOffset = removeOffsets.elementAt(i + 1);
        if ((offset.dx.abs() - nextOffset.dx.abs()).abs() > 1 ||
            (offset.dy.abs() - nextOffset.dy.abs()).abs() > 1) {
          canvas..drawLine(offset, nextOffset, _removePaint);
        }
      }
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
