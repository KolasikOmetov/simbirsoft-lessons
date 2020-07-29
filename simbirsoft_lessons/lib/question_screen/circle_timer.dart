import 'package:flutter/material.dart';
import 'dart:math' show pi;

class CircleTimer extends CustomPainter {
  final Animation<double> animation;

  Paint _paintCircle = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.fill;

  CircleTimer({this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    double progress = (1.0 - animation.value) * 2 * pi;
    Offset center = Offset(-5, 0);
    Rect rect = Rect.fromCircle(center: center, radius: 15);
    Path path = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(rect, pi * 3 / 2, -progress, false);
    canvas.drawPath(path, _paintCircle);
  }

  @override
  bool shouldRepaint(CircleTimer old) {
    return animation.value == old.animation.value;
  }
}
