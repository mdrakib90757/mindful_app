import 'dart:math';

import 'package:flutter/material.dart';

class BreathingCirclePainter extends CustomPainter {
  final double progress;
  final String inhaleExhaleText;

  BreathingCirclePainter({
    required this.progress,
    required this.inhaleExhaleText,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double strokeWidth = 10.0;
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = (size.shortestSide / 2) - (strokeWidth / 2);

    // Background circle (light blue/grey)
    final Paint backgroundPaint = Paint()
      ..color = Colors.blueGrey.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc (teal/blue)
    final Paint progressPaint = Paint()
      ..shader = LinearGradient(
        colors: [Color(0xFF80DEEA), Color(0xFF00ACC1)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    double sweepAngle = 2 * 3.14159265359 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159265359 / 2,
      sweepAngle,
      false,
      progressPaint,
    );

    // Small circle at the end of the arc
    final Paint markerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final Paint markerBorderPaint = Paint()
      ..color = Color(0xFF00ACC1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    double markerAngle = -3.14159265359 / 2 + sweepAngle;
    Offset markerPosition = Offset(
      center.dx + radius * cos(markerAngle),
      center.dy + radius * sin(markerAngle),
    );
    canvas.drawCircle(markerPosition, strokeWidth / 2 - 2, markerPaint);
    canvas.drawCircle(markerPosition, strokeWidth / 2 - 2, markerBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    BreathingCirclePainter oldPainter = oldDelegate as BreathingCirclePainter;
    return oldPainter.progress != progress ||
        oldPainter.inhaleExhaleText != inhaleExhaleText;
  }
}
