import "package:flutter/material.dart";

class HorizontalDottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 1, dashSpace = 1, startX = 0;
    final paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..strokeWidth = size.height;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX,0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}