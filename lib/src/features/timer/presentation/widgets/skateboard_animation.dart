import 'package:flutter/material.dart';

class SkateboardAnimation extends StatelessWidget {
  final Animation<double> animation;

  const SkateboardAnimation({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: SkateboardPainter(animation.value),
        child: const SizedBox(width: 10, height: 20),
      ),
    );
  }
}

class SkateboardPainter extends CustomPainter {
  final double position;

  SkateboardPainter(this.position);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 6;

    // Kopf
    canvas.drawCircle(Offset(position, 50), 10, paint);
    // Körper
    canvas.drawLine(Offset(position, 60), Offset(position, 100), paint);
    // Arme
    canvas.drawLine(Offset(position, 70), Offset(position - 20, 90), paint);
    canvas.drawLine(Offset(position, 70), Offset(position + 20, 90), paint);
    // Beine
    canvas.drawLine(Offset(position, 110), Offset(position - 15, 120), paint);
    canvas.drawLine(Offset(position, 100), Offset(position + 15, 130), paint);

    // Skateboard
    final skateboardPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 7;

    // Skateboard Deck
    canvas.drawLine(Offset(position - 25, 127), Offset(position + 25, 127), skateboardPaint);

    // Skateboard Wheels
    canvas.drawCircle(Offset(position - 15, 135), 5, skateboardPaint);
    canvas.drawCircle(Offset(position + 15, 135), 5, skateboardPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
