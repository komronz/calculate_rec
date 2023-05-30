import 'package:flutter/material.dart';

class RhombusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = (3.0);

    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RhombusContainer extends StatelessWidget {
  final double width;
  final double height;
  RhombusContainer({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final checkSize = width < 100 || height < 100;
    return Container(
      margin: EdgeInsets.all(20),
      width: width > 270
          ? 270
          : checkSize
              ? (width - 100) + width
              : width,
      height: height > 270
          ? 270
          : checkSize
              ? (100 - height) + height
              : height,
      child: CustomPaint(
        painter: RhombusPainter(),
      ),
    );
  }
}
