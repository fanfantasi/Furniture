import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 420.0,
      ),
      painter: CurvePainter(context: context),
    );
  }
}

class CurvePainter extends CustomPainter {
  final BuildContext context;
  const CurvePainter({required this.context});
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Theme.of(context).colorScheme.background;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
        size.width * 0.10, size.height * 0.55);
    path.lineTo(size.width / 4, 0);
    path.close();

    paint.color = const Color(0xFFe2262f);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
