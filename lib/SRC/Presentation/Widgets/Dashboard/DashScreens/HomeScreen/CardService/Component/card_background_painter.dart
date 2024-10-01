import 'package:flutter/material.dart';

class CardBackgroundPainter extends CustomPainter {
  final Color gred1Color;
  final Color gred2Color;
  final Color circleColor;

  CardBackgroundPainter({
    required this.gred1Color,
    required this.gred2Color,
    required this.circleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    // Gradient background
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.shader = LinearGradient(
      colors: [
        gred1Color,
        gred2Color,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(rect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(20)),
      paint,
    );

    // Half circle
    paint.shader = null;
    paint.color = circleColor.withOpacity(0.25);

    // Clip the canvas to only allow drawing inside the card boundaries
    canvas.save();
    canvas.clipRRect(RRect.fromRectAndRadius(rect, const Radius.circular(20)));

    // Draw the circle slightly outside the card
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width * 0.1, size.height * 0.5),
        radius: size.width * 0.6,
      ),
      -3.9 / 2,
      3.9,
      false,
      paint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
